import 'package:TA_Maps/home_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:TA_Maps/MappingPage.dart';

void main() {
  //runApp(gotahu());
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => gotahu(),
      MapPage.routeName: (context) => MapPage(),
    },
  ));
}

class gotahu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DetailsScreen(),
      /*initialRoute: '/',
      routes: {
        MapPage.routeName: (context) => MapPage(),
      },*/
    );
  }
}
