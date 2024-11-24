import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myquran/blocs/cubits/bookmark_tafsir.dart';
import 'package:myquran/functions/global_func.dart';
import 'package:myquran/screens/detail_pages/detail_tafsir_page/detail_tafsir_page.dart';
import 'package:myquran/widgets/no_data.dart';
import 'package:myquran/widgets/surah_card/tafsir_card.dart';

// ignore: must_be_immutable
class BookmarkedTafsir extends StatefulWidget {
  List<TafsirModel>? filteredTafsir;
  BookmarkedTafsir(this.filteredTafsir);

  @override
  State<BookmarkedTafsir> createState() => _BookmarkedTafsirState();
}

class _BookmarkedTafsirState extends State<BookmarkedTafsir> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookmarkTafsirCubit, List<TafsirModel>>(
      builder: (context, state) {
        var displayedTafsir = widget.filteredTafsir ?? state;
        if (displayedTafsir.length < 1) {
          return Container(
            margin: EdgeInsets.only(top: getWH(context, "height") / 8),
            child: NoData(
              title: "No Bookmarked Tafsir",
              desc: "Seems like you haven’t bookmarked any tafsir yet, go bookmark a tafsir.",
            ),
          );
        }

        return ListView.builder(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: 72,
          ),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: displayedTafsir.length,
          itemBuilder: (context, index) {
            var savedTafsir = displayedTafsir[index];
            return TafsirCard(
              surah: savedTafsir.surah!,
              onPress: () {
                goToPage(context, DetailTafsirPage(savedTafsir.surah!));
              },
            );
          }
        );
      },
    );
  }
}