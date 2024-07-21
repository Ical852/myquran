import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myquran/blocs/cubits/bookmark_ayat_cubit.dart';
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
  late DetailSurahViewModel detailVM = DetailSurahViewModel(context);

  final player = AudioPlayer();
  // ignore: unused_field
  PlayerState _playerState = PlayerState.stopped;
  late StreamSubscription<PlayerState> _playerStateSubscription;

  String currentPlay = "";
  String loading = "";

  @override
  void initState() {
    super.initState();
    detailVM.getDetailSurah(this.widget.surah.nomor!);
    _playerStateSubscription =
        player.onPlayerStateChanged.listen((PlayerState state) {
      setState(() {
        _playerState = state;
      });

      if (state == PlayerState.completed) {
        setState(() {
          currentPlay = "";
          loading = "";
        });
      }
    });
  }

  @override
  void dispose() {
    player.stop();
    player.dispose();
    _playerStateSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var surah = this.widget.surah;

    void playHandler(String audio) async {
      if (currentPlay == audio) {
        setState(() {
          loading = currentPlay;
        });
        await player.stop();
        setState(() {
          loading = "";
          currentPlay = "";
        });
      } else {
        setState(() {
          loading = audio;
          currentPlay = audio;
        });
        await player.play(UrlSource(audio));
        setState(() {
          loading = "";
        });
      }
    }

    Widget HeaderContent() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: HeaderCustom(
          onBack: () => player.stop(),
          icon: "ic-bookmark.png",
          backAble: true,
          title: this.widget.surah.namaLatin ?? "-",
          onSearch: () => {},
        ),
      );
    }

    Widget AyatList(Data data) {
      return BlocConsumer<BookmarkAyatCubit, List<Ayat>>(
        listener: (context, state) {},
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.only(top: 32, left: 24, right: 24),
            child: ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: data.jumlahAyat,
              itemBuilder: (context, index) {
                var ayat = data.ayat![index];
                return AyatCard(
                  ayat: ayat,
                  currentPlay: currentPlay,
                  loading: loading,
                  onPlay: (audio) => playHandler(audio),
                  onBookmark: () => {},
                  isBookmarked: false,
                );
              }
            )
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
              onRefetch: () => detailVM.getDetailSurah(surah.nomor!)),
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
        player.stop();
        return true;
      },
      child: Scaffold(
        backgroundColor: white,
        body: SafeArea(
          child: BlocConsumer<GetDetailSurahCubit, GetDetailSurahState>(
            listener: (context, state) {
              if (state is GetDetailSurahFailed) {
                showGLobalAlert(
                    "danger", "Failed to get detail surah data", context);
              }
            },
            builder: (context, state) {
              if (state is GetDetailSurahLoading) return DetailLoading();
              if (state is GetDetailSurahFailed) return DetailFailed();
              if (state is GetDetailSurahSuccess)
                return DetailContent(state.detail);
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
