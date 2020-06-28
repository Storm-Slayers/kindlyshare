import 'package:flutter/material.dart';
import 'colors.dart';

abstract class BottomNav {
  static createBottomNavBar(action(int index), int current_index) {
    return BottomNavigationBar(
        onTap: action,
        currentIndex: current_index,
        selectedItemColor: Colors.white,
        backgroundColor: AppColors.bottom_nav_color,
        items: [
          new BottomNavigationBarItem(
            activeIcon: ShaderMask(
              shaderCallback: (Rect bounds) {
                return RadialGradient(
                  center: Alignment.topLeft,
                  radius: 0.5,
                  colors: <Color>[
                    AppColors.bottomnav_iccolor,
                    Colors.pink
                  ],
                  tileMode: TileMode.repeated,
                ).createShader(bounds);
              },
              child: Icon(Icons.dashboard),
            ),
            icon: Icon(Icons.dashboard),
            title: Text('All requests')),
            new BottomNavigationBarItem(
            icon: Icon(Icons.speaker_notes),
            title: Text('My requests')),
        ],
      );
  }
}