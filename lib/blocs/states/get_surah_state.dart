part of '../cubits/get_surah_cubit.dart';

sealed class GetSurahState extends Equatable {
  const GetSurahState();

  @override
  List<Object> get props => [];
}

final class GetSurahInitial extends GetSurahState {}

final class GetSurahLoading extends GetSurahState {}

final class GetSurahSuccess extends GetSurahState {
  final GetSurahResponseModel surahs;

  GetSurahSuccess(this.surahs);

  @override
  List<Object> get props => [surahs];
}

final class GetSurahFailed extends GetSurahState {
  final String error;

  const GetSurahFailed(this.error);

  @override
  List<Object> get props => [error];
}
