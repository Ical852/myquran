import 'package:flutter/material.dart';
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
    required this.onPress
  });

  @override
  Widget build(BuildContext context) {
    String getIcon() {
      if (icon == 'home') {
        return active ? 'ic-home-active.png' : 'ic-home.png';
      } else if (icon == 'bookmark') {
        return active ? 'ic-bookmark-active.png' : 'ic-bookmark.png';
      } else {
        return active ? 'ic-home-active.png' : 'ic-home.png';
      }
    }

    ImageProvider GeneratedIcon() {
      return AssetImage('assets/icons/' + getIcon());
    }

    String getMenuTitle() {
      if (icon == 'home') {
        return 'Home';
      } else if (icon == 'bookmark') {
        return 'Bookmark';
      } else {
        return 'Home';
      }
    }

    Text GeneratedText() {
      return Text(
        getMenuTitle(),
        style: regular.copyWith(
          fontWeight: active ? fontSemiBold : fontRegular,
          color: active ? primary : secondary
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
              image: GeneratedIcon(),
            ),
            GeneratedText()
          ],
        ),
      ),
    );
  }
}
