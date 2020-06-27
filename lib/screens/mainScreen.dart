import 'package:flutter/material.dart';
import 'package:kindlyshare/screens/listPage_test.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _children =[
    ListPageTest(),
    ListPageTest(),
    ListPageTest(),
    ListPageTest(),
  ];

void onTabTapped(int index){
  setState(() {
    _currentIndex = index;
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.white,
        backgroundColor: Colors.red,
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.map),
            title: Text('Page 1')),
            new BottomNavigationBarItem(
            icon: Icon(Icons.map),
            title: Text('Page 2')),
            new BottomNavigationBarItem(
            icon: Icon(Icons.map),
            title: Text('Page 3')),
            new BottomNavigationBarItem(
            icon: Icon(Icons.map),
            title: Text('Page 4')),
        ],
      ),
      
    );
  }
}