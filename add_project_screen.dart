//Package Imports
import 'package:fishtank/datamanagement.dart';
import 'package:fishtank/ui_management.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddProjectScreen extends StatefulWidget {
  @override
  _AddProjectScreenState createState() => _AddProjectScreenState();
}

class _AddProjectScreenState extends State<AddProjectScreen> {

  //Instances
  var uiManagementInstance = UIManagement();
  var dataManagementInstance = DataManagement();

  //Controller
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _demoLinkController = TextEditingController();
  TextEditingController _projectPlatformController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          inputDecorationTheme: new InputDecorationTheme(
            disabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white
              )
            ),
              labelStyle: new TextStyle(color: Colors.white))

      ),
      home: Scaffold(
          key: _scaffoldKey,
          drawer: uiManagementInstance.drawerWidget(context),
          backgroundColor: Color.fromRGBO(21, 21, 21, 1),
          body: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[

                  SizedBox(
                    height: 20,
                  ),

                  Row(
                    children: <Widget>[

                      SizedBox(
                        width: 20,
                      ),

                      IconButton(
                        color: Colors.white,
                        icon: Icon(Icons.dehaze),
                        onPressed: () {
                          _scaffoldKey.currentState.openDrawer();
                        },
                      )
                    ],
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        "Add Project",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        "Project Title",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 30,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 60,
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.grey[700],
                          borderRadius: BorderRadius.circular(10)
                        ),
                        padding: EdgeInsets.only(left: 10),
                        child: TextField(
                          controller: _titleController,
                          autofocus: false,
                          cursorColor: Colors.white,
                          style: TextStyle(color: Colors.white),
                          scrollPadding: EdgeInsets.only(bottom: 1),
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            focusColor: Colors.white,
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        "Project Description",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 30,
                      ),
                      Wrap(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width - 60,
                            height: 90,
                            decoration: BoxDecoration(
                                color: Colors.grey[700],
                                borderRadius: BorderRadius.circular(10)
                            ),
                            padding: EdgeInsets.only(left: 10),
                            child: TextField(
                              controller: _descriptionController,
                              autofocus: false,
                              maxLines: 3,
                              cursorColor: Colors.white,
                              style: TextStyle(color: Colors.white),
                              scrollPadding: EdgeInsets.only(bottom: 1),
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                focusColor: Colors.white,
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ]
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        "Project Platform",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 30,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 60,
                        height: 45,
                        decoration: BoxDecoration(
                            color: Colors.grey[700],
                            borderRadius: BorderRadius.circular(10)
                        ),
                        padding: EdgeInsets.only(left: 10),
                        child: TextField(
                          controller: _projectPlatformController,
                          autofocus: false,
                          cursorColor: Colors.white,
                          style: TextStyle(color: Colors.white),
                          scrollPadding: EdgeInsets.only(bottom: 1),
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            focusColor: Colors.white,
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        "Project Demo Link",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 30,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 60,
                        height: 45,
                        decoration: BoxDecoration(
                            color: Colors.grey[700],
                            borderRadius: BorderRadius.circular(10)
                        ),
                        padding: EdgeInsets.only(left: 10),
                        child: TextField(
                          controller: _demoLinkController,
                          autofocus: false,
                          cursorColor: Colors.white,
                          style: TextStyle(color: Colors.white),
                          scrollPadding: EdgeInsets.only(bottom: 1),
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            focusColor: Colors.white,
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 60,
                  ),

                  Row(
                    children: <Widget>[

                      SizedBox(
                        width: 40,
                      ),

                      Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width-80,
                        child: RaisedButton(
                          color: Colors.white,
                          child: Center(
                            child: Text("Post", style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w700),),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                          ),
                          onPressed: () {
                            dataManagementInstance.uploadProject(_titleController.text, _descriptionController.text, _demoLinkController.text, _projectPlatformController.text).then((_){
                              _titleController.clear();
                              _descriptionController.clear();
                              _demoLinkController.clear();
                            });

                            Flushbar(
                              message: "Project successfully posted!",
                              icon: Icon(
                                Icons.check_circle_outline,
                                size: 35.0,
                                color: Colors.green,
                              ),
                              duration: Duration(seconds: 3),
                              leftBarIndicatorColor: Colors.green,
                            )..show(context);
                          },


                        ),
                      )
                    ],
                  )
                ],
              ),
            ]
          )),
    );
  }
}
