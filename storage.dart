/*
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';

import './fire.dart';

final _fire = Fire();
FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

class Storage {
  void uploadProfileImage(BuildContext context, File chosenImage) async {
    final user = await FirebaseAuth.instance.currentUser();
    final String userUID = user.uid;

    final StorageReference storageRef = FirebaseStorage.instance
        .ref()
        .child("UserData")
        .child(userUID)
        .child('Profile Image');

    final StorageUploadTask uploadTask =
    storageRef.child('profile image.jpg').putFile(chosenImage);

    var imageUrl = await (await uploadTask.onComplete).ref.getDownloadURL();

    var url = imageUrl.toString();
    _fire.uploadProfileImageToDatabase(imageUrl);
    //navigate to screen
    print("Profile Image Url = " + url);
  }

  void uploadPreviewImage(BuildContext context, File chosenImage, String uniquePreviewImageID) async {
    final user = await FirebaseAuth.instance.currentUser();
    final String userUID = user.uid;

    final StorageReference storageRef = FirebaseStorage.instance
        .ref()
        .child("UserData")
        .child(userUID)
        .child('Preview Images');

    final StorageUploadTask uploadTask =
    storageRef.child(uniquePreviewImageID + '.jpg').putFile(chosenImage);

    var imageUrl = await (await uploadTask.onComplete).ref.getDownloadURL();

    var url = imageUrl.toString();
    //navigate to screen
    print("Profile Image Url = " + url);



 */