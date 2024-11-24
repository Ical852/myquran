import 'package:bloc/bloc.dart';
import 'package:myquran/models/get_tafsir_surah_response_model.dart';
import 'package:myquran/models/get_detail_surah_response_model.dart' as surahModel;

class TafsirModel {
  late Data? tafsir;
  late surahModel.Data? surah;

  TafsirModel(Data tafsir, surahModel.Data surah) {
    this.tafsir = tafsir;
    this.surah = surah;
  }
}

class BookmarkTafsirCubit extends Cubit<List<TafsirModel>> {
  BookmarkTafsirCubit() : super([]);

  bool addTafsir(TafsirModel data) {
    try {
      var newState = state;
      newState.add(data);
      emit(newState);
      return true;
    } catch (e) {
      return false;
    }
  }

  bool removeTafsir(TafsirModel data) {
    try {
      var newState = state;
      newState.removeWhere((tafsir) => tafsir.surah!.nama == data.surah!.nama);
      emit(newState);
      return true;
    } catch (e) {
      return false;
    }
  }

  bool isExist(TafsirModel data) {
    try {
      return state.any((tafsir) => tafsir.surah!.nama == data.surah!.nama);
    } catch (e) {
      return false;
    }
  }
}
