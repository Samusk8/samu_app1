import 'package:flutter/material.dart';
import 'package:samu_app1/screens/alert_page.dart';
import 'package:samu_app1/screens/animated_container.dart';
import 'package:samu_app1/screens/avatar_page.dart';
import 'package:samu_app1/screens/card_page.dart';
import 'package:samu_app1/screens/home_page.dart';

Map<String, WidgetBuilder> getRoutes(){
  return rutes;
}
final rutes = <String, WidgetBuilder>{
       '/'         : (BuildContext context) => HomePage(),
       'alert'     : (BuildContext context) => AlertPage(),
       'avatar'    : (BuildContext context) => AvatarPage(),
       'card'      : (BuildContext context) => CardPage(),
       'animatedContainer': (BuildContext context) => AnimatedContainerPage(),
     };
