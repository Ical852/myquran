import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:myquran/models/get_surah_response_model.dart';

part '../states/bookmark_surah_state.dart';

class BookmarkSurahCubit extends Cubit<List<Data>> {
  BookmarkSurahCubit() : super([]);

  bool addSurah(Data data) {
    try {
      var newState = state;
      newState.add(data);
      emit(newState);
      return true;
    } catch (e) {
      return false;
    }
  }

  bool removeSurah(Data data) {
    try {
      var newState = state;
      newState.removeWhere((surah) => surah.nama == data.nama);
      emit(newState);
      return true;
    } catch (e) {
      return false;
    }
  }

  bool isExist(Data data) {
    try {
      return state.any((surah) => surah.nama == data.nama);
    } catch (e) {
      return false;
    }
  }
}
