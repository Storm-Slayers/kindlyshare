import 'package:flutter/material.dart';
import 'colors.dart';

abstract class BottomNav {
  static createBottomNavBar(action(int index), int current_index) {
    return BottomNavigationBar(
        onTap: action,
        currentIndex: current_index,
        selectedItemColor: AppColors.bottomnav_iccolor,
        backgroundColor: AppColors.bottom_nav_color,
        items: [
          new BottomNavigationBarItem(
            activeIcon: ShaderMask(
              shaderCallback: (Rect bounds) {
                return RadialGradient(
                  center: Alignment.topLeft,
                  radius: 0.6,
                  colors: <Color>[
                    AppColors.bottomnav_iccolor,
                    Colors.pink
                  ],
                  tileMode: TileMode.repeated,
                ).createShader(bounds);
              },
              child: Icon(Icons.speaker_notes, color: Colors.white),
            ),
            icon: Icon(Icons.speaker_notes),
            title: Text('All requests',
            
            ),
            ),
            new BottomNavigationBarItem(
              activeIcon: ShaderMask(
              shaderCallback: (Rect bounds) {
                return RadialGradient(
                  center: Alignment.topLeft,
                  radius: 0.6,
                  colors: <Color>[
                    AppColors.bottomnav_iccolor,
                    Colors.pink
                  ],
                  tileMode: TileMode.repeated,
                ).createShader(bounds);
              },
              child: Icon(Icons.question_answer, color: Colors.white),
            ),
            icon: Icon(Icons.question_answer),
            title: Text(
              'My requests', 
              )),
        ],
      );
  }
}