import 'package:flutter/material.dart';
import 'package:kindlyshare/Services/auth.dart';
import 'package:kindlyshare/screens/auth/input_bar.dart';
import 'package:kindlyshare/screens/auth/ctabutton.dart';
import 'package:kindlyshare/components/colors.dart';
import 'package:kindlyshare/components/UI_components.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final TextEditingController _passwordController = new TextEditingController();
  String password = '';
  static AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent.createAppBar('My Profile'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            SizedBox(
              height: 25,
            ),
            Inputbar(
              label: 'sawamoha20@gmail.com',
            ),
            Inputbar(
              label: '*********',
              onchanged: (val) {
                setState(() => password = val);
              },
            ),
            Ctabutton(
              label: 'Logout',
              ontap: () {
                _auth.signout();
              },
            )
          ],
        ),
      ),
    );
  }
}
