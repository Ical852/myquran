import 'package:flutter/material.dart';
import 'package:myquran/functions/global_func.dart';
import 'package:myquran/models/get_surah_response_model.dart';
import 'package:myquran/shared/constants.dart';
import 'package:myquran/shared/text_styles.dart';
import 'package:myquran/widgets/ayat_card.dart';
import 'package:myquran/widgets/header_custom.dart';
import 'package:myquran/widgets/image_custom.dart';

// ignore: must_be_immutable
class SurahDetailPage extends StatefulWidget {
  Data surah;
  SurahDetailPage(this.surah);

  @override
  State<SurahDetailPage> createState() => _SurahDetailPageState();
}

class _SurahDetailPageState extends State<SurahDetailPage> {
  @override
  Widget build(BuildContext context) {
    Widget HeaderContent() {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 32
        ),
        child: HeaderCustom(
          backAble: true,
          title: "Al-Fatihah",
          onSearch: () => {
            Navigator.pushNamed(context, "/search")
          },
        ),
      );
    }

    Widget OnGoingContent() { 
      return Container(
        margin: EdgeInsets.symmetric(
          vertical: 28
        ),
        child: Column(
          children: [
            Text(
              "Al-Fatihah",
              style: xLarge.white.semiBold,
            ),
            Text(
              "The Opening",
              style: medium.white.mediumF,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 64,
                vertical: 16
              ),
              height: 1,
              color: white,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Mekkah",
                  style: regular.white.mediumF,
                ),
                Container(
                  width: 4,
                  height: 4,
                  margin: EdgeInsets.symmetric(
                    horizontal: 8
                  ),
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(50)
                  ),
                ),
                Text(
                  "7 Verses",
                  style: regular.white.mediumF,
                ),
              ],
            ),
            Spacer(),
            ImageCustom(
              width: 214,
              height: 48,
              image: AssetImage(getIM("bismillah.png")),
            )
          ],
        ),
      );
    }

    Widget OnGoingTop() {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: 24
        ),
        child: ImageCustom(
          width: double.infinity,
          height: 257,
          image: AssetImage(getIM("on-going-bg.png")),
          fit: BoxFit.cover,
          borderRadius: BorderRadius.circular(20),
          child: OnGoingContent(),
        ),
      );
    }

    Widget AyatList() {
      return Container(
        margin: EdgeInsets.only(
          top: 32,
          left: 24,
          right: 24
        ),
        child: Column(
          children: [
            AyatCard(),
            AyatCard(),
            AyatCard(),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeaderContent(),
              OnGoingTop(),
              AyatList(),
            ],
          ),
        ),
      ),
    );
  }
}