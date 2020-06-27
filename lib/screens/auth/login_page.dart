import 'package:flutter/material.dart';
import 'package:kindlyshare/screens/auth/input_bar.dart';
import 'package:kindlyshare/screens/auth/ctabutton.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kindlyshare/Services/auth.dart';

import '../../loading.dart';

bool validateEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  return (!regex.hasMatch(value)) ? false : true;
}

class Login extends StatefulWidget {
  final Function toggleView;
  Login({this.toggleView});
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthService _auth = AuthService();
  final formkey = GlobalKey<FormState>();
  bool loading = false;
  String email = '';
  String password = '';
  String error = ' ';
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Form(
            key: formkey,
            child: SafeArea(
              child: Scaffold(
                resizeToAvoidBottomInset: true,
                body: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: SvgPicture.asset(
                          'assets/logo.svg',
                          width: 240,
                          height: 249,
                        ),
                      ),
                      Column(
                        children: <Widget>[
                          Inputbar(
                            onchanged: (val) {
                              setState(() => email = val);
                            },
                            label: 'Email',
                            validator: (String value) {
                              if (validateEmail(value) == false) {
                                return 'Please enter a valid email';
                              } else {
                                return null;
                              }
                            },
                          ),
                          Inputbar(
                            label: 'Password',
                            validator: (String value) {
                              if (value.isEmpty == true) {
                                return 'Please enter a password';
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
                            label: 'Log-in',
                            ontap: () async {
                              if (formkey.currentState.validate()) {
                                setState(() => loading = true);
                                print('$email:$password');
                                dynamic result =
                                    await _auth.signinWithEmailAndPassword(
                                        email, password);
                                if (result == null) {
                                  setState(() {
                                    error =
                                        'There is a problem in the credentiels provided';
                                    loading = false;
                                  });
                                }
                              }
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Ctabutton(
                            label: 'Create Account',
                            ontap: () {
                              widget.toggleView();
                            },
                          ),
                          SizedBox(height: 12.0),
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
