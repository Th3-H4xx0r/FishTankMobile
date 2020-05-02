import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import '../Business_Logic/storage.dart';

final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
final _storage = Storage();

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var userUid = '';

  File _image;

  Future getImageFromGallery() async {
    File image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = image;
      });
      print(image.path);
      // cant print image.path if there is no image - ex. going back out of gallery
      _storage.uploadProfileImage(context, image);
    }
  }

  Future getUserUid() async {
    FirebaseUser currentUser = await _firebaseAuth.currentUser();
    String uid = currentUser.uid;
    userUid = uid;
    print(uid);
  }

  @override
  void initState() {
    getUserUid().then((_) {
      print("got uid");
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.black,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Profile',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.w800,
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
                    ////
                    /////
                    ///
                    StreamBuilder<DocumentSnapshot>(
                        stream: Firestore.instance
                            .collection('UserData')
                            .document(userUid)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return Text("Loading");
                          } else {
                            Map<String, dynamic> documentFields =
                                snapshot.data.data;
                            return documentFields['profile image url'] !=
                                        null ||
                                    documentFields['profile image url'] != ''
                                ? profileImage(context, documentFields['profile image url'], getImageFromGallery)
                                : Container(
                                    width: 110,
                                    height: 110,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.blue,
                                    ),
                                  );
                          }
                        }),
                    //profileImage(context,'https://i.pinimg.com/originals/80/52/16/805216f1569bcbabc2b2a65e946e6cef.jpg'),
                    Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            data(context, 'Projects', 4),
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
                  'John Doe',
                  "Developer",
                  "Hello, my name is john and this is my bio.  There is nothing currently here so this is boring :(",
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: informationBar(context),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.35,
                child: ListView(
                  children: <Widget>[
                    project(
                      context,
                      'Hacker Q Mobile',
                      Icon(
                        Icons.android,
                        color: Colors.white,
                        size: 15,
                      ),
                      'Android',
                      'Hacker Q mobile description will go here. Welcome to haccer Q which is an app where',
                      'https://i.pinimg.com/originals/80/52/16/805216f1569bcbabc2b2a65e946e6cef.jpg',
                    ),
                    project(
                      context,
                      'Hacker Q Mobile',
                      Icon(
                        Icons.android,
                        color: Colors.white,
                        size: 15,
                      ),
                      'Android',
                      'Hacker Q mobile description will go here. Welcome to haccer Q which is an app where',
                      'https://i.pinimg.com/originals/80/52/16/805216f1569bcbabc2b2a65e946e6cef.jpg',
                    ),
                    project(
                      context,
                      'Hacker Q Mobile',
                      Icon(
                        Icons.android,
                        color: Colors.white,
                        size: 15,
                      ),
                      'Android',
                      'Hacker Q mobile description will go here. Welcome to haccer Q which is an app where',
                      'https://i.pinimg.com/originals/80/52/16/805216f1569bcbabc2b2a65e946e6cef.jpg',
                    ),
                  ],
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
        padding: const EdgeInsets.only(left: 15.0),
        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              imageUrl,
              fit: BoxFit.fill,
            ),
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
