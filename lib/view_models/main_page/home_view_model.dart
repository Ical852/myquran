import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myquran/blocs/cubits/get_surah_cubit.dart';
import 'package:myquran/functions/global_func.dart';

class HomeViewModel {
  late BuildContext context;

  HomeViewModel(BuildContext context) {
    this.context = context;
  }

  void getSurahData() {
    try {
      context.read<GetSurahCubit>().getSurah();
    } catch (e) {
      showGLobalAlert("danger", "Failed to get surah data", context);
    }
  }
}