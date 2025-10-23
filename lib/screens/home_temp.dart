import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
   final elements =['Element 1','Element 2','Element 3','Element 4'];
  //const HomePageTemp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Components Temp',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Components Temp'),
        ),
        body: ListView(
          children: _createElementShort(),

        )
      ),
    );
  }

  List<Widget> _createElements(){
    List<Widget> list = [];
    for (String element in elements) {
      final tempWidget = ListTile(
        title: Text(element)
      );
    }
    return list;
  }
  List<Widget> _createElementShort(){
    var widgets = elements.map((element) {
      return Column(
        children: [
          ListTile(
            title: Text(element),
            subtitle: Text(''),
            leading: Icon(Icons.airplanemode_active),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: (){},
          ),
        ],
      );
    });
    return widgets.toList();
  }

}