import 'package:flutter/material.dart';
import 'colors.dart';

abstract class GradientButton {
  static createGradientButton(String text, action()) {
    return GestureDetector(
      onTap: () {action();},
      child: Container(
        width: double.maxFinite,
        height: 80,
        margin: EdgeInsets.only(top: 12.00),
        padding:
          const EdgeInsets.symmetric(horizontal: 34, vertical: 13),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.button_gradient1,
              AppColors.button_gradient2,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(5, 5),
              blurRadius: 10,
            )
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}