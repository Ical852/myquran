import 'package:myquran/functions/global_func.dart';
import 'package:myquran/shared/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:myquran/widgets/image_custom.dart';

// ignore: must_be_immutable
class NavItem extends StatelessWidget {
  String icon, title;
  Function() onPress;

  NavItem({
    required this.icon,
    required this.title,
    required this.onPress
  });
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.all(12),
        child: Row(
          children: [
            ImageCustom(
              width: 24,
              height: 24,
              image: AssetImage(getIC(icon)),
              fit: BoxFit.cover,
            ),
            SizedBox(width: 12),
            Text(
              title,
              style: regular.prim.semiBold,
            ),
          ],
        ),
      ),
    );
  }
}