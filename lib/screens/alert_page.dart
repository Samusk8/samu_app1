import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  //const AlertPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
        elevation: 2,
      ),
      body: Center(
        child: ElevatedButton(
          child:Text('Alerta'),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.red,
            shape: StadiumBorder(),
          ),
          onPressed: () => _mostrarAlert(context),
          
        ),
      ),
    );
  }
  void _mostrarAlert(BuildContext context){
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context){
        return AlertDialog(
          title: Text('Titulo'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Contenido de la alerta'),
              FlutterLogo(size: 50.0,)
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Ok'),
            ),
            
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0)
          ),
        );
      }
    );
  }
}