//Package Imports
import 'package:fishtank/add_project_screen.dart';
import 'package:fishtank/home_page.dart';
import 'package:fishtank/profile_screen.dart';
import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:persistent_bottom_nav_bar/models/persistent-nav-bar-scaffold.widget.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:rolling_nav_bar/rolling_nav_bar.dart';

//Library Imports

class MainFrame extends StatefulWidget {
  @override
  _MainFrameState createState() => _MainFrameState();
}

class _MainFrameState extends State<MainFrame> {
  //Global Variables=

  int index = 1;

  List screens = [AddProjectScreen(), HomePage(), ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: screens.elementAt(index),
    ));
  }
}
