import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myquran/blocs/cubits/bookmark_ayat_cubit.dart';
import 'package:myquran/blocs/cubits/bookmark_surah_cubit.dart';
import 'package:myquran/models/get_detail_surah_response_model.dart';
import 'package:myquran/models/get_surah_response_model.dart' as surahModel;
import 'package:myquran/screens/search_pages/search_bookmark_page/search_bookmark_page.dart';
import 'package:myquran/screens/search_pages/search_page/search_page.dart';
import 'package:myquran/widgets/bookmark_card.dart';
import 'package:myquran/widgets/header_custom.dart';
import 'package:myquran/functions/global_func.dart';

// ignore: must_be_immutable
class BookmarkTab extends StatefulWidget {
  Function() openDrawer;
  BookmarkTab(this.openDrawer);

  @override
  State<BookmarkTab> createState() => _BookmarkTabState();
}

class _BookmarkTabState extends State<BookmarkTab> {
  @override
  Widget build(BuildContext context) {
    Widget HeaderContent() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: HeaderCustom(
          title: "Bookmarks",
          onRight: () => goToPage(context, SearchPage()),
          leftIcon: "ic-bar.png",
          onLeft: () => widget.openDrawer(),
        ),
      );
    }

    Widget BookmarkList() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            BlocBuilder<BookmarkSurahCubit, List<surahModel.Data>>(
              builder: (context, state) {
                return BookmarkCard(
                  title: "Surah",
                  total: state.length,
                  onPress: (){
                    goToPage(context, SearchBookmarkPage("surah"));
                  },
                );
              },
            ),
            BlocBuilder<BookmarkAyatCubit, List<Ayat>>(
              builder: (context, state) {
                return BookmarkCard(
                  title: "Ayat",
                  total: state.length,
                  onPress: (){
                    goToPage(context, SearchBookmarkPage("ayat"));
                  },
                );
              },
            ),
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
            BookmarkList(),
          ],
        ),
      ),
    );
  }
}
