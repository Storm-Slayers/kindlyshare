import 'package:flutter/material.dart';
import 'package:kindlyshare/screens/mainScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'KindlyShare',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity
    ),
    home: MainScreen(),
    );
  }
}