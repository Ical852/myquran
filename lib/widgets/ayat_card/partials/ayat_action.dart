import 'package:flutter/material.dart';
import 'package:myquran/functions/global_func.dart';
import 'package:myquran/shared/constants.dart';
import 'package:myquran/shared/text_styles.dart';
import 'package:myquran/widgets/image_custom.dart';

// ignore: must_be_immutable
class AyatAction extends StatelessWidget {
  String current, audio;
  int ayatNumber;
  Widget audioList;
  bool audioOpen, isBookmarked, isLoading;
  Function() onAudio, onPlay, onBookmark;

  AyatAction({
    super.key,
    required this.ayatNumber,
    required this.audioList,
    required this.audioOpen,
    required this.onAudio,
    required this.onPlay,
    required this.isLoading,
    required this.current,
    required this.audio,
    required this.onBookmark,
    this.isBookmarked = false
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

    Widget AyatActionContet() {
      return Row(
        children: [
          GestureDetector(
            onTap: onAudio,
            child: RenderIcon("ic-ayat-${audioOpen ? "up" : "down"}.png"),
          ),
          SizedBox(width: 16),
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
          SizedBox(width: 16),
          GestureDetector(
            onTap: onBookmark,
            child: RenderIcon("ic-ayat-bookmark${isBookmarked ? "ed" : ""}.png"),
          ),
        ],
      );
    }

    return Container(
      decoration: BoxDecoration(
        color: Color(0xff121931).withOpacity(0.05),
        borderRadius: BorderRadius.circular(10)
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 10
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 27,
                height: 27,
                decoration: BoxDecoration(
                  color: primary,
                  borderRadius: BorderRadius.circular(50)
                ),
                child: Center(
                  child: Text(
                    ayatNumber.toString(),
                    style: regular.white.semiBold,
                  ),
                ),
              ),
              AyatActionContet()
            ],
          ),
          audioList,
        ],
      ),
    );
  }
}