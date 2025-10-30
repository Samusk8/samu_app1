import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({super.key});

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {

  double _valorSlider = 100.0;
  bool _valorCheckBox = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
        elevation: 2,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50),
        child: Column(
          children: [
            _crearSlider(),
            _crearCheckBox(),
            _crearSwitch(),
            Expanded(child: _crearImatge()),
          ],
        ),
      ),
    );
  }
  Widget _crearSlider(){
    return Slider(
      activeColor: Colors.red,
      label: 'Grandaria de la imagen',
      //divisions: 20,
      value: _valorSlider,
      min: 10,
      max: 400,
      onChanged: (_valorCheckBox) ? null : (value) {
        setState(() {
          _valorSlider = value;
        });
      },
    );
  }
  Widget _crearImatge(){
    return Image(
      image: NetworkImage('https://i.pinimg.com/736x/c4/e4/38/c4e43831f0a455fb7b4d80e1b0b3abc3.jpg'),
      width: _valorSlider,
      fit: BoxFit.contain,
      
    );
  }
  Widget _crearCheckBox() {
   return CheckboxListTile(
      title: Text('Bloquear slider'),
     value: _valorCheckBox,
     onChanged: (estado){
       _valorCheckBox = estado!;
     }
   );
 } 
  Widget _crearSwitch() {
   return SwitchListTile(
     title: Text('Desbloquejar Slider'),
     value: _valorCheckBox,
     onChanged: (estat){
       setState(() {
         _valorCheckBox = estat;
       });
     }
   );
 }



}