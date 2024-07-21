import 'package:flutter/material.dart';
import 'package:myquran/functions/global_func.dart';
import 'package:myquran/shared/constants.dart';
import 'package:myquran/shared/text_styles.dart';
import 'package:myquran/widgets/image_custom.dart';

class SurahCard extends StatelessWidget {
  const SurahCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(bottom: 16),
      margin: EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: greyColor.withOpacity(0.5)
          )
        )
      ),
      child: Row(
        children: [
          ImageCustom(
            width: 36,
            height: 36,
            image: AssetImage(getIC("ic-quran-num.png")),
            child: Center(
              child: Text(
                "1",
                style: regular.text.mediumF,
              ),
            ),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Al-Fatiha",
                style: medium.text.semiBold,
              ),
              Row(
                children: [
                  Text(
                    "Mekkah",
                    style: small.grey.mediumF,
                  ),
                  Container(
                    width: 4,
                    height: 4,
                    margin: EdgeInsets.symmetric(
                      horizontal: 8
                    ),
                    decoration: BoxDecoration(
                      color: greyColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(50)
                    ),
                  ),
                  Text(
                    "7 Vers",
                    style: small.grey.mediumF,
                  ),
                ],
              )
            ],
          ),
          Spacer(),
          Text(
            "الفاتحة",
            style: mega.prim.semiBold,
            
          )
        ],
      ),
    );
  }
}