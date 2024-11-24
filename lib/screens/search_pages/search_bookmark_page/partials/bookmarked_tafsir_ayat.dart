import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myquran/blocs/cubits/bookmark_tafsir_ayat_cubit.dart';
import 'package:myquran/functions/global_func.dart';
import 'package:myquran/view_models/bookmark_page/tafsir_ayat_bookmark_view_model.dart';
import 'package:myquran/widgets/no_data.dart';
import 'package:myquran/widgets/tafsir_ayat_card/tafsir_ayat_card.dart';

// ignore: must_be_immutable
class BookmarkedTafsirAyat extends StatefulWidget {
  List<TafsirAyatModel>? filteredTafsirAyat;
  BookmarkedTafsirAyat(this.filteredTafsirAyat);

  @override
  State<BookmarkedTafsirAyat> createState() => _BookmarkedTafsirAyatState();
}

class _BookmarkedTafsirAyatState extends State<BookmarkedTafsirAyat> {
  late TafsirAyatBookmarkViewModel tafsirVM = TafsirAyatBookmarkViewModel(context);
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookmarkTafsirAyatCubit, List<TafsirAyatModel>>(
      builder: (context, state) {
        var displayedTafsirAyat = widget.filteredTafsirAyat ?? state;
        if (displayedTafsirAyat.length < 1) {
          return Container(
            margin: EdgeInsets.only(top: getWH(context, "height") / 8),
            child: NoData(
              title: "No Bookmarked Tafsir Ayat",
              desc: "Seems like you haven’t bookmarked any ayat yet, go bookmark a tafsir ayat.",
            ),
          );
        }
        return Container(
          margin: EdgeInsets.only(top: 16, left: 24, right: 24),
          child: ListView.builder(
            controller: _scrollController,
            shrinkWrap: true,
            itemCount: displayedTafsirAyat.length,
            itemBuilder: (context, index) {
              var ayat = displayedTafsirAyat[index].ayat;
              var tafsir = displayedTafsirAyat[index].tafsir;
              var bookmark = TafsirAyatModel(tafsir, ayat);
              return TafsirAyatCard(
                ayat: ayat,
                tafsir: tafsir,
                onBookmark: () => setState(() {
                  tafsirVM.tafsirAyatBookmark(bookmark);
                }),
                isBookmarked: tafsirVM.tafsirAyatBookmarked(bookmark),
              );
            }
          ),
        );
      },
    );
  }
}