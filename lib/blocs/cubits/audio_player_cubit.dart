import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part '../states/audio_player_state.dart';

class AudioPlayerCubit extends Cubit<PlayerState> {
  final AudioPlayer _audioPlayer;
  String _currentPlay = "";
  int _currentIndex = 0;
  List<String> _audioList = [];

  AudioPlayerCubit()
      : _audioPlayer = AudioPlayer(),
        super(PlayerState.stopped) {
    _audioPlayer.onPlayerStateChanged.listen((PlayerState state) {
      emit(state);
    });

    _audioPlayer.onPlayerComplete.listen((event) {
      _playNext();
    });
  }

  String get currentPlay => _currentPlay;
  int get currentIndex => _currentIndex;

  Future<void> play(String url, List<String> audioList, int index) async {
    if (_currentPlay == url && state == PlayerState.playing) {
      await stop();
    } else {
      _currentPlay = url;
      _audioList = audioList;
      _currentIndex = index;
      await _audioPlayer.play(UrlSource(url));
    }
  }

  Future<void> stop() async {
    await _audioPlayer.stop();
    _currentPlay = "";
    _currentIndex = 0;
  }

  void _playNext() async {
    if (_currentIndex + 1 < _audioList.length) {
      _currentIndex++;
      _currentPlay = _audioList[_currentIndex];
      await _audioPlayer.play(UrlSource(_currentPlay));
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