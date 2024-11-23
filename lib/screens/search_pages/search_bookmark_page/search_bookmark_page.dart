import 'package:flutter/material.dart';
import 'package:myquran/functions/global_func.dart';
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
        margin: EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 20,
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
              SingleChildScrollView(
                child: Column(
                  children: [
                    BookmarkHead(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}