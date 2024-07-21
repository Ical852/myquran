import 'package:flutter/material.dart';
import 'package:myquran/functions/global_func.dart';
import 'package:myquran/shared/text_styles.dart';
import 'package:myquran/widgets/image_custom.dart';

class BookmarCard extends StatelessWidget {
  const BookmarCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                "Surah",
                style: medium.text.semiBold,
              ),
              Text(
                "8 items",
                style: small.grey.mediumF,
              )
            ],
          ),
          Spacer(),
          ImageCustom(
            width: 24,
            height: 24,
            image: AssetImage(getIC("ic-options.png")),
          )
        ],
      ),
    );
  }
}