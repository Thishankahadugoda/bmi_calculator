import 'package:flutter/material.dart';
import 'constants.dart';
import 'resultpage.dart';

class Bottombutton extends StatelessWidget {
  Bottombutton({this.onTap, this.button_title});

  final Function onTap;
  final String button_title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: kBottomContainerHeight,
        color: kBottomContainercolor,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 20.0),
        child: Center(
          child: Text(button_title, style: kBottomLable),
        ),
      ),
    );
  }
}
