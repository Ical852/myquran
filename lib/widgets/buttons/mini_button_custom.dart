import 'package:flutter/material.dart';
import 'package:myquran/shared/constants.dart';
import 'package:myquran/shared/text_styles.dart';

// ignore: must_be_immutable
class MiniButtonCustom extends StatelessWidget {
  String title;
  double? width, height;
  Function() onPressed;
  TextStyle? textStyle;
  Color? btnColor;

  MiniButtonCustom({
    required this.title,
    required this.onPressed,
    this.width,
    this.height,
    this.textStyle,
    this.btnColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: btnColor ?? greenSec,
      ),
      width: width ?? 200,
      height: height ?? 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent.withOpacity(0.1),
        ),
        child: Text(
          title,
          style: textStyle ?? medium.text.semiBold,
        ),
      ),
    );
  }
}
