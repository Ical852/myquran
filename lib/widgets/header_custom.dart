import 'package:flutter/material.dart';
import 'package:myquran/functions/global_func.dart';
import 'package:myquran/shared/text_styles.dart';
import 'package:myquran/widgets/image_custom.dart';

// ignore: must_be_immutable
class HeaderCustom extends StatelessWidget {
  String title;
  String leftIcon, rightIcon;
  double leftIconWidth, leftIconHeight, rightIcWidth, rightIcHeight;
  Function()? onLeft, onRight;

  HeaderCustom({
    super.key,
    required this.title,
    this.onLeft = null,
    this.onRight = null,
    this.leftIcon = "ic-back.png",
    this.rightIcon = "ic-search.png",
    this.leftIconWidth = 26,
    this.leftIconHeight = 26,
    this.rightIcWidth = 24,
    this.rightIcHeight = 24,
  });

  @override
  Widget build(BuildContext context) {
    Widget LeftContent() {
      return GestureDetector(
        onTap: (){
          if (leftIcon == "ic-back.png") Navigator.pop(context);
          if (onLeft != null) onLeft!();
        },
        child: ImageCustom(
          height: leftIconHeight,
          width: leftIconWidth,
          image: AssetImage(getIC(leftIcon)),
        ),
      );
    }
    
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              LeftContent(),
              SizedBox(width: 32),
              Text(
                title,
                style: mega.text.bold,
              ),
            ],
          ),
          GestureDetector(
            onTap: (){
              if (onRight != null) onRight!();
            },
            child: ImageCustom(
              height: rightIcHeight,
              width: rightIcWidth,
              image: AssetImage(getIC(rightIcon)),
            ),
          ),
        ],
      ),
    );
  }
}