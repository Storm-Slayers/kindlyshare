import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:kindlyshare/screens/mainScreen.dart';
=======
import 'package:kindlyshare/screens/wrapper.dart';
import 'package:provider/provider.dart';
import 'Services/auth.dart';
import 'models/users.dart';
>>>>>>> 8fba7aeebaefdc5bc4d3ca221c275307869b02a5

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return MaterialApp(
      title:'KindlyShare',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity
    ),
    home: MainScreen(),
=======
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
>>>>>>> 8fba7aeebaefdc5bc4d3ca221c275307869b02a5
    );
  }
}
