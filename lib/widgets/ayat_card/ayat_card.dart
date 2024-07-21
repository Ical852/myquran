import 'package:flutter/material.dart';
import 'package:myquran/models/get_detail_surah_response_model.dart';
import 'package:myquran/widgets/ayat_card/partials/audio_card.dart';
import 'package:myquran/widgets/ayat_card/partials/ayat_action.dart';
import 'package:myquran/widgets/ayat_card/partials/ayat_content.dart';

// ignore: must_be_immutable
class AyatCard extends StatefulWidget {
  Ayat ayat;
  String currentPlay = "";
  String loading = "";
  Function(String) onPlay;

  AyatCard({
    super.key,
    required this.ayat,
    required this.currentPlay,
    required this.loading,
    required this.onPlay,
  });

  @override
  State<AyatCard> createState() => _AyatCardState();
}

class _AyatCardState extends State<AyatCard> {
  var audioOpen = false;

  @override
  Widget build(BuildContext context) {
    var ayat = this.widget.ayat;
    String currentPlay = this.widget.currentPlay;
    String loading = this.widget.loading;

    Widget AudioList() {
      if (audioOpen) {
        return Container(
          margin: EdgeInsets.only(top: 16),
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              var audio = ayat.audio!.toList()[index];
              return AudioCard(
                audio: audio!,
                current: currentPlay,
                isLoading: loading == audio,
                onPlay: () => this.widget.onPlay(audio),
              );
            }
          )
        );
      }
      return Container();
    }

    return Container(
      margin: EdgeInsets.only(bottom: 24),
      child: Column(
        children: [
          AyatAction(
            audio: ayat.audio!.s01!,
            current: currentPlay,
            isLoading: loading == ayat.audio!.s01!,
            ayatNumber: ayat.nomorAyat!,
            audioOpen: audioOpen,
            onAudio: () => setState(() {
              audioOpen = !audioOpen;
            }),
            onPlay: () => this.widget.onPlay(ayat.audio!.s01!),
            onBookmark: (){},
            isBookmarked: false,
            audioList: AudioList(),
          ),
          AyatContent(ayat: ayat)
        ],
      ),
    );
  }
}