

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class DataManagement {

  Future uploadProject(String title, String description, String link, String platform) async{

    DatabaseReference _ref = FirebaseDatabase.instance.reference().child("Projects").child(title);

    _ref.child("Title").set(title);
    _ref.child("Description").set(description);
    _ref.child("URL").set(link);
    _ref.child("Project Platform").set(platform);

  }

  Future getLatestPosts() async {

    List recentPosts = [];
    DatabaseReference _ref = FirebaseDatabase.instance.reference().child("Projects");

    DataSnapshot _snap = await _ref.once();

    if(_snap.value != null){
      Map<dynamic, dynamic> rawData = _snap.value;

      rawData.forEach((key, value) {

        Widget projectPlatformIcon;

        if(value["Project Platform"].toLowerCase() == "android"){
          projectPlatformIcon = Icon(LineAwesomeIcons.android, color: Colors.white,);
        }
        else if(value["Project Platform"] == "ios"){
          projectPlatformIcon = Icon(LineAwesomeIcons.apple, color: Colors.white,);
        }
        else if(value["Project Platform"] == "website"){
          projectPlatformIcon = Icon(LineAwesomeIcons.internet_explorer, color: Colors.white,);
        }

        recentPosts.add([value["URL"], value["Title"] ,projectPlatformIcon, value["Description"], value["Project Platform"]]);
      });
    }

    return recentPosts;

  }
}