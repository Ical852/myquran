import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myquran/blocs/cubits/bookmark_ayat_cubit.dart';
import 'package:myquran/blocs/cubits/bookmark_surah_cubit.dart';
import 'package:myquran/blocs/cubits/bookmark_tafsir.dart';
import 'package:myquran/blocs/cubits/bookmark_tafsir_ayat_cubit.dart';
import 'package:myquran/models/get_detail_surah_response_model.dart';
import 'package:myquran/models/get_surah_response_model.dart' as surahModel;
import 'package:myquran/screens/search_pages/search_bookmark_page/search_bookmark_page.dart';
import 'package:myquran/screens/search_pages/search_page/search_page.dart';
import 'package:myquran/shared/constants.dart';
import 'package:myquran/shared/text_styles.dart';
import 'package:myquran/widgets/bookmark_card.dart';
import 'package:myquran/widgets/header_custom.dart';
import 'package:myquran/functions/global_func.dart';
import 'package:myquran/widgets/image_custom.dart';

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

    Widget BookmarkTitle() {
      return Container(
        child: Column(
          children: [
            ImageCustom(
              height: 100,
              width: double.infinity,
              image: AssetImage(getIM("img-quran.png")),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 24),
              child: Column(
                children: [
                  Text(
                    "Bookmarked Surah, Ayat, Tafsir & Tafsir Ayat",
                    style: medium.prim.semiBold,
                  ),
                  SizedBox(height: 16),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 24),
                    height: 2,
                    width: double.infinity,
                    color: primary,
                  ),
                ],
              ),
            ),
          ],
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
            BlocBuilder<BookmarkTafsirCubit, List<TafsirModel>>(
              builder: (context, state) {
                return BookmarkCard(
                  title: "Tafsir Surah",
                  total: state.length,
                  onPress: () {
                    goToPage(context, SearchBookmarkPage("tafsir"));
                  },
                );
              },
            ),
            BlocBuilder<BookmarkTafsirAyatCubit, List<TafsirAyatModel>>(
              builder: (context, state) {
                return BookmarkCard(
                  title: "Tafsir Ayat",
                  total: state.length,
                  onPress: () {
                    goToPage(context, SearchBookmarkPage("tafsir ayat"));
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
            BookmarkTitle(),
            BookmarkList(),
          ],
        ),
      ),
    );
  }
}
