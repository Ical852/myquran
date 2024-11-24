import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myquran/blocs/cubits/bookmark_tafsir.dart';
import 'package:myquran/blocs/cubits/bookmark_tafsir_ayat_cubit.dart';
import 'package:myquran/blocs/cubits/get_tafsir_surah_cubit.dart';
import 'package:myquran/functions/global_func.dart';
import 'package:myquran/models/get_detail_surah_response_model.dart' as surahModel;
import 'package:myquran/models/get_tafsir_surah_response_model.dart';
import 'package:myquran/shared/constants.dart';
import 'package:myquran/view_models/detail_page/tafsir_surah_view_model.dart';
import 'package:myquran/widgets/header_custom.dart';
import 'package:myquran/widgets/retry_fetch.dart';
import 'package:myquran/widgets/tafsir_ayat_card/tafsir_ayat_card.dart';

// ignore: must_be_immutable
class DetailTafsirPage extends StatefulWidget {
  surahModel.Data surah;
  DetailTafsirPage(this.surah);

  @override
  State<DetailTafsirPage> createState() => _DetailTafsirPageState();
}

class _DetailTafsirPageState extends State<DetailTafsirPage> {
  late DetailTafsirViewModel tafsirVM = DetailTafsirViewModel(context);
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    tafsirVM.getTafsirSurah(widget.surah.nomor!);
  }

  @override
  Widget build(BuildContext context) {
    var surah = widget.surah;

    Widget HeaderContent(Data data) {
      return BlocConsumer<BookmarkTafsirCubit, List<TafsirModel>>(
        listener: (context, state) {},
        builder: (context, state) {
          var newTafsir = TafsirModel(data, surah);
          return Container(
            margin: EdgeInsets.only(
              left: 24,
              right: 24,
              top: 32,
            ),
            child: HeaderCustom(
              rightIcon: "ic-bookmark${tafsirVM.tafsirBookmarked(newTafsir) ? '-active' : ''}.png",
              title: "Tafsir ${surah.namaLatin ?? "-"}",
              onRight: () {
                setState(() {
                  tafsirVM.tafsirBookmark(newTafsir);
                });
              },
            ),
          );
        },
      );
    }

    Widget TafsirList(Data data) {
      return BlocBuilder<BookmarkTafsirAyatCubit, List<TafsirAyatModel>>(
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.only(top: 32, left: 24, right: 24),
            child: ListView.builder(
              controller: _scrollController,
              shrinkWrap: true,
              itemCount: surah.jumlahAyat,
              itemBuilder: (context, index) {
                var ayat = surah.ayat![index];
                var tafsir = data.tafsir![index];
                var bookmark = TafsirAyatModel(tafsir, ayat);
                return TafsirAyatCard(
                  ayat: ayat,
                  tafsir: tafsir,
                  onBookmark: () => setState(() {
                    tafsirVM.tafsirAyatBookmark(bookmark);
                  }),
                  isBookmarked: tafsirVM.tafsirAyatBookmarked(bookmark),
                );
              }
            ),
          );
        },
      );
    }

    Widget TafsirLoading() {
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

    Widget TafsirFailed() {
      return Container(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: RetryFetch(
            title: "Failed to get detail surah data",
            onRefetch: () => tafsirVM.getTafsirSurah(surah.nomor!),
          ),
        ),
      );
    }

    Widget TafsirContent(GetTafsirSurahResponseModel response) {
      return SingleChildScrollView(
        child: Column(
          children: [
            HeaderContent(response.data!),
            TafsirList(response.data!),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: BlocConsumer<GetTafsirSurahCubit, GetTafsirSurahState>(
          listener: (context, state) {
            if (state is GetTafsirSurahFailed) {
              showGLobalAlert("danger", "Failed to get detail surah data", context);
            }
          },
          builder: (context, state) {
            if (state is GetTafsirSurahLoading) return TafsirLoading();
            if (state is GetTafsirSurahFailed) return TafsirFailed();
            if (state is GetTafsirSurahSuccess) return TafsirContent(state.tafsir);
            return Container();
          },
        ),
      ),
    );
  }
}