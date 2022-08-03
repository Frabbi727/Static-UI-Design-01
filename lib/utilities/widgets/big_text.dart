import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  String content;
  Color? textColor;
  double? textSize;
  TextOverflow overFlow;

  BigText(
      {Key? key,
      required this.content,
      this.textColor,
      this.textSize = 20,
      this.overFlow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      overflow: overFlow,
      maxLines: 1,
      style: TextStyle(
          color: textColor,
          fontSize: textSize == 0 ? 20 : textSize,
          fontWeight: FontWeight.bold),
    );
  }
}
