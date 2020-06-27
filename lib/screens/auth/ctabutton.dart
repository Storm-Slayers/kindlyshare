import 'package:flutter/material.dart';
class Ctabutton extends StatelessWidget {
  Ctabutton({this.label,this.ontap});
  final String label;
  final Function ontap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: 34, vertical: 13),
      child: SizedBox(
        width: double.maxFinite,
        height: 60,
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(38),
          ),
          color: Color(0xFFEF7F92),
          onPressed: ontap,
          child: Text(
            label,
            style: TextStyle(
              fontFamily: 'Muli-SemiBold',
              fontSize: 20,
              color: Colors.white,
              letterSpacing: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}