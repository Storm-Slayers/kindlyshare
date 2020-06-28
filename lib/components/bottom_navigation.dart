import 'package:flutter/material.dart';

abstract class BottomNav {
  static createBottomNavBar(action(int index), int current_index) {
    return BottomNavigationBar(
        onTap: action,
        currentIndex: current_index,
        selectedItemColor: Colors.white,
        backgroundColor: Colors.grey,
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: Text('All requests')),
            new BottomNavigationBarItem(
            icon: Icon(Icons.speaker_notes),
            title: Text('My requests')),
        ],
      );
  }
}