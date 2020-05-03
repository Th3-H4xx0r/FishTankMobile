import 'package:fishtank/add_project_screen.dart';
import 'package:fishtank/home_page.dart';
import 'package:fishtank/profile_screen.dart';
import 'package:flutter/material.dart';

class UIManagement {

  Widget drawerWidget(context){

    return Drawer(
      child: Container(
        color: Color.fromRGBO(21, 21, 21, 1),
        child: ListView(
          children: <Widget>[

            Container(
              padding: EdgeInsets.only(left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  SizedBox(
                    height: 20,
                  ),

                  Row(
                    children: <Widget>[

                      SizedBox(
                        width: 10,
                      ),

                      CircleAvatar(
                        child: Text("P"),
                        backgroundColor: Colors.white,
                        radius: 30,
                      ),



                    ],
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  Text("Pranav Krishna", style: TextStyle(color: Colors.white, fontSize: 20),),

                  Text("Krishnatechpranav@gmail.com", style: TextStyle(color: Colors.grey, fontSize: 17),),

                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),

            Divider(
              color: Colors.grey[600],
            ),


            ListTile(
              title: Text("Home", style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.w500),),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => HomePage()
                ));
              },
            ),

            Divider(
              color: Colors.grey[600],
            ),

            ListTile(
              title: Text("Add Project", style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.w500),),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => AddProjectScreen()
                ));
              },
            ),

            Divider(
              color: Colors.grey[600],
            ),

            ListTile(
              title: Text("Profile", style: TextStyle(color: Colors.white, fontSize: 23, fontWeight: FontWeight.w500),),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => ProfileScreen()
                ));
              },
            ),

            Divider(
              color: Colors.grey[600],
            ),

          ],
        ),
      )
    );

  }
}