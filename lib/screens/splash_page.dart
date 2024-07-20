import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myquran/functions/global_func.dart';
import 'package:myquran/shared/constants.dart';
import 'package:myquran/shared/text_styles.dart';
import 'package:myquran/widgets/image_custom.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () async {
      var isStarted = await getStringPref("isStarted");
      var route = isNotNull(isStarted) ? "/main" : "/get-started";

      Navigator.pushNamedAndRemoveUntil(
        context, 
        route,
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImageCustom(
                  width: 120,
                  height: 120,
                  image: AssetImage(getIC("ic-logo.png")),
                ),
                SizedBox(height: 10,),
                Text(
                  "MyQuran",
                  style: mass.white.semiBold,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}