import 'package:flutter/material.dart';
import 'package:kindlyshare/screens/auth/input_bar.dart';
import 'package:kindlyshare/screens/auth/ctabutton.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kindlyshare/Services/auth.dart';
import 'package:kindlyshare/components/colors.dart';

import '../../loading.dart';

bool validateEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  return (!regex.hasMatch(value)) ? false : true;
}

String email;
String password;

final TextEditingController _passwordController = new TextEditingController();

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  String name = '';
  String email = '';
  bool loading = false;
  String password = '';
  String error = ' ';
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Form(
            key: formKey,
            child: SafeArea(
              child: Scaffold(
                resizeToAvoidBottomInset: true,
                backgroundColor: AppColors.bg_color,
                body: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: SvgPicture.asset(
                          'assets/logo.svg',
                          width: 253,
                          height: 262,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Column(
                        children: <Widget>[
                          Inputbar(
                            label: 'Full Name',
                            onchanged: (val) {
                              setState(() => name = val);
                            },
                            validator: (String value) {
                              if (value.isEmpty == true) {
                                return 'Please enter your name';
                              } else {
                                return null;
                              }
                            },
                          ),
                          Inputbar(
                            label: 'Email',
                            onchanged: (val) {
                              setState(() => email = val);
                            },
                            validator: (String value) {
                              if (validateEmail(value) == false) {
                                return 'Please enter a valid email';
                              } else {
                                return null;
                              }
                            },
                            onsave: (value) => email = value,
                          ),
                          Inputbar(
                            controller: _passwordController,
                            label: 'Password',
                            validator: (String value) {
                              if (value.length < 6) {
                                return 'password should be longer than 6 characters';
                              } else {
                                return null;
                              }
                            },
                            onchanged: (val) {
                              setState(() => password = val);
                            },
                            icon: Icon(
                              Icons.remove_red_eye,
                              color: Colors.grey,
                            ),
                          ),
                          Ctabutton(
                            label: 'Register',
                            ontap: () async {
                              if (formKey.currentState.validate()) {
                                setState(() => loading = true);
                                print('$email:$password');
                                dynamic result =
                                    await _auth.registerWithEmailAndPassword(
                                        email, password, name);
                                if (result == null) {
                                  setState(() {
                                    error = 'Please supply a valid email';
                                    loading = false;
                                  });
                                }
                              }
                            },
                          ),
                          SizedBox(height: 15.0),
                          Ctabutton(
                            label: 'back',
                            ontap: () {
                              widget.toggleView();
                            },
                          ),
                          Text(
                            error,
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 14.0,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
