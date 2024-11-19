import 'package:flutter/material.dart';
import 'package:myquran/screens/search_pages/search_bookmark_page/search_bookmark_page.dart';
import 'package:myquran/widgets/bookmar_card.dart';
import 'package:myquran/widgets/header_custom.dart';
import 'package:myquran/functions/global_func.dart';

class BookmarkTab extends StatefulWidget {
  const BookmarkTab({super.key});

  @override
  State<BookmarkTab> createState() => _BookmarkTabState();
}

class _BookmarkTabState extends State<BookmarkTab> {
  @override
  Widget build(BuildContext context) {
    Widget HeaderContent() {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 32
        ),
        child: HeaderCustom(
          title: "Bookmarks",
          onRight: () => goToPage(context, SearchBookmarkPage()),
          leftIcon: "ic-bar.png",
        ),
      );
    }

    Widget BookmarkList() {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: 24
        ),
        child: Column(
          children: [
            BookmarCard(),
            BookmarCard(),
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
            BookmarkList()
          ],
        ),
      ),
    );
  }
}