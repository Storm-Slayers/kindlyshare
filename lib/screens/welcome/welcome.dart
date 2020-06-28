import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key key, this.page}) : super(key: key);
  final Widget page;

  @override
  _WelcomePageState createState() => _WelcomePageState(page: page);
}

class _WelcomePageState extends State<WelcomePage> {
  Widget page;
  _WelcomePageState({this.page});

  void _pushPage() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => page,
       ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: TweenAnimationBuilder(
          duration: const Duration(milliseconds: 7000),
          tween: Tween(
            begin: 0.0,
            end: 1.0,
          ),
          onEnd: _pushPage,
          builder: (BuildContext context, dynamic value, Widget child) {
            return Center(
              child: Image.asset('assets/logo.png'),
            );
          },
        ),
      ),
    );
  }
}
