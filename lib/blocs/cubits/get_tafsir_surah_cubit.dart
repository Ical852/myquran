import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:myquran/functions/global_func.dart';
import 'package:myquran/models/get_tafsir_surah_response_model.dart';
import 'package:myquran/services/quran_services.dart';

part '../states/get_tafsir_surah_state.dart';

class GetTafsirSurahCubit extends Cubit<GetTafsirSurahState> {
  GetTafsirSurahCubit() : super(GetTafsirSurahInitial());

  void getTafsirSurah(int surahNumber) async {
    emit(GetTafsirSurahLoading());
    GetTafsirSurahResponseModel? tafsir = 
    await QuranServices().getTafsirSurah(surahNumber: surahNumber);
    if (tafsir == null) emit(GetTafsirSurahFailed("Failed to get surah data"));
    if (isNotNull(tafsir)) emit(GetTafsirSurahSuccess(tafsir!));
  }
}
