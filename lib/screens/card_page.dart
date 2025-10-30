import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
        elevation: 2,
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
                    _cardType2(),
          SizedBox(height: 30.0,),
          _cardType1(),
          SizedBox(height: 30.0,),
          _cardType2(),
          SizedBox(height: 30.0,),
          _cardType1(),
          SizedBox(height: 30.0,),
          _cardType1(),
          SizedBox(height: 30.0,),
          _cardType2(),
          SizedBox(height: 30.0,),
          _cardType1(),
          SizedBox(height: 30.0,),
          _cardType2(),
          SizedBox(height: 30.0,),
          _cardType1(),
          SizedBox(height: 30.0,),
          _cardType2(),
          SizedBox(height: 30.0,),
        ],
      ),
    );
  }

  Widget _cardType1(){
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30)
      ),
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
     final tarjeta = Card(
      //elevation: 10.0,
      //clipBehavior: Clip.antiAlias,
       child: Column(
         children: [
            /*Image(
              image: NetworkImage('https://fastly.picsum.photos/id/237/600/300.jpg?hmac=iRVPLLVQxFogSDvoPLrs3stJmz9g636YRQiWCDrU5MM')
            ),*/
            FadeInImage(
              
              placeholder:  AssetImage('assets/jar-loading.gif'),
              image: NetworkImage('https://fastly.picsum.photos/id/237/600/300.jpg?hmac=iRVPLLVQxFogSDvoPLrs3stJmz9g636YRQiWCDrU5MM'),
              fadeInDuration: Duration(milliseconds: 100),
              height: 250,
              fit: BoxFit.cover,
            ),
            Container(
              child: Text('Imagen de un perrete'),
              padding: EdgeInsets.all(10),
            ),

         ],
       ),
     );
     return Container(
        child: ClipRRect(
          child: tarjeta,
          borderRadius: BorderRadius.circular(30.0),
        
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          //color: Colors.red,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
              spreadRadius: 2.0,
              offset: Offset(2.0,10.0)
            )
          ],
          color: Colors.white
         
        ),
      );
    }

}