import 'package:flutter/material.dart';
import 'package:kindlyshare/Services/auth.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(
        children: <Widget>[
          Text('home screen'),
          RaisedButton(child : Text('sign out') ,onPressed: (){
            _auth.signout();

          })
        ],
      )),
      
    );
  }
}
