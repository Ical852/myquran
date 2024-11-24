import 'package:flutter/material.dart';
import 'package:myquran/models/get_detail_surah_response_model.dart';
import 'package:myquran/models/get_tafsir_surah_response_model.dart';
import 'package:myquran/widgets/tafsir_ayat_card/partials/tafsir_ayat_action.dart';
import 'package:myquran/widgets/tafsir_ayat_card/partials/tafsir_ayat_content.dart';

// ignore: must_be_immutable
class TafsirAyatCard extends StatefulWidget {
  Ayat ayat;
  Tafsir tafsir;
  Function() onBookmark;
  bool isBookmarked;

  TafsirAyatCard({
    super.key,
    required this.ayat,
    required this.tafsir,
    required this.onBookmark,
    this.isBookmarked = false,
  });

  @override
  State<TafsirAyatCard> createState() => _TafsirAyatCardState();
}

class _TafsirAyatCardState extends State<TafsirAyatCard> {
  var audioOpen = false;

  @override
  Widget build(BuildContext context) {
    var ayat = widget.ayat;
    var tafsir = widget.tafsir;
    var onBookmark = widget.onBookmark;
    var isBookmarked = widget.isBookmarked;

    return Column(
      children: [
        TafsirAyatAction(
          ayatNumber: ayat.nomorAyat!,
          onBookmark: onBookmark,
          isBookmarked: isBookmarked,
        ),
        TafsirAyatContent(
          ayat: ayat,
          tafsir: tafsir
        ),
      ],
    );
  }
}