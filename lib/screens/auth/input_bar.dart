import 'package:flutter/material.dart';
import 'package:kindlyshare/components/colors.dart';

class Inputbar extends StatefulWidget {
  Inputbar({this.label,this.onchanged, this.icon, this.ontap,this.validator,this.onsave,this.controller});
  final String label;
  final icon;
  final Function ontap;
  final Function validator;
  final Function onsave;
  final Function onchanged;
  final controller;
  @override
  _InputbarState createState() => _InputbarState();
}

class _InputbarState extends State<Inputbar> {
  bool _showPassword = false;
  void togglevisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  void ispassword() {
    if (widget.label == 'Password') {
      _showPassword = true;
    } else {
      _showPassword = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 34),
        child: TextFormField(
          controller: widget.controller,
          onChanged: widget.onchanged,
          validator: widget.validator,
          onSaved: widget.onsave,
          obscureText: _showPassword,
          decoration: InputDecoration(
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(38)),
              borderSide: BorderSide(color: Color(0xFFE7A1AD)),
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                togglevisibility();
              },
              child: Padding(
                  padding: EdgeInsets.fromLTRB(33.0, 15, 20, 15),
                  child: widget.icon),
            ),
            contentPadding: EdgeInsets.fromLTRB(33.0, 20, 20, 20.0),
            hintText: widget.label,
            hintStyle: TextStyle(
              fontFamily: 'Muli-Light',
              fontSize: 17.0,
              letterSpacing: 0.5,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(38)),
              borderSide: BorderSide(color: AppColors.button_gradient2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(38)),
              borderSide: BorderSide(color: AppColors.button_gradient2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(38)),
              borderSide: BorderSide(color: AppColors.button_gradient2),
            ),
            fillColor: Colors.white
          ),
        ),
      ),
    );
  }
}
