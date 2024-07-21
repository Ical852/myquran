import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myquran/blocs/cubits/get_detail_surah_cubit.dart';
import 'package:myquran/functions/global_func.dart';

class DetailSurahViewModel {
  late BuildContext context;

  DetailSurahViewModel(BuildContext context) {
    this.context = context;
  }

  void getDetailSurah(int surahNumber) {
    try {
      context.read<GetDetailSurahCubit>().getDetailSurah(surahNumber);
    } catch (e) {
      showGLobalAlert("danger", "Failed to get detail surah data", context);
    }
  }
}