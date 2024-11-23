import 'package:flutter/material.dart';
import 'package:myquran/functions/global_func.dart';
import 'package:myquran/shared/text_styles.dart';
import 'package:myquran/widgets/image_custom.dart';

// ignore: must_be_immutable
class NoData extends StatelessWidget {
  String title, desc;
  NoData({
    super.key,
    required this.title,
    required this.desc
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      child: Column(
        children: [
          ImageCustom(
            height: 250,
            width: 250,
            image: AssetImage(getIL("no-data.png")),
            fit: BoxFit.cover,
          ),
          SizedBox(height: 16),
          Text(
            title,
            style: large.text.semiBold,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 6),
          Text(
            desc,
            style: regular.grey.regularF,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}