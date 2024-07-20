part of '../cubits/get_detail_surah_cubit.dart';

sealed class GetDetailSurahState extends Equatable {
  const GetDetailSurahState();

  @override
  List<Object> get props => [];
}

final class GetDetailSurahInitial extends GetDetailSurahState {}

final class GetDetailSurahLoading extends GetDetailSurahState {}

final class GetDetailSurahSuccess extends GetDetailSurahState {
  final GetDetailSurahResponseModel detail;

  GetDetailSurahSuccess(this.detail);

  @override
  List<Object> get props => [detail];
}

final class GetDetailSurahFailed extends GetDetailSurahState {
  final String error;

  const GetDetailSurahFailed(this.error);

  @override
  List<Object> get props => [error];
}