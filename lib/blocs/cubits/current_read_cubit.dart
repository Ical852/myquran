import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:myquran/models/get_surah_response_model.dart';

part '../states/current_read_state.dart';

class CurrentReadModel {
  late Data? data;
  late int? ayat;

  CurrentReadModel.init() {
    this.data = null;
    this.ayat = null;
  }

  CurrentReadModel(Data data, int ayat) {
    this.data = data;
    this.ayat = ayat;
  }
}

class CurrentReadCubit extends Cubit<CurrentReadModel> {
  CurrentReadCubit() : super(CurrentReadModel.init());
  
  void setCurrentRead(CurrentReadModel current) {
    emit(current);
  }
}
