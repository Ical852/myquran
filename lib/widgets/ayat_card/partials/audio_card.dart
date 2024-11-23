import 'package:flutter/material.dart';
import 'package:myquran/functions/global_func.dart';
import 'package:myquran/shared/constants.dart';
import 'package:myquran/shared/text_styles.dart';
import 'package:myquran/widgets/image_custom.dart';

// ignore: must_be_immutable
class AudioCard extends StatelessWidget {
  bool isLoading, isAuto;
  String audio, current;
  Function() onPlay;

  AudioCard({
    super.key,
    required this.audio,
    required this.current,
    required this.onPlay,
    required this.isLoading,
    this.isAuto = false,
  });

  @override
  Widget build(BuildContext context) {
    var isCurrent = current != "" && current == audio;

    Widget RenderIcon(String icon) {
      return ImageCustom(
        height: 24,
        width: 24,
        image: AssetImage(getIC(icon)),
      );
    }

    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          GestureDetector(
            onTap: onPlay,
            child: isLoading ? SizedBox(
              height: isCurrent ? 20 : 24,
              width: isCurrent ? 20 : 24,
              child: CircularProgressIndicator(
                color: primary,
              ),
            ) :
            RenderIcon("ic-ayat-${isCurrent ? "pause" : "played"}.png")
          ),
          SizedBox(width: 8),
          Text(
            getAudioName(audio) + "${isAuto ? ' - (AUTO)' : ''}",
            style: regular.text.semiBold,
          ),
        ],
      ),
    );
  }
}