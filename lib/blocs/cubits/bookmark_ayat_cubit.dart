import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:myquran/models/get_detail_surah_response_model.dart';

part '../states/bookmark_ayat_state.dart';

class BookmarkAyatCubit extends Cubit<List<Ayat>> {
  BookmarkAyatCubit() : super([]);

  bool addAyat(Ayat ayat) {
    try {
      var newState = state;
      newState.add(ayat);
      emit(newState);
      return true;
    } catch (e) {
      return false;
    }
  }

  bool removeAyat(Ayat ayat) {
    try {
      var newState = state;
      newState.removeWhere((ayat) => ayat.teksArab == ayat.teksArab);
      emit(newState);
      return true;
    } catch (e) {
      return false;
    }
  }
}
