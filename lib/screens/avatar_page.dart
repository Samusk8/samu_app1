import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  //const AvatarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        elevation: 2,
        actions: [
          Container(
            margin: EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://i.pinimg.com/736x/e9/33/2c/e9332cb6146d5a181cc5565282b84b6c.jpg'),
              radius: 30.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text('SJ'),
              backgroundColor: Colors.blue,
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(placeholder: AssetImage('assets/jar-loading.gif'), image: NetworkImage('https://i.pinimg.com/736x/c4/e4/38/c4e43831f0a455fb7b4d80e1b0b3abc3.jpg')),
      ),
    );
  }
}