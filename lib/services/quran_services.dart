import 'dart:convert';

import 'package:myquran/models/get_detail_surah_response_model.dart';
import 'package:myquran/models/get_surah_response_model.dart';
import 'package:myquran/models/get_tafsir_surah_response_model.dart';
import 'package:myquran/shared/constants.dart';
import 'package:http/http.dart' as http;

class QuranServices {
  Future<GetSurahResponseModel?> getSurah() async {
    try {
      var url = baseUrl + '/surat';
      var response = await http.get(Uri.parse(url));

      if (response.body.isEmpty) return null;
      if (response.statusCode != 200) return null;
      var decoded = jsonDecode(response.body);

      return GetSurahResponseModel.fromJson(decoded);
    } catch (e) {
      return null;
    }
  }

  Future<GetDetailSurahResponseModel?> getDetailSurah({
    required surahNumber
  }) async {
    try {
      var url = baseUrl + '/surat/$surahNumber';
      var response = await http.get(Uri.parse(url));

      if (response.body.isEmpty) return null;
      if (response.statusCode != 200) return null;
      var decoded = jsonDecode(response.body);

      return GetDetailSurahResponseModel.fromJson(decoded);
    } catch (e) {
      return null;
    }
  }

  Future<GetTafsirSurahResponseModel?> getTafsirSurah({
    required surahNumber
  }) async {
    try {
      var url = baseUrl + '/tafsir/$surahNumber';
      var response = await http.get(Uri.parse(url));

      if (response.body.isEmpty) return null;
      if (response.statusCode != 200) return null;
      var decoded = jsonDecode(response.body);

      return GetTafsirSurahResponseModel.fromJson(decoded);
    } catch (e) {
      return null;
    }
  }
}