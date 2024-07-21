import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:myquran/functions/global_func.dart';
import 'package:myquran/shared/constants.dart';
import 'package:myquran/shared/text_styles.dart';
import 'package:myquran/widgets/image_custom.dart';

class AyatCard extends StatefulWidget {
  const AyatCard({super.key});

  @override
  State<AyatCard> createState() => _AyatCardState();
}

class _AyatCardState extends State<AyatCard> {
  final player = AudioPlayer();
  String playingAudio = "https://equran.nos.wjv-1.neo.id/audio-full/Abdullah-Al-Juhany/001.mp3";
  bool isPlaying = false;
  bool audioOpen = false;

  @override
  Widget build(BuildContext context) {
    Widget RenderIcon(String icon) {
      return ImageCustom(
        height: 24,
        width: 24,
        image: AssetImage(getIC(icon)),
      );
    }

    Widget AudioList() {
      var source = "https://equran.nos.wjv-1.neo.id/audio-full/Abdullah-Al-Juhany/001.mp3";
      var isSame = source == playingAudio;

      if (audioOpen) {
        return Container(
          margin: EdgeInsets.only(
            top: 16
          ),
          child: Column(
            children: [
              Container(
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        if (isPlaying) {
                          setState(() {
                            isPlaying = false;
                          });
                          await player.stop();
                        } else {
                          setState(() {
                              isPlaying = true;
                            });
                          await player.play(UrlSource(source));
                        }
                      },
                      child: RenderIcon("ic-ayat-${isSame && isPlaying ? "pause" : "played"}.png")
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Abdullah-Al-Juhany",
                      style: regular.text.semiBold,
                    )
                  ],
                ),
              ),
              SizedBox(height: 8),
              Container(
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        if (isPlaying) {
                          setState(() {
                            isPlaying = false;
                          });
                          await player.stop();
                        } else {
                          setState(() {
                              isPlaying = true;
                            });
                          await player.play(UrlSource(source));
                        }
                      },
                      child: RenderIcon("ic-ayat-${isSame && isPlaying ? "pause" : "played"}.png")
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Abdullah-Al-Juhany",
                      style: regular.text.semiBold,
                    )
                  ],
                ),
              ),
              SizedBox(height: 8),
              Container(
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        if (isPlaying) {
                          setState(() {
                            isPlaying = false;
                          });
                          await player.stop();
                        } else {
                          setState(() {
                              isPlaying = true;
                            });
                          await player.play(UrlSource(source));
                        }
                      },
                      child: RenderIcon("ic-ayat-${isSame && isPlaying ? "pause" : "played"}.png")
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Abdullah-Al-Juhany",
                      style: regular.text.semiBold,
                    )
                  ],
                ),
              )
            ],
          ),
        );
      }
      return Container();
    }

    Widget ActionContent() {
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
                      "1",
                      style: regular.white.semiBold,
                    ),
                  ),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => setState(() {
                        audioOpen = !audioOpen;
                      }),
                      child: RenderIcon("ic-ayat-${audioOpen ? "up" : "down"}.png")
                    ),
                    SizedBox(width: 16),
                    RenderIcon("ic-ayat-played.png"),
                    SizedBox(width: 16),
                    RenderIcon("ic-ayat-bookmark.png"),
                  ],
                )
              ],
            ),
            AudioList(),
          ],
        ),
      );
    }
    
    Widget AyatContent() {
      return Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: greyColor.withOpacity(0.2)
            )
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 24),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "الْحَمْدُ لِلَّهِ رَبِّ الْعٰلَمِينَ",
                style: large.text.bold,
              ),
            ),
            SizedBox(height: 16,),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "[All] praise is [due] to Allah, Lord of the worlds -",
                style: medium.text.regularF,
              ),
            ),
            SizedBox(height: 16,),
          ],
        ),
      );
    }

    return Container(
      margin: EdgeInsets.only(bottom: 24),
      child: Column(
        children: [
          ActionContent(),
          AyatContent()
        ],
      ),
    );
  }
}