import 'package:flutter/material.dart';
import 'package:myquran/functions/global_func.dart';
import 'package:myquran/models/get_surah_response_model.dart';
import 'package:myquran/shared/constants.dart';
import 'package:myquran/shared/text_styles.dart';
import 'package:myquran/widgets/image_custom.dart';

// ignore: must_be_immutable
class SurahCard extends StatelessWidget {
  Data surah;
  Function() onPress;

  SurahCard({
    super.key,
    required this.surah,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    Widget SurahNum() {
      return ImageCustom(
        width: 40,
        height: 40,
        image: AssetImage(getIC("ic-quran-num.png")),
        fit: BoxFit.cover,
        child: Center(
          child: Text(
            surah.nomor.toString(),
            style: regular.text.mediumF,
          ),
        ),
      );
    }

    Widget SurahDesc() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            surah.namaLatin ?? "-",
            style: medium.text.semiBold,
          ),
          Row(
            children: [
              Text(
                surah.tempatTurun ?? "-",
                style: small.grey.mediumF,
              ),
              Container(
                width: 4,
                height: 4,
                margin: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: greyColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              Text(
                "${surah.jumlahAyat} Vers",
                style: small.grey.mediumF,
              ),
            ],
          ),
        ],
      );
    }

    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(bottom: 16),
        margin: EdgeInsets.only(top: 16),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: greyColor.withOpacity(0.5)
            ),
          ),
        ),
        child: Row(
          children: [
            SurahNum(),
            SizedBox(width: 16),
            SurahDesc(),
            Spacer(),
            Text(
              surah.nama ?? "-",
              style: mega.prim.semiBold,
            ),
          ],
        ),
      ),
    );
  }
}