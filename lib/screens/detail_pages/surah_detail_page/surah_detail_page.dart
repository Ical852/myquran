import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myquran/blocs/cubits/audio_player_cubit.dart';
import 'package:myquran/blocs/cubits/bookmark_ayat_cubit.dart';
import 'package:myquran/blocs/cubits/bookmark_surah_cubit.dart';
import 'package:myquran/blocs/cubits/get_detail_surah_cubit.dart';
import 'package:myquran/functions/global_func.dart';
import 'package:myquran/models/get_detail_surah_response_model.dart';
import 'package:myquran/models/get_surah_response_model.dart' as surahModel;
import 'package:myquran/screens/detail_pages/surah_detail_page/partials/on_going.dart';
import 'package:myquran/shared/constants.dart';
import 'package:myquran/view_models/detail_page/detail_surah_view_model.dart';
import 'package:myquran/widgets/ayat_card/ayat_card.dart';
import 'package:myquran/widgets/header_custom.dart';
import 'package:myquran/widgets/retry_fetch.dart';

// ignore: must_be_immutable
class SurahDetailPage extends StatefulWidget {
  final surahModel.Data surah;
  SurahDetailPage(this.surah);

  @override
  State<SurahDetailPage> createState() => _SurahDetailPageState();
}

class _SurahDetailPageState extends State<SurahDetailPage> {
  // Cubit Behavior
  late DetailSurahViewModel detailVM = DetailSurahViewModel(context);
  String loading = "";
  ScrollController _scrollController = ScrollController();
  // Cubit Behavior

  // Local other behavior
  final otherAudioPlayer = AudioPlayer();
  var otherCurrentPlay = "";
  var otherLoading = "";
  // Local other behavior

  @override
  void initState() {
    super.initState();
    detailVM.getDetailSurah(this.widget.surah.nomor!);
    // Local other behavior
    otherAudioPlayer.onPlayerComplete.listen((event) {
      otherAudioPlayer.stop();
    });
    // Local other behavior
  }

  @override
  void dispose() {
    _scrollController.dispose();
    // Local other behavior
    otherAudioPlayer.dispose();
    // Local other behavior
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Cubit behavior
    var surah = this.widget.surah;
    final audioCubit = context.read<AudioPlayerCubit>();
    void playHandler(String audio, List<String> audioList, int index) async {
      setState(() {
        loading = audio;
      });
      await audioCubit.play(audio, audioList, index);
      setState(() {
        loading = "";
      });
    }
    // Cubit behavior

    // Local other behavior
    void playOtherAudio(audio) async {
      audioCubit.stop();
      setState(() {
        otherLoading = audio;
        otherCurrentPlay = audio;
      });
      await otherAudioPlayer.play(UrlSource(audio));
      setState(() {
        otherLoading = "";
      });
    }

    void stopOtherAudio() async {
      await otherAudioPlayer.stop();
      setState(() {
        otherLoading = "";
        otherCurrentPlay = "";
      });
    }
    // Local other behavior

    Widget HeaderContent() {
      return BlocConsumer<BookmarkSurahCubit, List<surahModel.Data>>(
        listener: (context, state) {},
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: HeaderCustom(
              rightIcon: "ic-bookmark${detailVM.surahBookmarked(surah) ? '-active' : ''}.png",
              title: this.widget.surah.namaLatin ?? "-",
              onRight: () {
                setState(() {
                  detailVM.surahBookmark(surah);
                });
              },
            ),
          );
        },
      );
    }

    Widget AyatList(Data data) {
      return BlocConsumer<BookmarkAyatCubit, List<Ayat>>(
        listener: (context, state) {},
        builder: (context, state) {
          List<String> audioList = data.ayat!.map((e) => e.audio!.s01!).toList();

          return Container(
            margin: EdgeInsets.only(top: 32, left: 24, right: 24),
            child: ListView.builder(
              controller: _scrollController,
              shrinkWrap: true,
              itemCount: data.jumlahAyat,
              itemBuilder: (context, index) {
                var ayat = data.ayat![index];
                return AyatCard(
                  ayat: ayat,
                  currentPlay: context.watch<AudioPlayerCubit>().state == PlayerState.playing
                    ? audioCubit.currentPlay
                    : "",
                  loading: loading,
                  onPlay: (audio) => playHandler(audio, audioList, index),
                  onBookmark: () => setState(() {
                    detailVM.ayatBookmark(ayat);
                  }),
                  isBookmarked: detailVM.ayatBookmarked(ayat),
                  otherCurrentPlay: otherCurrentPlay,
                  otherLoading: otherLoading,
                  playOther: (e) => playOtherAudio(e),
                  stopOther: () => stopOtherAudio(),
                );
              }
            ),
          );
        },
      );
    }

    Widget DetailLoading() {
      return Container(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: CircularProgressIndicator(
            color: primary,
          ),
        ),
      );
    }

    Widget DetailFailed() {
      return Container(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: RetryFetch(
            title: "Failed to get detail surah data",
            onRefetch: () => detailVM.getDetailSurah(surah.nomor!),
          ),
        ),
      );
    }

    Widget DetailContent(GetDetailSurahResponseModel response) {
      return SingleChildScrollView(
        child: Column(
          children: [
            HeaderContent(),
            OnGoing(surah: surah),
            AyatList(response.data!),
          ],
        ),
      );
    }

    return WillPopScope(
      onWillPop: () async {
        // Do not stop the audio when back
        return true;
      },
      child: Scaffold(
        backgroundColor: white,
        body: SafeArea(
          child: BlocConsumer<GetDetailSurahCubit, GetDetailSurahState>(
            listener: (context, state) {
              if (state is GetDetailSurahFailed) {
                showGLobalAlert("danger", "Failed to get detail surah data", context);
              }
            },
            builder: (context, state) {
              if (state is GetDetailSurahLoading) return DetailLoading();
              if (state is GetDetailSurahFailed) return DetailFailed();
              if (state is GetDetailSurahSuccess) return DetailContent(state.detail);
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
