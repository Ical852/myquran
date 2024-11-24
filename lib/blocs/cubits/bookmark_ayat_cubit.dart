import 'package:bloc/bloc.dart';
import 'package:myquran/models/get_detail_surah_response_model.dart';

class BookmarkAyatCubit extends Cubit<List<Ayat>> {
  BookmarkAyatCubit() : super([]);

  bool addAyat(Ayat data) {
    try {
      var newState = state;
      newState.add(data);
      emit(newState);
      return true;
    } catch (e) {
      return false;
    }
  }

  bool removeAyat(Ayat data) {
    try {
      var newState = state;
      newState.removeWhere((ayat) => ayat.teksArab == data.teksArab);
      emit(newState);
      return true;
    } catch (e) {
      return false;
    }
  }

  bool isExist(Ayat data) {
    try {
      return state.any((ayat) => ayat.teksArab == data.teksArab);
    } catch (e) {
      return false;
    }
  }
}
