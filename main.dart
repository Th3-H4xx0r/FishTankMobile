import 'package:fishtank/login_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: SplashScreen(),));

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then((_){
      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        accentColor: Color.fromRGBO(21, 21, 21, 1),
        primaryColor: Color.fromRGBO(21, 21, 21, 1),
        backgroundColor: Color.fromRGBO(21, 21, 21, 1),
    ),
      home: Scaffold(
        backgroundColor: Color.fromRGBO(21, 21, 21, 1),
        body: Center(
          child: SizedBox(
            child: Image.asset("lib/Assets/applogo.png"),
            height: 250,
            width: 250,
          ),
        ),
      ),
    );
  }
}

