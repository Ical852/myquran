import 'package:flutter/material.dart';
import 'package:myquran/functions/global_func.dart';
import 'package:myquran/shared/constants.dart';
import 'package:myquran/shared/text_styles.dart';
import 'package:myquran/widgets/image_custom.dart';

// ignore: must_be_immutable
class SearcInputhBookmark extends StatelessWidget {
  TextEditingController searchController;
  Function() onBack;
  Function(String) onFieldSubmitted;

  SearcInputhBookmark({
    super.key,
    required this.onBack,
    required this.searchController,
    required this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 82,
      width: double.infinity,
      color: primary,
      padding: EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 16
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: onBack,
            child: Container(
              height: 45,
              width: 45,
              margin: EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: whiteColor
              ),
              child: Center(
                child: ImageCustom(
                  height: 24,
                  width: 24,
                  image: AssetImage(getIC("ic-back-search.png")),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: whiteColor
              ),
              child: Stack(
                children: [
                  TextFormField(
                    controller: searchController,
                    decoration: InputDecoration(
                      labelText: "Search quran",
                      labelStyle: regular.grey.regularF,
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(right: 52, left: 16)
                    ),
                    onFieldSubmitted: onFieldSubmitted,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ImageCustom(
                      margin: EdgeInsets.only(right: 16),
                      width: 24,
                      height: 24,
                      image: AssetImage(getIC("ic-search-page.png")),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}