import 'package:TA_Maps/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:TA_Maps/MappingPage.dart';

void main() {
  //runApp(gotahu());
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Gotahu(),
      MapPage.routeName: (context) => MapPage(),
    },
  ));
}

class Gotahu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
      /*initialRoute: '/',
      routes: {
        MapPage.routeName: (context) => MapPage(),
      },*/
    );
  }
}
