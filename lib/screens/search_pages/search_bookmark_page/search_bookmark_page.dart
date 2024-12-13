import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myquran/blocs/cubits/bookmark_ayat_cubit.dart';
import 'package:myquran/blocs/cubits/bookmark_surah_cubit.dart';
import 'package:myquran/blocs/cubits/bookmark_tafsir.dart';
import 'package:myquran/blocs/cubits/bookmark_tafsir_ayat_cubit.dart';
import 'package:myquran/functions/global_func.dart';
import 'package:myquran/models/get_detail_surah_response_model.dart';
import 'package:myquran/models/get_surah_response_model.dart' as surahModel;
import 'package:myquran/screens/search_pages/search_bookmark_page/partials/bookmarked_ayat.dart';
import 'package:myquran/screens/search_pages/search_bookmark_page/partials/bookmarked_surah.dart';
import 'package:myquran/screens/search_pages/search_bookmark_page/partials/bookmarked_tafsir.dart';
import 'package:myquran/screens/search_pages/search_bookmark_page/partials/bookmarked_tafsir_ayat.dart';
import 'package:myquran/screens/search_pages/search_bookmark_page/search_input_bookmark.dart';
import 'package:myquran/shared/constants.dart';
import 'package:myquran/widgets/title_desc.dart';

// ignore: must_be_immutable
class SearchBookmarkPage extends StatefulWidget {
  String type;
  SearchBookmarkPage(this.type);

  @override
  State<SearchBookmarkPage> createState() => _SearchBookmarkPageState();
}

class _SearchBookmarkPageState extends State<SearchBookmarkPage> {
  TextEditingController searchController = TextEditingController(text: "");
  List<surahModel.Data>? filteredSurahs;
  List<TafsirModel>? filteredTafsir;
  List<Ayat>? filteredAyat;
  List<TafsirAyatModel>? filteredTafsirAyat;

  void filterSurahs(String keyword, List<surahModel.Data> allSurahs) {
    setState(() {
      if (keyword.isEmpty) {
        filteredSurahs = allSurahs;
      } else {
        filteredSurahs = allSurahs
          .where(
            (surah) => surah.namaLatin!
              .toLowerCase()
              .contains(keyword.toLowerCase())
          ).toList();
      }
    });
  }

  void filterAyat(String keyword, List<Ayat> allAyat) {
    setState(() {
      if (keyword.isEmpty) {
        filteredAyat = allAyat;
      } else {
        filteredAyat = allAyat
          .where(
            (surah) => 
              surah.teksIndonesia!
              .toLowerCase()
              .contains(keyword.toLowerCase()) ||
              surah.teksLatin!
              .toLowerCase()
              .contains(keyword.toLowerCase()) ||
              surah.teksArab!
              .toLowerCase()
              .contains(keyword.toLowerCase())
          ).toList();
      }
    });
  }

  void filterTafsir(String keyword, List<TafsirModel> tafsirs) {
    setState(() {
      if (keyword.isEmpty) {
        filteredTafsir = tafsirs;
      } else {
        filteredTafsir = tafsirs
          .where(
            (tsfm) => tsfm.surah!.namaLatin!
              .toLowerCase()
              .contains(keyword.toLowerCase())
          ).toList();
      }
    });
  }

  void filterTafsirAyat(String keyword, List<TafsirAyatModel> allTafsirAyat) {
    setState(() {
      if (keyword.isEmpty) {
        filteredTafsirAyat = allTafsirAyat;
      } else {
        filteredTafsirAyat = allTafsirAyat
          .where(
            (tsfam) => 
              tsfam.ayat.teksIndonesia!
              .toLowerCase()
              .contains(keyword.toLowerCase()) ||
              tsfam.ayat.teksLatin!
              .toLowerCase()
              .contains(keyword.toLowerCase()) ||
              tsfam.ayat.teksArab!
              .toLowerCase()
              .contains(keyword.toLowerCase()) ||
              tsfam.tafsir.teks!
              .toLowerCase()
              .contains(keyword.toLowerCase()) 
          ).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget BookmarkHead() {
      return Container(
        margin: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 20,
          bottom: 8,
        ),
        child: Column(
          children: [
            TitleDesc(
              title: "Bookmarked ${capitalize(this.widget.type)}",
              desc: "All of your bookmarked ${this.widget.type}",
            ),
          ],
        ),
      );
    }

    Widget BookmarkContent() {
      switch (widget.type) {
        case 'surah':
          return BookmarkedSurah(filteredSurahs);
        case 'tafsir':
          return BookmarkedTafsir(filteredTafsir);
        case 'tafsir ayat':
          return BookmarkedTafsirAyat(filteredTafsirAyat);
        default:
          return BookmarkedAyat(filteredAyat);
      }
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              SearcInputhBookmark(
                placeholder: "Search ${widget.type}",
                onBack: () => Navigator.pop(context),
                searchController: searchController,
                onFieldSubmitted: (keyword){
                  switch (widget.type) {
                    case 'surah':
                      final surahs = context.read<BookmarkSurahCubit>().state;
                      return filterSurahs(keyword, surahs);
                    case 'tafsir':
                      final tafsirs = context.read<BookmarkTafsirCubit>().state;
                      return filterTafsir(keyword, tafsirs);
                    case 'tafsir ayat':
                      final tafsirAyats = context.read<BookmarkTafsirAyatCubit>().state;
                      return filterTafsirAyat(keyword, tafsirAyats);
                    default:
                      final ayat = context.read<BookmarkAyatCubit>().state;
                      return filterAyat(keyword, ayat);
                  }
                }
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      BookmarkHead(),
                      BookmarkContent(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}