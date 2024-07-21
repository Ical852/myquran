import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myquran/blocs/cubits/current_read_cubit.dart';
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

  void setCurrentRead(CurrentReadModel current) {
    try {
      context.read<CurrentReadCubit>().setCurrentRead(current);
    } catch (e) {
      showGLobalAlert("danger", "Failed to set surah current read", context);
    }
  }
}