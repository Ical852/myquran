import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myquran/blocs/cubits/bookmark_tafsir.dart';
import 'package:myquran/blocs/cubits/bookmark_tafsir_ayat_cubit.dart';
import 'package:myquran/blocs/cubits/get_tafsir_surah_cubit.dart';
import 'package:myquran/functions/global_func.dart';

class DetailTafsirViewModel {
  late BuildContext context;

  DetailTafsirViewModel(BuildContext context) {
    this.context = context;
  }

  void getTafsirSurah(int surahNumber) {
    try {
      context.read<GetTafsirSurahCubit>().getTafsirSurah(surahNumber);
    } catch (e) {
      showGLobalAlert("danger", "Failed to get tafsir surah data", context);
    }
  }

  bool tafsirBookmarked(TafsirModel tafsir) {
    return context.read<BookmarkTafsirCubit>().isExist(tafsir);
  }

  bool tafsirAyatBookmarked(TafsirAyatModel tafsirAyat) {
    return context.read<BookmarkTafsirAyatCubit>().isExist(tafsirAyat);
  }

  void tafsirBookmark(TafsirModel tafsir) {
    try {
      if (tafsirBookmarked(tafsir)) {
        context.read<BookmarkTafsirCubit>().removeTafsir(tafsir);
      } else {
        context.read<BookmarkTafsirCubit>().addTafsir(tafsir);
      }
    } catch (e) {
      showGLobalAlert("danger", "Failed to bookmark tafsir", context);
    }
  }

  void tafsirAyatBookmark(TafsirAyatModel tafsirAyat) {
    try {
      if (tafsirAyatBookmarked(tafsirAyat)) {
        context.read<BookmarkTafsirAyatCubit>().removeTafsir(tafsirAyat);
      } else {
        context.read<BookmarkTafsirAyatCubit>().addTafsir(tafsirAyat);
      }
    } catch (e) {
      showGLobalAlert("danger", "Failed to bookmark tafsir ayat", context);
    }
  }
}