import 'package:flutter/material.dart';
import 'package:myquran/functions/global_func.dart';
import 'package:myquran/shared/constants.dart';
import 'package:myquran/shared/text_styles.dart';
import 'package:myquran/widgets/buttons/mini_button_custom.dart';
import 'package:myquran/widgets/image_custom.dart';

class GetStartedPage extends StatefulWidget {
  const GetStartedPage({super.key});

  @override
  State<GetStartedPage> createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  @override
  Widget build(BuildContext context) {
    void onGetStarted() async {
      setStringPref("isStarted", "true");
      navReplace(context, "/main");
    }

    Widget TopText() {
      return Column(
        children: [
          Text(
            "Welcome",
            style: xLarge.text.bold,
          ),
          SizedBox(height: 16),
          Container(
            width: 195,
            child: Text(
              "Memorize and recite Quran easily",
              style: large.grey.regularF,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );
    }

    Widget QuranImage() {
      return ImageCustom(
        margin: EdgeInsets.symmetric(horizontal: 30),
        width: getWH(context, "width") - 60,
        height: 450,
        image: AssetImage(getIM("get-started-bg.png")),
        fit: BoxFit.cover,
        borderRadius: BorderRadius.circular(30),
        child: Column(
          children: [
            ImageCustom(
              height: 178,
              margin: EdgeInsets.only(
                top: 186
              ),
              width: getWH(context, "width") - 84,
              image: AssetImage(getIM("img-quran.png")),
            ),
          ],
        ),
      );
    }

    Widget ImageContent() {
      return Container(
        height: 475,
        margin: EdgeInsets.only(top: 50),
        child: Stack(
          children: [
            QuranImage(),
            Align(
              alignment: Alignment.bottomCenter,
              child: MiniButtonCustom(
                width: getWH(context, "width") - 190,
                height: 60,
                title: "Get Started",
                onPressed: onGetStarted,
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TopText(),
              ImageContent(),
            ],
          ),
        ),
      ),
    );
  }
}