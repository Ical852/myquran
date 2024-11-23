import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myquran/blocs/cubits/bookmark_ayat_cubit.dart';
import 'package:myquran/functions/global_func.dart';
import 'package:myquran/models/get_detail_surah_response_model.dart';

class AyatBookmarkViewModel {
  late BuildContext context;

  AyatBookmarkViewModel(BuildContext context) {
    this.context = context;
  }

  bool ayatBookmarked(Ayat ayat) {
    return context.read<BookmarkAyatCubit>().isExist(ayat);
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
}