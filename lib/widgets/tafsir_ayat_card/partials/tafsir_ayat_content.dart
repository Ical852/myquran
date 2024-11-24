import 'package:flutter/material.dart';
import 'package:myquran/models/get_detail_surah_response_model.dart';
import 'package:myquran/models/get_tafsir_surah_response_model.dart';
import 'package:myquran/shared/constants.dart';
import 'package:myquran/shared/text_styles.dart';

// ignore: must_be_immutable
class TafsirAyatContent extends StatelessWidget {
  Ayat ayat;
  Tafsir tafsir;
  TafsirAyatContent({
    super.key,
    required this.ayat,
    required this.tafsir,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: greyColor.withOpacity(0.2),
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 24),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              ayat.teksArab ?? '-',
              style: large.text.bold,
              textAlign: TextAlign.right,
            ),
          ),
          SizedBox(height: 16),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Arti : ${ayat.teksIndonesia ?? '-'}",
              style: medium.text.regularF,
              textAlign: TextAlign.justify,
            ),
          ),
          SizedBox(height: 16),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Tafsir : ${tafsir.teks ?? '-'}",
              style: medium.text.regularF,
              textAlign: TextAlign.justify,
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}