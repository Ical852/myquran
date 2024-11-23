import 'package:flutter/material.dart';
import 'package:myquran/functions/global_func.dart';
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
      if (widget.type == 'surah') return BookmarkedSurah();
      return BookmarkedAyat();
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              SearcInputhBookmark(
                onBack: () => Navigator.pop(context),
                searchController: searchController,
                onFieldSubmitted: (e){}
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