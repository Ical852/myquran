import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:myquran/blocs/states/audio_player_state.dart';
import 'package:myquran/models/get_surah_response_model.dart';

class AudioPlayerCubit extends Cubit<AudioPlayerState> {
  final AudioPlayer _audioPlayer;

  AudioPlayerCubit()
      : _audioPlayer = AudioPlayer(),
        super(AudioPlayerState(
          currentPlay: "",
          currentIndex: 0,
          audioList: [],
          playerState: PlayerState.stopped,
          surah: null,
        )) {
    _audioPlayer.onPlayerStateChanged.listen((PlayerState playerState) {
      emit(state.copyWith(playerState: playerState));
    });

    _audioPlayer.onPlayerComplete.listen((event) {
      _playNext();
    });
  }

  Future<void> play(String url, List<String> audioList, int index, Data surah) async {
    if (state.currentPlay == url && state.playerState == PlayerState.playing) {
      await stop();
    } else {
      await _audioPlayer.play(UrlSource(url));
      emit(state.copyWith(
        currentPlay: url,
        audioList: audioList,
        currentIndex: index,
        surah: surah,
      ));
    }
  }

  Future<void> stop() async {
    await _audioPlayer.stop();
    emit(state.copyWith(
      currentPlay: "",
      currentIndex: 0,
      playerState: PlayerState.stopped,
    ));
  }

  void _playNext() async {
    if (state.currentIndex + 1 < state.audioList.length) {
      final nextIndex = state.currentIndex + 1;
      final nextUrl = state.audioList[nextIndex];
      await _audioPlayer.play(UrlSource(nextUrl));
      emit(state.copyWith(
        currentPlay: nextUrl,
        currentIndex: nextIndex,
      ));
    } else {
      await stop();
    }
  }

  @override
  Future<void> close() {
    _audioPlayer.dispose();
    return super.close();
  }
}
