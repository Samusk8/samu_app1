import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';



class InputsPage extends StatefulWidget {
  const InputsPage({super.key});

  @override
  State<InputsPage> createState() => _InputsPageState();
}

class _InputsPageState extends State<InputsPage> {

  String _nombre = '';
  String _email = '';
  String _fecha = '';
  String _pais = 'España';
  TextEditingController _inputFieldFechaController =TextEditingController();
  List<String> _paises = ['Andorra','Inglaterra','Dinamarca','España','Francia'];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs'),
        elevation: 2,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 20,
        ),
        children: [
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropdown(),
          Divider(),
          _crearPersona(),
        ],
      ),
    );
  }


  _crearInput() {
    return TextField(
      //autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        counter: Text('Letras ${_nombre.length}'),
        hintText: 'Nombre del Usuario',
        labelText: 'Nombre',
        helperText: 'Escriba el nombre completo',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)
        )
        
      ),
      onChanged: (value) {
        setState(() {
          _nombre = value;
          print(_nombre);
        });
      },
    );
  }


    _crearEmail() {
    return TextField(
      //autofocus: true,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        
        hintText: 'Correo Electronico',
        labelText: 'Correo',
        //helperText: 'Escriba el Correo completo',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)
        )
        
      ),
      onChanged: (value) {
        setState(() {
          _email = value;
          print(_email);
        });
      },
    );
  }


    _crearPassword() {
    return TextField(
      //autofocus: true,
      obscureText: true,
      decoration: InputDecoration(
        
        hintText: 'Password',
        labelText: 'Password',
        suffixIcon: Icon(Icons.lock_open),
        icon: Icon(Icons.lock),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)
        )
        
      ),
      onChanged: (value) {
        setState(() {
          _nombre = value;
          print(_nombre);
        });
      },
    );
  }


  _crearFecha(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldFechaController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        hintText: 'Fecha de nacimiento',
        labelText: 'Fecha de nacimiento',
        suffixIcon: Icon(Icons.perm_contact_calendar),
        icon: Icon(Icons.calendar_today)
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _seleccionaFecha(context);
      },
    );
  }


  void _seleccionaFecha(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      //locale: Locale('es','Es'),
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030)
    );
    if (picked != null){
      setState((){
        _fecha = picked.toString();
        _inputFieldFechaController.text = _fecha;
      }
    );
   }

    
  }

  _crearDropdown() {
    return Row(
      children: [
        Icon(Icons.language),
        SizedBox(width: 30),
        Expanded(
          child: DropdownButton(
            value: _pais,
            items: getOptionDropdown(),
            onChanged: (option) {
              setState(() {
                _pais = option as String;
              });
            },
          ),
        ),
      ],
    );

  }

  List<DropdownMenuItem<String>> getOptionDropdown() {
    List<DropdownMenuItem<String>> lista = [];
    _paises.forEach((pais) {
      lista.add(DropdownMenuItem(
        child: Text(pais),
        value: pais,
      ));
    });
    return lista;
 }

  _crearPersona() {
    return ListTile(
      title: Text('Nombre: $_nombre'),
      subtitle: Text('Correo: $_email'),
      trailing: Text(_pais),
    );
  }
}