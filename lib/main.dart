import 'package:flutter/material.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';

import 'package:TA_Maps/MappingPage.dart';

void main() =>
    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MapPage()));

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
  }

  changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('Aplikasi Go-Tahu'),
        centerTitle: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BubbleBottomBar(
        opacity: 0.2,
        backgroundColor: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15.0),
        ),
        currentIndex: currentIndex,
        hasInk: true,
        inkColor: Colors.black12,
        hasNotch: true,
        fabLocation: BubbleBottomBarFabLocation.end,
        onTap: changePage,
        items: [
          BubbleBottomBarItem(
            backgroundColor: Colors.red,
            icon: Icon(
              Icons.dashboard,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.dashboard,
              color: Colors.red,
            ),
            title: Text('Home'),
          ),
          BubbleBottomBarItem(
            backgroundColor: Colors.indigo,
            icon: Icon(
              Icons.folder_open,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.folder_open,
              color: Colors.indigo,
            ),
            title: Text('Maps'),
          ),
          BubbleBottomBarItem(
            backgroundColor: Colors.deepPurple,
            icon: Icon(
              Icons.access_time,
              color: Colors.black,
            ),
            activeIcon: Icon(
              Icons.access_time,
              color: Colors.deepPurple,
            ),
            title: Text('Log'),
          ),
        ],
      ),
      body: (currentIndex == 0)
          ? Icon(
              Icons.dashboard,
              size: 150.0,
              color: Colors.red,
            )
          : (currentIndex == 1)
              ? Icon(
                  Icons.folder_open,
                  size: 150.0,
                  color: Colors.indigo,
                )
              : Icon(
                  Icons.access_time,
                  size: 150.0,
                  color: Colors.deepPurple,
                ),
    );
  }
}
