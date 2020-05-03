import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class ViewPostScreen extends StatefulWidget {
  var postTitle = "";
  var postDescription = "";
  var postVideo = "";
  var postPlatform = "";
  Widget platformIcon = Container();

  ViewPostScreen(data){
    postTitle = data[1];
    postDescription = data[3];
    postVideo = data[0];
    postPlatform = data[4];
    platformIcon = data[2];

  }

  @override
  _ViewPostScreenState createState() => _ViewPostScreenState();
}

class _ViewPostScreenState extends State<ViewPostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          "https://images.unsplash.com/photo-1519770340285-c801df5ff3db?ixlib=rb-1.2.1&w=1000&q=80"),
                    ),
                  ),
                ),
                Positioned(
                    top: 40,
                    left: 25,
                    child: IconButton(
                        icon: Icon(
                          Icons.keyboard_arrow_left,
                          size: 35,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        })),
                Positioned(
                  top: 145,
                  left: 30,
                  right: 15,
                  child: Row(
                    children: [

                    ],
                  )
                ),
                Positioned(
                  top: 100,
                  left: 30,
                  right: 15,
                  child: Row(
                    children: [
                      Text(
                          widget.postTitle,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 36,
                              fontWeight: FontWeight.w800),
                        ),

                      Icon(LineAwesomeIcons.android, size: 45, color: Colors.black,),
                    ],
                  )
                ),
                Positioned(
                  top: 150,
                  left: 30,
                  child: Container(
                    height: 20,
                    child: Row(
                      children: [
                        Icon(LineAwesomeIcons.android, size: 25, color: Colors.grey,),
                        Container(
                          height: 300,
                          width: 400,
                          child: Text(
                            widget.postPlatform,
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                  )
                ),
              ],
            ),
            Column(
              children: <Widget>[
                SizedBox(height:15),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 2.0, color: Colors.grey[900]),
                      borderRadius: BorderRadius.circular(30)
                  ),
                  width: MediaQuery.of(context).size.width-20,
                  height: 70,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: <Widget>[
                        Container(
                          //this container acts like a circle avatar - how you fit a picture inside of a circle
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "https://images.unsplash.com/photo-1519770340285-c801df5ff3db?ixlib=rb-1.2.1&w=1000&q=80"),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Pranav Krishna',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 21,
                              ),
                            ),
                            Text(
                              'Software Developer',
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                Row(
                  children: [
                    SizedBox(
                      width: 28,
                    ),

                    Text("Project Description", style: TextStyle(color: Colors.grey[600], fontSize: 20, fontWeight: FontWeight.w700),)
                  ],
                ),


                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.postDescription,
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 18,
                          color: Colors.white),
                    ),
                  )
                ),
                SizedBox(
                  height: 20,
                ),

                Row(
                  children: [
                    SizedBox(
                      width: 28,
                    ),

                    Text("Contact Details", style: TextStyle(color: Colors.grey[600], fontSize: 20, fontWeight: FontWeight.w700),)
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          'Email: krishnatechpranav@gmail.com',
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          'Phone: 123-456-7890',
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}