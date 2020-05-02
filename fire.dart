import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
final Firestore _firestore = Firestore.instance;

class Fire {

  uploadProfileImageToDatabase(imageUrl) async {
    // only one image because this a profile picture so no need to create a new collection
    final user = await _firebaseAuth.currentUser();
    _firestore
        .collection("UserData")
        .document(user.uid)
        .updateData({'profile image url': imageUrl});
  }

}