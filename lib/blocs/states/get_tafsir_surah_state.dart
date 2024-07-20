part of '../cubits/get_tafsir_surah_cubit.dart';

sealed class GetTafsirSurahState extends Equatable {
  const GetTafsirSurahState();

  @override
  List<Object> get props => [];
}

final class GetTafsirSurahInitial extends GetTafsirSurahState {}

final class GetTafsirSurahLoading extends GetTafsirSurahState {}

final class GetTafsirSurahSuccess extends GetTafsirSurahState {
  final GetTafsirSurahResponseModel tafsir;

  GetTafsirSurahSuccess(this.tafsir);

  @override
  List<Object> get props => [tafsir];
}

final class GetTafsirSurahFailed extends GetTafsirSurahState {
  final String error;

  const GetTafsirSurahFailed(this.error);

  @override
  List<Object> get props => [error];
}
