import 'package:flutter/material.dart';
import 'package:myquran/screens/search_pages/search_bookmark_page/search_input_bookmark.dart';
import 'package:myquran/shared/constants.dart';
import 'package:myquran/shared/text_styles.dart';

class SearchBookmarkPage extends StatefulWidget {
  const SearchBookmarkPage({super.key});

  @override
  State<SearchBookmarkPage> createState() => _SearchBookmarkPageState();
}

class _SearchBookmarkPageState extends State<SearchBookmarkPage> {
  TextEditingController searchController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    Widget SurahGap() {
      return Container(
        margin: EdgeInsets.only(top: 16),
        child: Column(
          children: [
            Text(
              "Related Surah",
              style: medium.prim.semiBold,
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24),
              height: 2,
              width: double.infinity,
              color: primary,
            )
          ],
        ),
      );
    }

    return Scaffold(
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
                    SurahGap()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}