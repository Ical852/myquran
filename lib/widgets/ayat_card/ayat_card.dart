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
  bool isBookmarked, isNotDetail;

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
    this.isNotDetail = false,
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
    bool isNotDetail = widget.isNotDetail;
    Function(String) onPlay = widget.onPlay;
    Function() stopOther = widget.stopOther;
    String otherCurrentPlay = widget.otherCurrentPlay;
    String otherLoading = widget.otherLoading;
    Function(String) playOther = widget.playOther;
    Function() onBookmark = widget.onBookmark;
    bool isBookmarked = widget.isBookmarked;

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
              if (!isNotDetail && index == 0) {
                return AudioCard(
                  audio: ayat.audio!.s01!,
                  current: currentPlay,
                  isLoading: loading == ayat.audio!.s01!,
                  onPlay: () {
                    onPlay(ayat.audio!.s01!);
                    stopOther();
                  },
                  isAuto: !isNotDetail,
                );
              }
              return AudioCard(
                audio: audios[index],
                current: otherCurrentPlay,
                isLoading: otherLoading == audios[index],
                onPlay: () {
                  if (audios[index] == otherCurrentPlay) {
                    stopOther();
                  } else {
                    playOther(audios[index]);
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
            if (!isNotDetail) {
              onPlay(ayat.audio!.s01!);
              stopOther();
            } else {
              if (ayat.audio!.s01! == otherCurrentPlay) {
                stopOther();
              } else {
                playOther(ayat.audio!.s01!);
              }
            }
          },
          isLoading: loading == ayat.audio!.s01!,
          current: currentPlay,
          audio: ayat.audio!.s01!,
          onBookmark: onBookmark,
          isBookmarked: isBookmarked,
        ),
        AyatContent(ayat: ayat),
      ],
    );
  }
}