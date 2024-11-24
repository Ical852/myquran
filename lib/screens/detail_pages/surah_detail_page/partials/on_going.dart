import 'package:flutter/material.dart';
import 'package:myquran/functions/global_func.dart';
import 'package:myquran/models/get_detail_surah_response_model.dart';
import 'package:myquran/screens/detail_pages/detail_tafsir_page/detail_tafsir_page.dart';
import 'package:myquran/shared/constants.dart';
import 'package:myquran/shared/text_styles.dart';
import 'package:myquran/widgets/buttons/mini_button_custom.dart';
import 'package:myquran/widgets/image_custom.dart';

// ignore: must_be_immutable
class OnGoing extends StatelessWidget {
  Data surah;
  OnGoing({
    super.key,
    required this.surah,
  });

  @override
  Widget build(BuildContext context) {
    Widget OnGoingContent() {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 28),
        child: Column(
          children: [
            Text(
              surah.namaLatin ?? '-',
              style: xLarge.white.semiBold,
            ),
            Text(
              surah.arti ?? '-',
              style: medium.white.mediumF,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 64, vertical: 16),
              height: 1,
              color: white,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  surah.tempatTurun ?? '-',
                  style: regular.white.mediumF,
                ),
                Container(
                  width: 4,
                  height: 4,
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                Text(
                  "${surah.jumlahAyat} Verses",
                  style: regular.white.mediumF,
                ),
              ],
            ),
            Spacer(),
            ImageCustom(
              width: 214,
              height: 48,
              image: AssetImage(getIM("bismillah.png")),
            ),
          ],
        ),
      );
    }

    Widget SurahDesc() {
      return Container(
        margin: EdgeInsets.only(top: 24),
        child: Column(
          children: [
            Text(
              cleanHTML(surah.deskripsi!),
              style: regular.text.mediumF,
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 16),
            MiniButtonCustom(
              height: 25,
              textStyle: regular.white.semiBold,
              btnColor: primary,
              title: "Check Tafsir",
              onPressed: () => goToPage(context, DetailTafsirPage(surah)),
            )
          ],
        ),
      );
    }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          ImageCustom(
            width: double.infinity,
            height: 257,
            image: AssetImage(getIM("on-going-bg.png")),
            fit: BoxFit.cover,
            borderRadius: BorderRadius.circular(20),
            child: OnGoingContent(),
          ),
          SurahDesc(),
        ],
      ),
    );
  }
}