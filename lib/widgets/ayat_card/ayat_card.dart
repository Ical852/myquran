import 'package:flutter/material.dart';
import 'package:myquran/models/get_detail_surah_response_model.dart';
import 'package:myquran/widgets/ayat_card/partials/audio_card.dart';
import 'package:myquran/widgets/ayat_card/partials/ayat_action.dart';
import 'package:myquran/widgets/ayat_card/partials/ayat_content.dart';

// ignore: must_be_immutable
class AyatCard extends StatefulWidget {
  Ayat ayat;
  String currentPlay;
  String loading;
  Function(String) onPlay;
  Function() onBookmark;
  bool isBookmarked;

  AyatCard({
    super.key,
    required this.ayat,
    required this.currentPlay,
    required this.loading,
    required this.onPlay,
    required this.onBookmark,
    this.isBookmarked = false,
  });

  @override
  State<AyatCard> createState() => _AyatCardState();
}

class _AyatCardState extends State<AyatCard> {
  var audioOpen = false;

  @override
  Widget build(BuildContext context) {
    var ayat = widget.ayat;
    String currentPlay = widget.currentPlay;
    String loading = widget.loading;

    Widget AudioList() {
      if (audioOpen) {
        return Container(
          margin: EdgeInsets.only(top: 16),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 1,
            itemBuilder: (context, index) {
              return AudioCard(
                audio: ayat.audio!.s01!,
                current: currentPlay,
                isLoading: loading == ayat.audio!.s01!,
                onPlay: () => widget.onPlay(ayat.audio!.s01!),
              );
            },
          ),
        );
      }
      return Container();
    }

    return Column(
      children: [
        AyatAction(
          ayatNumber: ayat.nomorAyat!,
          audioList: AudioList(),
          audioOpen: audioOpen,
          onAudio: () => setState(() => audioOpen = !audioOpen),
          onPlay: () => widget.onPlay(ayat.audio!.s01!),
          isLoading: loading == ayat.audio!.s01!,
          current: currentPlay,
          audio: ayat.audio!.s01!,
          onBookmark: widget.onBookmark,
          isBookmarked: widget.isBookmarked,
        ),
        AyatContent(ayat: ayat),
      ],
    );
  }
}