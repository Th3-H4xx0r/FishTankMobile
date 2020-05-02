//Imports
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fishtank/main_frame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

//Library Imports
import 'package:fishtank/login_page.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  //Global Variables
  Widget buttonWidgetToDisplay = Container();
  String errorMessage = "";

  //Instances
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Controllers
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _repeatPasswordController = TextEditingController();

  //Widgets

  Widget textWidgetButton() {
    return Text(
      "Sign Up",
      style: TextStyle(
          fontSize: 22, fontWeight: FontWeight.w700),
    );
  }

  Widget loadingWidget() {
    return SizedBox(
      height: 35,
      width: 35,
      child: SpinKitRing(
        color: Colors.black,
      ),
    );
  }

  //Functions

  Future signUp() async {

    String email = _emailController.text.toString();
    String password = _passwordController.text.toString();
    String repeatPassword = _repeatPasswordController.text.toString();

    var error = false;


    _auth.createUserWithEmailAndPassword(email: email, password: password).catchError((e){
      error = true;
      print(e.toString());

      Future.delayed(Duration(seconds: 1));

      setState(() {
        buttonWidgetToDisplay = textWidgetButton();
      });

      if(e.toString() == "PlatformException(error, Given String is empty or null, null)"){
        setState(() {
          errorMessage = "Can't leave fields blank";
        });

        } else if(e.toString() == "PlatformException(ERROR_INVALID_EMAIL, The email address is badly formatted., null)"){
        setState(() {
          errorMessage = "Email is invalid";
        });

        if(e.toString() == "PlatformException(ERROR_WEAK_PASSWORD, The given password is invalid. [ Password should be at least 6 characters ], null)"){
          setState(() {
            errorMessage = "Password must be atleast 6 characters long";
          });
        }
      }

      }).then((_){
        if(error == false){
          setState(() {
            buttonWidgetToDisplay = textWidgetButton();
          });

          if(password == repeatPassword){
            Navigator.push(context, MaterialPageRoute(builder: (context) => MainFrame()));
          } else {
            setState(() {
              errorMessage = "Password and repeat password do not match";
            });
          }


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

                      Icon(Icons.person_outline, color: Colors.white,),

                      SizedBox(
                        width: 10,
                      ),

                      Container(
                        width: MediaQuery.of(context).size.width*0.6,
                        child: TextField(
                          controller: _emailController,
                          style: TextStyle(color: Colors.white),
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
                          controller: _passwordController,
                          style: TextStyle(color: Colors.white),
                          obscureText: true,
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
                          controller: _repeatPasswordController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Repeat Password",
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

                Text(errorMessage, style: TextStyle(color: Colors.red),),

                SizedBox(
                  height: 5,
                ),


                GestureDetector(
                  onTap: () async{
                    setState(() {
                      buttonWidgetToDisplay = loadingWidget();
                    });

                    await signUp();

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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Container(
                      alignment: Alignment.center,
                      child: Center(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Already have an account?",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white),
                              ),
                              Text(
                                " Login",
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
