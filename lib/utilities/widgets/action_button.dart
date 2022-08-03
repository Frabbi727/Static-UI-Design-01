import 'package:flutter/material.dart';
import 'package:learning_1ui_6228/utilities/widgets/small_text.dart';

class ActionButton extends StatelessWidget {
  double? buttonHeight;
  double? buttonWidth;
  Color? buttonColor;
  String buttonName;
  Color? buttonTextColor;
  double? buttonRadious;
  Color? fontColor;

  ActionButton({
    Key? key,
    this.buttonHeight,
    this.buttonWidth,
    this.buttonColor = Colors.white,
    this.buttonTextColor = Colors.white,
    this.buttonRadious,
    required this.buttonName,
    this.fontColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: buttonHeight,
      width: buttonWidth,
      decoration: BoxDecoration(
          color: buttonColor, borderRadius: BorderRadius.circular(30)),
      child: //SmallText(content: 'Follow',textSize: 16,textColor: Colors.red,)
          Text(
        buttonName,
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: buttonTextColor),
      ),
    );
  }
}
