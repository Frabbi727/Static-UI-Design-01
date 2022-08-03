import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  String content;
  Color? textColor;
  double? textSize;
  SmallText({Key? key,required this.content,
    this.textColor,
    this.textSize=14

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: TextStyle(
        color: textColor,
        fontSize: textSize==0?20:textSize,
      ),

    );
  }
}
