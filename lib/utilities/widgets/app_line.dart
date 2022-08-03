import 'package:flutter/material.dart';

class AppLine extends StatelessWidget {
  double heightLine;
  Color? lineColor;
  double paddingLeft;
  double paddingRight;
   AppLine({Key? key, required this.heightLine, this.lineColor, required this.paddingLeft, required this.paddingRight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: paddingLeft, right: paddingRight),
      height: heightLine,
      color: lineColor,

    );
  }
}
