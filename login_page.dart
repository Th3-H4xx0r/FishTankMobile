//Imports
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fishtank/home_page.dart';
import 'package:fishtank/main_frame.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

//Library Imports
import 'package:fishtank/sign_up_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  //Global Variables
  Widget buttonWidgetToDisplay = Container();
  String errorMessage = "";

  //Widgets

  Widget textWidgetButton() {
    return Text(
      "Login",
      style: TextStyle(
          fontSize: 22, fontWeight: FontWeight.w700),
    );
  }

  Widget loadingWidget() {
    return SizedBox(
      height: 35,
      width: 35,
      child: SpinKitRing(
        lineWidth: 7,
        color: Colors.black,
      ),
    );
  }

  //Instances
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Controllers
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  //Functions

  Future login() async {
    var email = _emailController.text.toString();
    var password = _passwordController.text.toString();

    var error = false;

    setState(() {
      buttonWidgetToDisplay = loadingWidget();
    });

    Future.delayed(Duration(seconds: 1));

    _auth.signInWithEmailAndPassword(email: email, password: password).catchError((e){
      print(e.toString());
      if(e.toString() == "PlatformException(error, Given String is empty or null, null)") {
        setState(() {
          errorMessage = "Can't leave login empty";
        });
      }
      else if(e.toString() == "PlatformException(ERROR_INVALID_EMAIL, The email address is badly formatted., null)"){
        setState(() {
            errorMessage = "Incorrect Login Credentials";
        });
      }

      else if(e.toString() == "PlatformException(ERROR_WRONG_PASSWORD, The password is invalid or the user does not have a password., null)"){
        setState(() {
          errorMessage = "Incorrect Login Credentials";
        });
      }
      error = true;

      setState(() {
        buttonWidgetToDisplay = textWidgetButton();
      });
    }).then((_){
      if(error == false){
        Navigator.push(context, MaterialPageRoute(builder: (context) => MainFrame()));
      }
    });




  }

  @override
  void initState() {
    setState(() {
      buttonWidgetToDisplay = textWidgetButton();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromRGBO(21, 21, 21, 1),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 100,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    "FishTank",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                    alignment: Alignment.center,
                    height: 250,
                    width: 250,
                    child: Image.asset("lib/Assets/applogo.png")),
                SizedBox(
                  height: 100,
                ),
                Container(
                  height: 55,
                  width: MediaQuery.of(context).size.width - 80,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 0.2),
                      borderRadius: BorderRadius.circular(30)
                  ),
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 20,
                      ),

                      Icon(Icons.person_outline, color: Colors.white,),

                      SizedBox(
                        width: 10,
                      ),

                      Container(
                        width: MediaQuery.of(context).size.width*0.6,
                        child: TextField(
                          style: TextStyle(color: Colors.white),
                          controller: _emailController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                              hintText: "Email",
                              hintStyle: TextStyle(color: Colors.grey[300])
                          ),
                        ),
                      ),

                    ],
                  ),
                ),

                SizedBox(
                  height: 30,
                ),

                Container(
                  height: 55,
                  width: MediaQuery.of(context).size.width - 80,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 0.2),
                      borderRadius: BorderRadius.circular(30)
                  ),
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 20,
                      ),

                      Icon(Icons.lock, color: Colors.white,),

                      SizedBox(
                        width: 10,
                      ),

                      Container(
                        width: MediaQuery.of(context).size.width*0.6,
                        child: TextField(
                          style: TextStyle(color: Colors.white),
                          obscureText: true,
                          controller: _passwordController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                            hintText: "Password",
                            hintStyle: TextStyle(color: Colors.grey[300])
                          ),
                        ),
                      ),


                    ],
                  ),
                ),

                SizedBox(
                  height: 20,
                ),

                Text(errorMessage, style: TextStyle(color: Colors.red),),

                SizedBox(
                  height: 5,
                ),

                GestureDetector(
                  onTap: () async{

                    setState(() {
                      buttonWidgetToDisplay = loadingWidget();
                    });

                    Future.delayed(Duration(seconds: 1));

                    await login();


                  },
                  child: Container(
                      height: 45,
                      width: MediaQuery.of(context).size.width - 140,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                        child: buttonWidgetToDisplay
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
                  },
                  child: Container(
                      alignment: Alignment.center,
                      child: Center(
                          child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Don't have an account?",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                          Text(
                            " Sign Up",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                        ],
                      ))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
