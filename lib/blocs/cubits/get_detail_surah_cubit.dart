import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:myquran/functions/global_func.dart';
import 'package:myquran/models/get_detail_surah_response_model.dart';
import 'package:myquran/services/quran_services.dart';

part '../states/get_detail_surah_state.dart';

class GetDetailSurahCubit extends Cubit<GetDetailSurahState> {
  GetDetailSurahCubit() : super(GetDetailSurahInitial());

  void getDetailSurah(int surahNumber) async {
    emit(GetDetailSurahLoading());
    GetDetailSurahResponseModel? detail = 
    await QuranServices().getDetailSurah(surahNumber: surahNumber);
    if (detail == null) emit(GetDetailSurahFailed("Failed to get detail surah data"));
    if (isNotNull(detail)) emit(GetDetailSurahSuccess(detail!));
  }
}
