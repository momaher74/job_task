import 'package:flutter/material.dart';

class SharedText extends StatelessWidget {
  SharedText({
    Key? key,
    required this.txt,
    required this.color,
    required this.txtSize,
    this.fontWeight,
    this.fontStyle,
  }) : super(key: key);
  final String txt;
  final Color color;

  final double txtSize;
  FontStyle? fontStyle;

  FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return  Text(
      txt,
      style: TextStyle(
        color: color,
        fontSize: txtSize,
        fontStyle: fontStyle ?? FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
    );
  }
}
