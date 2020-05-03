//Package Imports
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fishtank/Widgets/video_widget.dart';
import 'package:fishtank/datamanagement.dart';
import 'package:fishtank/ui_management.dart';
import 'package:fishtank/view_post_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:video_player/video_player.dart';

//Library Imports

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //Global Variables
  List latestProjects = [
    ["https://firebasestorage.googleapis.com/v0/b/fishtankmobile-2bb10.appspot.com/o/Asana%20Demo%20and%20Product%20Tour.mp4?alt=media&token=42e3c205-6a4b-40c5-99b2-4223ad1d1bb7", "HackerQ Mobile", Icon(LineAwesomeIcons.android, color: Colors.white,), "HackerQ Mobile is an app that makes managing and hosting hackathons easier.", "Android"],
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  //Instances
  var uiManagementInstance = UIManagement();
  var dataManagementInstance = DataManagement();

  //Functions

  Future updateData() async {
    latestProjects = await dataManagementInstance.getLatestPosts();
  }

  @override
  void initState() {
    updateData().then((value){
      setState(() {

      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        drawer: uiManagementInstance.drawerWidget(context),
        backgroundColor: Color.fromRGBO(21, 21, 21, 1),
        body: ListView(
          physics: BouncingScrollPhysics(),
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
              height: 10,
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 30,
                ),
                Text(
                  "Home",
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
            Container(
              width: MediaQuery.of(context).size.width,
              height: 25,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    "All",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 17),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Text(
                    "Latest",
                    style: TextStyle(
                        color: Colors.grey[500],
                        fontWeight: FontWeight.w700,
                        fontSize: 17),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Text(
                    "Web",
                    style: TextStyle(
                        color: Colors.grey[500],
                        fontWeight: FontWeight.w700,
                        fontSize: 17),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Text(
                    "Mobile",
                    style: TextStyle(
                        color: Colors.grey[500],
                        fontWeight: FontWeight.w700,
                        fontSize: 17),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Text(
                    "Server",
                    style: TextStyle(
                        color: Colors.grey[500],
                        fontWeight: FontWeight.w700,
                        fontSize: 17),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 0,
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 30,
                ),
                Container(
                  height: 310,
                  width: MediaQuery.of(context).size.width - 30,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: latestProjects.length,
                    itemBuilder: (context, int index) {
                     // _controller = VideoPlayerController.network(latestProjects[index][0]);

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ViewPostScreen(latestProjects[index])));
                        },
                        child: Row(
                          children: <Widget>[
                            Container(
                                height: 300,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                child: ClipRRect(
                                  child: VideoWidget(url: latestProjects[index][0], play: true, height: 274, width: MediaQuery.of(context).size.width),
                                  borderRadius: BorderRadius.circular(40),
                                )),
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: <Widget>[
                SizedBox(
                  width: 30,
                ),
                Text(
                  "Featured",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w700),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: latestProjects.length * 140.toDouble(),
              width: MediaQuery.of(context).size.width - 60,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: latestProjects.length,
                itemBuilder: (context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ViewPostScreen(latestProjects[index])));
                    },
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 30,
                            ),
                            Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child:
                                /*
                                Image.network(
                                  latestProjects[index][0],
                                  fit: BoxFit.cover,
                                )

                                     */
                                VideoWidget(url: latestProjects[index][0], play: true, height: 80, width:90),
                              ),

                              height: 90,
                              width: 90,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  latestProjects[index][1],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: <Widget>[
                                    latestProjects[index][2],
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      latestProjects[index][4],
                                      style: TextStyle(
                                          color: Colors.grey[500],
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Wrap(
                                  children: <Widget>[
                                    Container(
                                      height: 40,
                                      width:
                                      MediaQuery.of(context).size.width * 0.6,
                                      child: Text(
                                        latestProjects[index][3],
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: Colors.grey[600],
                                            fontSize: 15),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),

                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
