import 'package:firebase_auth/firebase_auth.dart';
import 'package:fish_tank_contribution/screens/profile_screen.dart';
import 'package:flutter/material.dart';

import './fire.dart';

final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
final _fire = Fire();

class Auth {
  void registerWithEmailAndPassword(
      String email, String password, String displayName) async {
    print('test');
    AuthResult _result = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    print('success?');

    FirebaseUser _user = _result.user;
    String _userUID = _user.uid;

    _sendEmailVerification(_user);

    print('user has been send a verification email');

    if (await _firebaseAuth.currentUser() != null) {
      print('there is a user signed in');
      signOutWithEmailandPassword();
    }
_fire.createAccount(email, _userUID, displayName);
    
  }

  void loginWithEmailAndPassword(
      BuildContext context, String email, String password) async {
    AuthResult _result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);

    FirebaseUser _user = _result.user;

    if (await isEmailVerified(_user)) {
      print('successfully signed in');

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfileScreen(),
        ),
      );
    }
  }

  Future<bool> isEmailVerified(FirebaseUser user) async {
    return user.isEmailVerified;
  }

  void _sendEmailVerification(FirebaseUser recipient) {
    recipient.sendEmailVerification();
    print('emal verification sent');
  }

  void signOutWithEmailandPassword() async {
    await _firebaseAuth.signOut();
    print('signed out with email and password');
  }
}
