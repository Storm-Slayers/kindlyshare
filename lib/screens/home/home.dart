import 'package:flutter/material.dart';
import 'package:kindlyshare/models/requests.dart';
import 'package:kindlyshare/screens/new_request/add_request.dart';
import 'package:kindlyshare/screens/requests_list.dart';
import 'package:kindlyshare/components/bottom_navigation.dart';

class Home extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<Home> {
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
      bottomNavigationBar: BottomNav.createBottomNavBar(onTabTapped, _currentIndex),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pinkAccent,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddRequestPage(Requests('','',''))));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked
    );
  }
}