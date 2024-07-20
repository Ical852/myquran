import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:myquran/functions/global_func.dart';
import 'package:myquran/models/get_surah_response_model.dart';
import 'package:myquran/services/quran_services.dart';

part '../states/get_surah_state.dart';

class GetSurahCubit extends Cubit<GetSurahState> {
  GetSurahCubit() : super(GetSurahInitial());

  void getSurah() async {
    emit(GetSurahLoading());
    GetSurahResponseModel? surahs = await QuranServices().getSurah();
    if (surahs == null) emit(GetSurahFailed("Failed to get surah data"));
    if (isNotNull(surahs)) emit(GetSurahSuccess(surahs!));
  }
}
