import 'package:flutter/material.dart';
import 'package:myquran/functions/global_func.dart';
import 'package:myquran/models/get_detail_surah_response_model.dart';
import 'package:myquran/widgets/ayat_card/partials/audio_card.dart';
import 'package:myquran/widgets/ayat_card/partials/ayat_action.dart';
import 'package:myquran/widgets/ayat_card/partials/ayat_content.dart';

// ignore: must_be_immutable
class AyatCard extends StatefulWidget {
  Ayat ayat;
  String currentPlay, otherCurrentPlay, loading, otherLoading;
  Function(String) onPlay, playOther;
  Function() onBookmark, stopOther;
  bool isBookmarked;

  AyatCard({
    super.key,
    required this.ayat,
    required this.currentPlay,
    required this.otherCurrentPlay,
    required this.loading,
    required this.otherLoading,
    required this.onPlay,
    required this.playOther,
    required this.onBookmark,
    required this.stopOther,
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

    // Other local player
    var audios = getAudio(ayat);
    // Other local player

    Widget AudioList() {
      if (audioOpen) {
        return Container(
          margin: EdgeInsets.only(top: 16),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: audios.length,
            itemBuilder: (context, index) {
              if (index == 0) {
                return AudioCard(
                  audio: ayat.audio!.s01!,
                  current: currentPlay,
                  isLoading: loading == ayat.audio!.s01!,
                  onPlay: () {
                    widget.onPlay(ayat.audio!.s01!);
                    widget.stopOther();
                  },
                  isAuto: true,
                );
              }
              return AudioCard(
                audio: audios[index],
                current: widget.otherCurrentPlay,
                isLoading: widget.otherLoading == audios[index],
                onPlay: () {
                  if (audios[index] == widget.otherCurrentPlay) {
                    widget.stopOther();
                  } else {
                    widget.playOther(audios[index]);
                  }
                },
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
          onPlay: () {
            widget.onPlay(ayat.audio!.s01!);
            widget.stopOther();
          },
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