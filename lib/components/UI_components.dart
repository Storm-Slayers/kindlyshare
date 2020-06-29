import 'package:flutter/material.dart';
import 'colors.dart';
import 'package:kindlyshare/Services/auth.dart';

abstract class GradientButton {
  static createGradientButton(String text, action()) {
    return GestureDetector(
      onTap: () {
        action();
      },
      child: Container(
        width: double.maxFinite,
        height: 80,
        margin: EdgeInsets.only(top: 12.00),
        padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 13),
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

abstract class AppBarComponent {
  static AuthService _auth = AuthService();

  static void handleClick(String value) {
    switch (value) {
      case 'Logout':
        _auth.signout();
        break;
      case 'User profile':
      
        break;
    }
  }

  static createAppBar(String title_text) {
    return AppBar(
      title: Text(title_text),
      actions: <Widget>[
        PopupMenuButton<String>(
          onSelected: handleClick,
          itemBuilder: (BuildContext context) {
            return {'Logout', 'User profile'}.map((String choice) {
              return PopupMenuItem<String>(
                value: choice,
                child: Text(choice),
              );
            }).toList();
          },
        ),
      ],
    );
  }
}

abstract class NewAlertDialog {
  static showAlertDialog(
      BuildContext context, String alertTitle, String alertText) {
    AlertDialog alert = AlertDialog(
      title: new Text(alertTitle),
      content: new Text(alertText),
      actions: <Widget>[
        // usually buttons at the bottom of the dialog
        new FlatButton(
          child: new Text("OK"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );

    showDialog(context: context, builder: (_) => alert);
  }
}
