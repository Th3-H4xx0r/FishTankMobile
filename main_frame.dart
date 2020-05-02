//Package Imports
import 'package:fishtank/home_page.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:persistent_bottom_nav_bar/models/persistent-nav-bar-scaffold.widget.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

//Library Imports

class MainFrame extends StatefulWidget {
  @override
  _MainFrameState createState() => _MainFrameState();
}

class _MainFrameState extends State<MainFrame> {

  //Global Variables
  PersistentTabController _controller = PersistentTabController(initialIndex: 1);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: PersistentTabView(
          backgroundColor: Color.fromRGBO(21, 21, 21, 1),
          navBarStyle: NavBarStyle.style5,
          screens: <Widget>[
            HomePage(),
            HomePage(),
            HomePage(),
          ],
          showElevation: false,
          items: [

            PersistentBottomNavBarItem(
                title: "Add Project",
                icon: Icon(Icons.add),
                activeColor: Colors.white,
                inactiveColor: Colors.grey[600]
            ),

            PersistentBottomNavBarItem(
              title: "Home",
              icon: Icon(Icons.home),
              activeColor: Colors.white,
              inactiveColor: Colors.grey[600]
            ),

            PersistentBottomNavBarItem(
                title: "Profile",
                icon: Icon(Icons.person_outline),
                activeColor: Colors.white,
                inactiveColor: Colors.grey[600]
            ),


          ],
        ),
      ),
    );
  }
}
