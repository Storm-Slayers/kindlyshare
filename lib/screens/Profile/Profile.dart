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
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            SizedBox(
              height: 25,
            ),
            Container(
              width: 145.0,
              height: 145.0,
              decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                  fit: BoxFit.cover,
                  image: new NetworkImage(
                      "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                ),
              ),
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
              label: 'Edit Profile',
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
