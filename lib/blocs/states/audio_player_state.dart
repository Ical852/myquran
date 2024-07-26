part of '../cubits/audio_player_cubit.dart';

sealed class AudioPlayerState extends Equatable {
  const AudioPlayerState();

  @override
  List<Object> get props => [];
}

final class AudioPlayerInitial extends AudioPlayerState {}
