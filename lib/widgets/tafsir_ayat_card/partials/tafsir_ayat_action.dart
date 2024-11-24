import 'package:flutter/material.dart';
import 'package:myquran/functions/global_func.dart';
import 'package:myquran/shared/constants.dart';
import 'package:myquran/shared/text_styles.dart';
import 'package:myquran/widgets/image_custom.dart';

// ignore: must_be_immutable
class TafsirAyatAction extends StatelessWidget {
  int ayatNumber;
  Function() onBookmark;
  bool isBookmarked;

  TafsirAyatAction({
    super.key,
    required this.ayatNumber,
    required this.onBookmark,
    this.isBookmarked = false,
  });

  @override
  Widget build(BuildContext context) {
    Widget RenderIcon(String icon) {
      return ImageCustom(
        height: 24,
        width: 24,
        image: AssetImage(getIC(icon)),
      );
    }

    return Container(
      decoration: BoxDecoration(
        color: Color(0xff121931).withOpacity(0.05),
        borderRadius: BorderRadius.circular(10)
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 10,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 27,
                height: 27,
                decoration: BoxDecoration(
                  color: primary,
                  borderRadius: BorderRadius.circular(50)
                ),
                child: Center(
                  child: Text(
                    ayatNumber.toString(),
                    style: regular.white.semiBold,
                  ),
                ),
              ),
              GestureDetector(
                onTap: onBookmark,
                child: RenderIcon("ic-ayat-bookmark${isBookmarked ? "ed" : ""}.png"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}