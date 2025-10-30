import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:samu_app1/routes/routes.dart';
import 'package:samu_app1/screens/alert_page.dart';
import 'package:samu_app1/screens/avatar_page.dart';
import 'package:samu_app1/screens/home_page.dart';
import 'package:samu_app1/screens/home_temp.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Components',
      //home: HomePage(),
      initialRoute: '/',
      routes: getRoutes(),
      onGenerateRoute: (RouteSettings settings) {
        print('Intentas ir a: ${settings.name}');
        return MaterialPageRoute(
          builder: (BuildContext context) => AlertPage()
        );
      },
      
    );
  }
}