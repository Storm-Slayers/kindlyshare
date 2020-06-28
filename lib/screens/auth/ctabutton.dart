import 'package:flutter/material.dart';
import 'package:kindlyshare/components/colors.dart';

class Ctabutton extends StatelessWidget {
  Ctabutton({this.label,this.ontap});
  final String label;
  final Function ontap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: 34, vertical: 13),
      child: GestureDetector(
        onTap: ontap,
      child: SizedBox(
        width: double.maxFinite,
        height: 60,
        // child: FlatButton(
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(38),
        //   ),
        //   color: Color(0xFFEF7F92),
        //   onPressed: ontap,
        //   child: Text(
        //     label,
        //     style: TextStyle(
        //       fontFamily: 'Muli-SemiBold',
        //       fontSize: 20,
        //       color: Colors.white,
        //       letterSpacing: 1.5,
        //     ),
        //   ),
        // ),
        child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.button_gradient1,
              AppColors.button_gradient2,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(38),
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
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
      ),
      ),
    ),
    ),
    );
  }
}