part of '../cubits/bookmark_surah_cubit.dart';

sealed class BookmarkSurahState extends Equatable {
  const BookmarkSurahState();

  @override
  List<Object> get props => [];
}

final class BookmarkSurahInitial extends BookmarkSurahState {}
