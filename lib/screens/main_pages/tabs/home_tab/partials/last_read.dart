import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myquran/blocs/cubits/audio_player_cubit.dart';
import 'package:myquran/blocs/states/audio_player_state.dart';
import 'package:myquran/functions/global_func.dart';
import 'package:myquran/screens/detail_pages/surah_detail_page/surah_detail_page.dart';
import 'package:myquran/shared/text_styles.dart';
import 'package:myquran/widgets/image_custom.dart';

class LastRead extends StatelessWidget {
  const LastRead({super.key});

  @override
  Widget build(BuildContext context) {
    Widget LastReadContent(AudioPlayerState state) {
      return Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ImageCustom(
                  height: 20,
                  width: 20,
                  image: AssetImage(getIC("ic-last-read.png")),
                ),
                SizedBox(width: 8),
                Text(
                  "Last read",
                  style: regular.white.mediumF,
                )
              ],
            ),
            Spacer(),
            Text(
              state.surah?.namaLatin ?? "No Read Yet",
              style: large.white.semiBold,
            ),
            SizedBox(width: 4),
            Text(
              state.surah != null ? "Ayat No: ${state.currentIndex + 1}" : 'No Read Yet',
              style: regular.white.regularF,
            ),
          ],
        ),
      );
    }

    return BlocConsumer<AudioPlayerCubit, AudioPlayerState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          width: double.infinity,
          margin: EdgeInsets.only(left: 24, right: 24, bottom: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Assalamualaikum",
                style: large.grey.mediumF,
              ),
              SizedBox(height: 4),
              GestureDetector(
                onTap: () {
                  if (state.surah != null) {
                    goToPage(context, SurahDetailPage(state.surah!));
                  }
                },
                child: ImageCustom(
                  width: double.infinity,
                  height: 131,
                  image: AssetImage(getIM("bg-last-read.png")),
                  fit: BoxFit.cover,
                  borderRadius: BorderRadius.circular(10),
                  child: LastReadContent(state),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
