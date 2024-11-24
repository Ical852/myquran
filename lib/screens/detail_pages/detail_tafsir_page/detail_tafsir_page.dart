import 'package:flutter/material.dart';
import 'package:myquran/models/get_surah_response_model.dart';
import 'package:myquran/shared/constants.dart';

// ignore: must_be_immutable
class DetailTafsirPage extends StatefulWidget {
  Data surah;
  DetailTafsirPage(this.surah);

  @override
  State<DetailTafsirPage> createState() => _DetailTafsirPageState();
}

class _DetailTafsirPageState extends State<DetailTafsirPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}