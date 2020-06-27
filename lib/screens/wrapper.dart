import 'package:kindlyshare/models/users.dart';
import 'package:kindlyshare/screens/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    if (user == null){
      return Authenticate();
    }
    else{
      return Home();
    }
  }
  
}