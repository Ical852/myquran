import 'package:bloc/bloc.dart';
import 'package:myquran/models/get_detail_surah_response_model.dart';
import 'package:myquran/models/get_tafsir_surah_response_model.dart';

class TafsirAyatModel {
  late Tafsir tafsir;
  late Ayat ayat;

  TafsirAyatModel(Tafsir tafsir, Ayat ayat) {
    this.tafsir = tafsir;
    this.ayat = ayat;
  }
}

class BookmarkTafsirAyatCubit extends Cubit<List<TafsirAyatModel>> {
  BookmarkTafsirAyatCubit() : super([]);

  bool addTafsir(TafsirAyatModel data) {
    try {
      var newState = state;
      newState.add(data);
      emit(newState);
      return true;
    } catch (e) {
      return false;
    }
  }

  bool removeTafsir(TafsirAyatModel data) {
    try {
      var newState = state;
      newState.removeWhere((tafsir) => tafsir.ayat.teksArab == data.ayat.teksArab);
      emit(newState);
      return true;
    } catch (e) {
      return false;
    }
  }

  bool isExist(TafsirAyatModel data) {
    try {
      return state.any((tafsir) => tafsir.ayat.teksArab == data.ayat.teksArab);
    } catch (e) {
      return false;
    }
  }
}
