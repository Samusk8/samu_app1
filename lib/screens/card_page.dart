import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: [
          _cardType1(),
          SizedBox(height: 30.0,),
          _cardType2(),
          SizedBox(height: 30.0,),
          _cardType1(),
          SizedBox(height: 30.0,),
        ],
      ),
    );
  }

  Widget _cardType1(){
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue,),
            title: Text('Titulo prueba'),
            subtitle: Text('Subtitulo de la prueba que estamos haciendo para ver como queda esto en pantalla.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(onPressed: (){}, child: Text('OK'),),
              TextButton(onPressed: (){}, child: Text('CANCEL'),),
            ],
          )
        ],
      ),
    );
  }

  Widget _cardType2() {
     return Card(
       child: Column(
         children: [
            /*Image(
              image: NetworkImage('https://fastly.picsum.photos/id/237/600/300.jpg?hmac=iRVPLLVQxFogSDvoPLrs3stJmz9g636YRQiWCDrU5MM')
            ),*/
            /*FadeInImage(
              
              placeholder: placeholder, 
              image: image
            ),*/
            Container(
              child: Text('Imagen de un perrete'),
              padding: EdgeInsets.all(10),
            )

         ],
       ),
     );
    }

}