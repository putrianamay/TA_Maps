import 'package:TA_Maps/MappingPage.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

import 'image_and_icons.dart';
import 'tittle_and_price.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          ImageAndIcons(size: size),
          TitleAndPrice(
              title: "Hallo,", country: "Yuk! Temukan Pabrik Tahu Terdekat"),
          SizedBox(height: kDefaultPadding),
          Row(
            children: <Widget>[
              Expanded(
                child: FlatButton(
                  minWidth: 1,
                  height: 70,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  color: Colors.blue,
                  highlightColor: Colors.red,
                  splashColor: Colors.red,
                  onPressed: () => buttonTentangAplikasi(context),
                  child: Text(
                    "Tentang Aplikasi",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Expanded(
                child: FlatButton(
                  minWidth: 1,
                  height: 70,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  color: Colors.blue,
                  highlightColor: Colors.red,
                  splashColor: Colors.red,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MapPage()));
                  },
                  child: Text(
                    "Maps",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

buttonTentangAplikasi(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text('Tentang Aplikasi'),
      content: Text(
          'Aplikasi GoTahu merupakan aplikasi pencarian jalur terpendek menuju pabrik tahu yang berada di Tangerang Selatan dengan mengimplementasikan algoritma Dijkstra. Pada aplikasi ini terdapat 5 pabrik dari satu titik awal.'),
      actions: [
        FlatButton(
          child: Text("OK"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    ),
  );
}
