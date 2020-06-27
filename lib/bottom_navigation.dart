import 'package:flutter/material.dart';


abstract class BottomNav{
  static showBottomNav() {
    return BottomAppBar(
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          FlatButton.icon(
            onPressed: null, 
            icon: Icon(Icons.list), 
            label: Text('All requests')),
          FlatButton.icon(
            onPressed: null, 
            label: Text('My requests'),
            icon: Icon(Icons.speaker_notes)
            )
        ],
      )
    );
  }
}