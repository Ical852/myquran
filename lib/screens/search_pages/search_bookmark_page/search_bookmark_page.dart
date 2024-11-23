import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myquran/blocs/cubits/bookmark_ayat_cubit.dart';
import 'package:myquran/blocs/cubits/bookmark_surah_cubit.dart';
import 'package:myquran/functions/global_func.dart';
import 'package:myquran/models/get_detail_surah_response_model.dart';
import 'package:myquran/models/get_surah_response_model.dart' as surahModel;
import 'package:myquran/screens/search_pages/search_bookmark_page/partials/bookmarked_ayat.dart';
import 'package:myquran/screens/search_pages/search_bookmark_page/partials/bookmarked_surah.dart';
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
  List<Ayat>? filteredAyat;

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
      if (widget.type == 'surah') return BookmarkedSurah(filteredSurahs);
      return BookmarkedAyat(filteredAyat);
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
                  if (widget.type == 'surah') {
                    final surahs = context.read<BookmarkSurahCubit>().state;
                    filterSurahs(keyword, surahs);
                  } else {
                    final ayat = context.read<BookmarkAyatCubit>().state;
                    filterAyat(keyword, ayat);
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