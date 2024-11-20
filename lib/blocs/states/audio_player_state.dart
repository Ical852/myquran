import 'package:audioplayers/audioplayers.dart';
import 'package:equatable/equatable.dart';
import 'package:myquran/models/get_surah_response_model.dart';

class AudioPlayerState extends Equatable {
  final String currentPlay;
  final int currentIndex;
  final List<String> audioList;
  final PlayerState playerState;
  final Data? surah;

  const AudioPlayerState({
    required this.currentPlay,
    required this.currentIndex,
    required this.audioList,
    required this.playerState,
    this.surah,
  });

  AudioPlayerState copyWith({
    String? currentPlay,
    int? currentIndex,
    List<String>? audioList,
    PlayerState? playerState,
    Data? surah,
  }) {
    return AudioPlayerState(
      currentPlay: currentPlay ?? this.currentPlay,
      currentIndex: currentIndex ?? this.currentIndex,
      audioList: audioList ?? this.audioList,
      playerState: playerState ?? this.playerState,
      surah: surah ?? this.surah,
    );
  }

  @override
  List<Object?> get props => [currentPlay, currentIndex, audioList, playerState, surah];
}
