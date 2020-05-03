import 'package:fishtank/Widgets/video_widget.dart';
import 'package:fishtank/datamanagement.dart';
import 'package:fishtank/ui_management.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';
//import 'package:image_picker/image_picker.dart';

//import 'storage.dart';

final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//final _storage = Storage();

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  //Instances
  var uiManagementInstance = UIManagement();
  var dataManagementInstance = DataManagement();
  List myPosts = [];
  var projectCount = 0;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


  var userUid = '';

  File _image;

  Future getUserUid() async {
    FirebaseUser currentUser = await _firebaseAuth.currentUser();
    String uid = currentUser.uid;
    userUid = uid;
    print(uid);
  }

  Future updateData() async {
    myPosts = await dataManagementInstance.getLatestPosts();
    projectCount = myPosts.length;
  }

  @override
  void initState() {
    getUserUid().then((_) {
      print("got uid");
      updateData().then((value){
        setState(() {});
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
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Color.fromRGBO(21, 21, 21, 1),
          child: Column(
            children: <Widget>[

              SizedBox(
                height: 40,
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
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Profile',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0.0, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[

                    Container(
                      padding: EdgeInsets.only(left: 20),
                      child: CircleAvatar(
                          radius: 40,
                          child: Center(
                            child: Text("P"),
                          )
                      ),
                    ),

                    //profileImage(context,'https://i.pinimg.com/originals/80/52/16/805216f1569bcbabc2b2a65e946e6cef.jpg'),
                    Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            data(context, 'Projects', projectCount),
                            data(context, 'Followers', 2000),
                            data(context, 'Following', 500),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: <Widget>[
                            messageButton(context),
                            SizedBox(
                              width: 10,
                            ),
                            checkButton(context),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: bio(
                  context,
                  'Pranav Krishna',
                  "Developer",
                  "Hello, my name is Pranav Krishna and this is my profile page.",
                ),
              ),

              SizedBox(
                height: 20,
              ),

              Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),

                  Text("Projects", style: TextStyle(color: Colors.grey[400], fontSize: 25, fontWeight: FontWeight.w700),),
                ],
              ),

              Container(
                height: MediaQuery.of(context).size.height * 0.34,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: myPosts.length,
                  itemBuilder: (context, int index){
                    return project(
                      context,
                      myPosts[index][1],
                      myPosts[index][2],
                      myPosts[index][4],
                      myPosts[index][3],
                      myPosts[index][0],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget profileImage(BuildContext context, imageUrl, Function getImageFromGallery) {
  return GestureDetector(
    onTap: getImageFromGallery,
    child: Container(
      //this container acts like a circle avatar - how you fit a picture inside of a circle
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(imageUrl),
        ),
      ),
    ),
  );
}

Widget data(BuildContext context, String name, int number) {
  return Container(
    child: Column(
      children: <Widget>[
        Text(
          number.toString(),
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
          child: Text(
            name,
            style: TextStyle(
              fontSize: 15,
              color: Color.fromRGBO(198, 198, 198, 1),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget bio(BuildContext context, String title, String description, String bio) {
  return Container(
    width: double.infinity,
    height: 125,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          description,
          style: TextStyle(
            color: Color.fromRGBO(198, 198, 198, 1),
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          bio,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    ),
  );
}

Widget informationBar(BuildContext context) {
  return Column(
    children: <Widget>[
      Divider(
        color: Colors.white,
        height: 20,
        thickness: 1.25,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                'Message',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Container(
            color: Colors.white,
            height: 30,
            width: 1.5,
          ),
          InkWell(
            onTap: () {
              print('tap');
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Text(
                'Website',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
      Divider(
        color: Colors.white,
        thickness: 1.25,
        height: 25,
      ),
    ],
  );
}

Widget project(
    BuildContext context,
    String title,
    Icon icon,
    String tool,
    String description,
    String imageUrl,
    ) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 30.0),
        child: Container(
          height: 75,
          width: 75,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: VideoWidget(
              url: imageUrl,
              height: 80,
              width: 80,
              play: true,
            )
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: <Widget>[
                icon,
                SizedBox(
                  width: 3,
                ),
                Text(
                  tool,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 4,
            ),
            Wrap(
              direction: Axis.vertical,
              children: <Widget>[
                Container(
                  height: 100,
                  width: 280,
                  child: Text(
                    description,
                    style: TextStyle(
                      color: Color.fromRGBO(198, 198, 198, 1),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}

Widget messageButton(BuildContext context) {
  return Container(
    height: 35,
    width: 150,
    child: RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7),
        side: BorderSide(
          color: Colors.white,
          width: 1.2,
        ),
      ),
      color: Colors.black,
      onPressed: () {},
      child: Text(
        'Message',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    ),
  );
}

Widget checkButton(BuildContext context) {
  return Container(
    height: 35,
    width: 70,
    child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
          side: BorderSide(
            color: Colors.white,
            width: 1.2,
          ),
        ),
        color: Colors.black,
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Icon(
              Icons.person,
              color: Colors.white,
              size: 18,
            ),
            Icon(
              Icons.check,
              color: Colors.white,
              size: 18,
            ),
          ],
        )),
  );
}