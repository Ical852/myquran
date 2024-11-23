import 'package:flutter/material.dart';
import 'package:myquran/functions/global_func.dart';
import 'package:myquran/shared/constants.dart';
import 'package:myquran/shared/text_styles.dart';
import 'package:myquran/widgets/image_custom.dart';

// ignore: must_be_immutable
class MenuItemCustom extends StatelessWidget {
  String icon;
  bool active;
  Function() onPress;

  MenuItemCustom({
    required this.icon,
    this.active = false,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    String getIcon() {
      if (icon == 'bookmark') {
        return active ? 'ic-bookmark-active.png' : 'ic-bookmark.png';
      }
      return active ? 'ic-home-active.png' : 'ic-home.png';
    }

    Text GeneratedText() {
      return Text(
        capitalize(icon),
        style: regular.copyWith(
          fontWeight: active ? fontSemiBold : fontRegular,
          color: active ? primary : secondary,
        ),
      );
    }

    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageCustom(
              width: 24,
              height: 24,
              image: AssetImage(getIC(getIcon())),
            ),
            GeneratedText(),
          ],
        ),
      ),
    );
  }
}
