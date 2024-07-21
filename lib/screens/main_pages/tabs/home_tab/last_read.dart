import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myquran/blocs/cubits/current_read_cubit.dart';
import 'package:myquran/functions/global_func.dart';
import 'package:myquran/screens/detail_pages/surah_detail_page/surah_detail_page.dart';
import 'package:myquran/shared/text_styles.dart';
import 'package:myquran/widgets/image_custom.dart';

class LastRead extends StatelessWidget {
  const LastRead({super.key});

  @override
  Widget build(BuildContext context) {
    Widget LastReadContent(CurrentReadModel state) {
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
              state.data?.namaLatin ?? "No Read Yet",
              style: large.white.semiBold,
            ),
            SizedBox(width: 4),
            Text(
              "Ayat No: ${state.ayat ?? 'No Read Yet'}",
              style: regular.white.regularF,
            )
          ],
        ),
      );
    }

    return BlocConsumer<CurrentReadCubit, CurrentReadModel>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          width: double.infinity,
          margin: EdgeInsets.only(left: 24, right: 24, bottom: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Asslamualaikum",
                style: large.grey.mediumF,
              ),
              SizedBox(height: 4),
              GestureDetector(
                onTap: () {
                  if (state.data != null) {
                    goToPage(context, SurahDetailPage(state.data!));
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
              )
            ],
          ),
        );
      },
    );
  }
}
