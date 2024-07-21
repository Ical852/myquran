import 'package:flutter/material.dart';
import 'package:myquran/shared/constants.dart';
import 'package:myquran/shared/text_styles.dart';

class SurahGap extends StatelessWidget {
  const SurahGap({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            "Surah",
            style: medium.prim.semiBold,
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24),
            height: 2,
            width: double.infinity,
            color: primary,
          )
        ],
      ),
    );
  }
}