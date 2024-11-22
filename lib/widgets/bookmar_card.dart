import 'package:flutter/material.dart';
import 'package:myquran/functions/global_func.dart';
import 'package:myquran/shared/text_styles.dart';
import 'package:myquran/widgets/image_custom.dart';

// ignore: must_be_immutable
class BookmarCard extends StatelessWidget {
  String title;
  int total;
  Function() onPress;
  
  BookmarCard({
    super.key,
    required this.title,
    required this.total,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Row(
          children: [
            ImageCustom(
              width: 24,
              height: 24,
              image: AssetImage(getIC("ic-doc.png")),
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: medium.text.semiBold,
                ),
                Text(
                  "${total} items",
                  style: small.grey.mediumF,
                )
              ],
            ),
            Spacer(),
            ImageCustom(
              width: 24,
              height: 24,
              image: AssetImage(getIC("ic-options.png")),
            ),
          ],
        ),
      ),
    );
  }
}