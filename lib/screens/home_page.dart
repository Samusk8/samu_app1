import 'package:flutter/material.dart';
import 'package:samu_app1/providers/menu_providers.dart';
import 'package:samu_app1/utils/icon_string_util.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Components'),
        elevation: 2,
      ),
      body: _list(),
    );
  }
}

Widget _list() {
  /*menuProvider.loadData().then((data){
    print('Lista: ');
    print(data);
  });*/
  return FutureBuilder(
    future: menuProvider.loadData(),
    initialData: [],
    builder: (context, AsyncSnapshot<List<dynamic>> snapshot){
      print('builder');
      print(snapshot.data);
      return ListView(
        children: _elementsList(snapshot.data, context),
      );
    },
  );
}

List<Widget> _elementsList(List<dynamic>? data, BuildContext context) {
  final List<Widget> elements =  [];
  data?.forEach((element){
    final widgetTemp = ListTile(
      title: Text(element['texte']),
      leading: getIcon(element['icona']),
      trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue,),
      onTap: (){
        Navigator.pushNamed(context, element['ruta']);
      },
    );
    elements..add(widgetTemp)
            ..add(Divider());
    
  });
  print(menuProvider.options);
  return elements;
}