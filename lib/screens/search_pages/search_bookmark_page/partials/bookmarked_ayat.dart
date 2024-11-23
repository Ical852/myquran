import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myquran/blocs/cubits/bookmark_ayat_cubit.dart';
import 'package:myquran/functions/global_func.dart';
import 'package:myquran/models/get_detail_surah_response_model.dart';
import 'package:myquran/view_models/bookmark_page/ayat_bookmark_view_model.dart';
import 'package:myquran/widgets/ayat_card/ayat_card.dart';
import 'package:myquran/widgets/no_data.dart';

// ignore: must_be_immutable
class BookmarkedAyat extends StatefulWidget {
  List<Ayat>? filteredAyat;
  BookmarkedAyat(this.filteredAyat);

  @override
  State<BookmarkedAyat> createState() => _BookmarkedAyatState();
}

class _BookmarkedAyatState extends State<BookmarkedAyat> {
  ScrollController _scrollController = ScrollController();
  late AyatBookmarkViewModel ayatVM = AyatBookmarkViewModel(context);

  final audioPlayer = AudioPlayer();
  var currentPlay = "";
  var loading = "";

  @override
  void initState() {
    super.initState();
    audioPlayer.onPlayerComplete.listen((event) {
      audioPlayer.stop();
      setState(() {
        loading = "";
        currentPlay = "";
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    audioPlayer.dispose();
    super.dispose();
  }

  void playAudio(audio) async {
    setState(() {
      loading = audio;
      currentPlay = audio;
    });
    await audioPlayer.play(UrlSource(audio));
    setState(() {
      loading = "";
    });
  }

  void stopAudio() async {
    await audioPlayer.stop();
    setState(() {
      loading = "";
      currentPlay = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookmarkAyatCubit, List<Ayat>>(
      builder: (context, state) {
        var displayedAyat = widget.filteredAyat ?? state;
        if (displayedAyat.length < 1) {
          return Container(
            margin: EdgeInsets.only(top: getWH(context, "height") / 8),
            child: NoData(
              title: "No Bookmarked Ayat",
              desc: "Seems like you haven’t bookmarked any ayat yet, go bookmark a ayat.",
            ),
          );
        }
        return Container(
          margin: EdgeInsets.only(top: 16, left: 24, right: 24),
          child: ListView.builder(
            controller: _scrollController,
            shrinkWrap: true,
            itemCount: displayedAyat.length,
            itemBuilder: (context, index) {
              var ayat = displayedAyat[index];
              return AyatCard(
                ayat: ayat,
                currentPlay: currentPlay,
                loading: loading,
                onPlay: (audio) => playAudio(audio),
                onBookmark: () => setState(() {
                  ayatVM.ayatBookmark(ayat);
                }),
                isBookmarked: ayatVM.ayatBookmarked(ayat),
                otherCurrentPlay: currentPlay,
                otherLoading: loading,
                playOther: (audio) => playAudio(audio),
                stopOther: () => stopAudio(),
                isNotDetail: true,
              );
            }
          ),
        );
      },
    );
  }
}