import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myquran/blocs/cubits/bookmark_surah_cubit.dart';
import 'package:myquran/functions/global_func.dart';
import 'package:myquran/models/get_surah_response_model.dart';
import 'package:myquran/screens/detail_pages/surah_detail_page/surah_detail_page.dart';
import 'package:myquran/widgets/no_data.dart';
import 'package:myquran/widgets/surah_card.dart';

class BookmarkedSurah extends StatefulWidget {
  const BookmarkedSurah({super.key});

  @override
  State<BookmarkedSurah> createState() => _BookmarkedSurahState();
}

class _BookmarkedSurahState extends State<BookmarkedSurah> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookmarkSurahCubit, List<Data>>(
      builder: (context, state) {
        if (state.length < 1) {
          return Container(
            margin: EdgeInsets.only(top: getWH(context, "height") / 8),
            child: NoData(
              title: "No Bookmarked Surah",
              desc: "Seems like you haven’t bookmarked any surah yet, go bookmark a surah.",
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
          itemCount: state.length,
          itemBuilder: (context, index) {
            var surah = state[index];
            return SurahCard(
              surah: surah,
              onPress: () {
                goToPage(context, SurahDetailPage(surah));
              },
            );
          }
        );
      },
    );
  }
}