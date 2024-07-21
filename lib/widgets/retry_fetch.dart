import 'package:flutter/material.dart';
import 'package:myquran/shared/text_styles.dart';
import 'package:myquran/widgets/buttons/mini_button_custom.dart';

// ignore: must_be_immutable
class RetryFetch extends StatelessWidget {
  String title;
  Function() onRefetch;

  RetryFetch({
    super.key,
    required this.title,
    required this.onRefetch,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: large.text.semiBold,
          ),
          SizedBox(height: 12),
          MiniButtonCustom(
            title: "Try Again",
            onPressed: onRefetch
          )
        ],
      ),
    );
  }
}