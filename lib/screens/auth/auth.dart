import 'package:kindlyshare/screens/auth/login_page.dart';
import 'package:flutter/material.dart';
import 'package:kindlyshare/screens/auth/Register.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool show_signin = true;
  
  void toggleView(){
    setState(() {
      show_signin = !show_signin;
    });
    
  }

  @override
  Widget build(BuildContext context) {
    if (show_signin == true) {
      return Login(
        toggleView: toggleView,
      );
    } else {
      return Register(
        toggleView: toggleView,
      );
    }
  }
}
