import 'package:flutter/material.dart';
import 'package:myquran/shared/text_styles.dart';

// ignore: must_be_immutable
class TitleDesc extends StatelessWidget {
  String title, desc;

  TitleDesc({
    super.key,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: regular.text.semiBold,
                ),
                Text(
                  desc,
                  style: small.grey.regularF,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
