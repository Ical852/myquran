import 'package:flutter/material.dart';
import 'package:myquran/functions/global_func.dart';
import 'package:myquran/screens/detail_pages/surah_detail_page/surah_detail_page.dart';
import 'package:myquran/shared/constants.dart';
import 'package:myquran/shared/text_styles.dart';
import 'package:myquran/widgets/header_custom.dart';
import 'package:myquran/widgets/image_custom.dart';
import 'package:myquran/widgets/surah_card.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    Widget HeaderContent() {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 32
        ),
        child: HeaderCustom(
          title: "Home",
          onSearch: (){},
        ),
      );
    }

    Widget LastReadContent() {
      return Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ImageCustom(
                  height: 20,
                  width: 20,
                  image: AssetImage(getIC("ic-last-read.png")),
                ),
                SizedBox(width: 8),
                Text(
                  "Last read",
                  style: regular.white.mediumF,
                )
              ],
            ),
            Spacer(),
            Text(
              "Al-Fatihah",
              style: large.white.semiBold,
            ),
            SizedBox(width: 4),
            Text(
              "Ayat No: 1",
              style: regular.white.regularF,
            )
          ],
        ),
      );
    }

    Widget LastRead() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(
          left: 24,
          right: 24,
          bottom: 32
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Asslamualaikum",
              style: large.grey.mediumF,
            ),
            SizedBox(height: 4),
            ImageCustom(
              width: double.infinity,
              height: 131,
              image: AssetImage(getIM("bg-last-read.png")),
              fit: BoxFit.cover,
              borderRadius: BorderRadius.circular(10),
              child: LastReadContent(),
            )
          ],
        ),
      );
    }

    Widget SurahGap() {
      return Container(
        child: Column(
          children: [
            Text(
              "Surah",
              style: medium.prim.semiBold,
            ),
            SizedBox(height: 16,),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 24
              ),
              height: 2,
              width: double.infinity,
              color: primary,
            )
          ],
        ),
      );
    }

    Widget SurahList() {
      return Container(
        margin: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 8
        ),
        child: Column(
          children: [
            GestureDetector(
              onTap: () => goToPage(context, SurahDetailPage()),
              child: SurahCard()
            ),
            SurahCard(),
            SurahCard(),
          ],
        ),
      );
    }

    return Container(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            HeaderContent(),
            LastRead(),
            SurahGap(),
            SurahList()
          ],
        ),
      ),
    );
  }
}