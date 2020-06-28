import 'package:kindlyshare/models/users.dart';
import 'package:kindlyshare/screens/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:kindlyshare/screens/welcome/welcome.dart';
import 'package:provider/provider.dart';
import 'home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print('user: $user');
    if (user == null) {
      return WelcomePage(page: Authenticate());
    } else {
      return Home();
    }
  }
}
