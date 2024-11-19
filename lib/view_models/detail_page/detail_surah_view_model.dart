import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myquran/blocs/cubits/bookmark_ayat_cubit.dart';
import 'package:myquran/blocs/cubits/bookmark_surah_cubit.dart';
import 'package:myquran/blocs/cubits/get_detail_surah_cubit.dart';
import 'package:myquran/functions/global_func.dart';
import 'package:myquran/models/get_detail_surah_response_model.dart';
import 'package:myquran/models/get_surah_response_model.dart' as surahModel;

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

  bool ayatBookmarked(Ayat ayat) {
    return context.read<BookmarkAyatCubit>().isExist(ayat);
  }

  bool surahBookmarked(surahModel.Data surah) {
    return context.read<BookmarkSurahCubit>().isExist(surah);
  }

  void ayatBookmark(Ayat ayat) {
    try {
      if (ayatBookmarked(ayat)) {
        context.read<BookmarkAyatCubit>().removeAyat(ayat);
      } else {
        context.read<BookmarkAyatCubit>().addAyat(ayat);
      }
    } catch (e) {
      showGLobalAlert("danger", "Failed to bookmark ayat", context);
    }
  }

  void surahBookmark(surahModel.Data surah) {
    try {
      if (surahBookmarked(surah)) {
        context.read<BookmarkSurahCubit>().removeSurah(surah);
      } else {
        context.read<BookmarkSurahCubit>().addSurah(surah);
      }
    } catch (e) {
      showGLobalAlert("danger", "Failed to bookmark surah", context);
    }
  }
}