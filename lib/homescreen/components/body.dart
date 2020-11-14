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
              SizedBox(
                width: size.width / 2,
                height: 84,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                    ),
                  ),
                  color: kPrimaryColor,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MapPage()));
                  },
                  /*onPressed: () {
                    Navigator.of(context).pushNamed(MapPage.routeName);
                  },*/
                  child: Text(
                    "Maps",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: FlatButton(
                  onPressed: () {},
                  child: Text("Maps"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
