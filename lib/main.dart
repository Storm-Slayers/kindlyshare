import 'package:flutter/material.dart';
import 'package:kindlyshare/screens/mainScreen.dart';
import 'package:kindlyshare/screens/wrapper.dart';
import 'package:provider/provider.dart';
import 'Services/auth.dart';
import 'models/users.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
