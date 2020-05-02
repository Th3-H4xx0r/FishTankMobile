import 'package:fish_tank_contribution/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Business_Logic/auth.dart';

final _auth = Auth();

class SignInWithEmailScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Expanded(
                flex: 322,
                child: Container(
                  color: Color.fromRGBO(37, 151, 234, 1),
                ),
              ),
              Expanded(
                flex: 345,
                child: Container(
                  color: Color.fromRGBO(243, 243, 243, 1),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
              MediaQuery.of(context).size.height * 0.04,
              MediaQuery.of(context).size.height * 0.39,
              MediaQuery.of(context).size.height * 0.04,
              MediaQuery.of(context).size.height * 0.04,
            ),
            child: Container(
              height: double.infinity,
              width: double.infinity,
              child: Card(
                color: Colors.white,
                elevation: 6,
                child: Column(
                  children: <Widget>[
                    Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.031,
                          ),
                          textEntry(
                            context: context,
                            hintText: 'Email',
                            icon: Icon(
                              Icons.email,
                              color: Color.fromRGBO(37, 151, 234, 1),
                              size: 38,
                            ),
                            keyboardType: TextInputType.emailAddress,
                            controller: _emailController,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          textEntry(
                            context: context,
                            hintText: 'Password',
                            icon: Icon(
                              Icons.lock,
                              color: Color.fromRGBO(37, 151, 234, 1),
                              size: 38,
                            ),
                            keyboardType: TextInputType.visiblePassword,
                            controller: _passwordController,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.028,
                    ),
                    button(
                      context,
                      'Sign in with Email',
                      () async {
                        _auth.loginWithEmailAndPassword(
                          context,
                          _emailController.text,
                          _passwordController.text,
                        );
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
                    button(
                      context,
                      'Back',
                      () => Navigator.pop(context),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.025,
                    ),
                    InkWell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Don\'t have an account?',
                            style: TextStyle(
                                color: Color.fromRGBO(126, 126, 126, 1),
                                fontSize: 14),
                          ),
                          Text(
                            ' Sign Up!',
                            style: TextStyle(
                                color: Color.fromRGBO(37, 151, 234, 1),
                                fontSize: 14),
                          ),
                        ],
                      ),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpScreen(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.017,
                    ),
                    Text(
                      'Resend Email Verification',
                      style: TextStyle(
                          color: Color.fromRGBO(126, 126, 126, 1),
                          fontSize: 14),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.017,
                    ),
                    Text(
                      'Forgot Password?',
                      style: TextStyle(
                          color: Color.fromRGBO(126, 126, 126, 1),
                          fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Stack(
          //   children: <Widget>[
          //     Padding(
          //       padding: EdgeInsets.fromLTRB(
          //         MediaQuery.of(context).size.width * 0.325,
          //         MediaQuery.of(context).size.height * 0.09,
          //         MediaQuery.of(context).size.width * 0.325,
          //         MediaQuery.of(context).size.height * 0.73,
          //       ),
          //       child: Container(
          //         decoration: BoxDecoration(
          //           color: Colors.white,
          //           borderRadius: BorderRadius.circular(20),
          //         ),
          //       ),
          //     ),
          //     Padding(
          //       padding: EdgeInsets.fromLTRB(
          //         MediaQuery.of(context).size.width * 0.392,
          //         MediaQuery.of(context).size.height * 0.12,
          //         0,
          //         0,
          //       ),
          //       child: Icon(
          //         Icons.card_giftcard,
          //         color: Color.fromRGBO(37, 151, 234, 1),
          //         size: 92,
          //       ),
          //     )
          //   ],
          // ),
          // Padding(
          //     padding: EdgeInsets.fromLTRB(
          //       MediaQuery.of(context).size.width * 0.32,
          //       MediaQuery.of(context).size.height * 0.29,
          //       0,
          //       0,
          //     ),
          //     child: Text(
          //       'Welcome',
          //       style: TextStyle(
          //         color: Colors.white,
          //         fontSize: 38,
          //       ),
          //     )),
          Padding(
            padding: EdgeInsets.fromLTRB(
                0.0, MediaQuery.of(context).size.height * 0.08, 0.0, 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 0.18,
                  width: MediaQuery.of(context).size.height * 0.18,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(
                    Icons.card_giftcard,
                    color: Color.fromRGBO(37, 151, 234, 1),
                    size: 85,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
                0.0, MediaQuery.of(context).size.height * 0.28, 0.0, 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Sign In',
                  style: TextStyle(color: Colors.white, fontSize: 38),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget button(BuildContext context, String name, Function function) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.65,
    height: MediaQuery.of(context).size.height * 0.075,
    child: RaisedButton(
      elevation: 0,
      color: Colors.white,
      onPressed: function,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: Color.fromRGBO(37, 151, 234, 1),
          width: 1,
        ),
      ),
      child: Text(
        name,
        style: TextStyle(
          color: Color.fromRGBO(37, 151, 234, 1),
          fontSize: 22,
          fontWeight: FontWeight.w400,
        ),
      ),
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
            blurRadius: 4,
            offset: Offset(8, 8),
            color: Color(000000).withOpacity(.25),
            spreadRadius: -5)
      ],
    ),
  );
}

Widget textEntry({
  BuildContext context,
  String hintText,
  Icon icon,
  TextInputType keyboardType,
  TextEditingController controller,
}) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.65,
    child: TextFormField(
      controller: controller,
      maxLines: 1,
      keyboardType: keyboardType,
      style: TextStyle(color: Colors.grey[700], fontSize: 16),
      autofocus: false,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintStyle: TextStyle(
          color: Color.fromRGBO(126, 126, 126, 1),
        ),
        labelStyle: TextStyle(
          color: Colors.grey[700],
        ),
        hintText: hintText,
        icon: icon,
      ),
      validator: (String value) {
        return 'email cannot be empty';
      },
    ),
  );
}
