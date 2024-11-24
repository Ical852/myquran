import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myquran/blocs/cubits/bookmark_tafsir_ayat_cubit.dart';
import 'package:myquran/functions/global_func.dart';

class TafsirAyatBookmarkViewModel {
  late BuildContext context;

  TafsirAyatBookmarkViewModel(BuildContext context) {
    this.context = context;
  }

  bool tafsirAyatBookmarked(TafsirAyatModel tafsirAyat) {
    return context.read<BookmarkTafsirAyatCubit>().isExist(tafsirAyat);
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
