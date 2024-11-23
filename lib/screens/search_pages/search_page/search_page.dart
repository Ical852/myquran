import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myquran/blocs/cubits/get_surah_cubit.dart';
import 'package:myquran/functions/global_func.dart';
import 'package:myquran/models/get_surah_response_model.dart';
import 'package:myquran/screens/detail_pages/surah_detail_page/surah_detail_page.dart';
import 'package:myquran/screens/search_pages/search_page/search_input.dart';
import 'package:myquran/shared/constants.dart';
import 'package:myquran/shared/text_styles.dart';
import 'package:myquran/view_models/search_page/search_page_view_model.dart';
import 'package:myquran/widgets/no_data.dart';
import 'package:myquran/widgets/retry_fetch.dart';
import 'package:myquran/widgets/surah_card.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late SearchPageViewModel searchVM = SearchPageViewModel(context);
  TextEditingController searchController = TextEditingController(text: "");
  List<Data>? filteredSurahs;

  void filterSurahs(String keyword, List<Data> allSurahs) {
    setState(() {
      if (keyword.isEmpty) {
        filteredSurahs = allSurahs;
      } else {
        filteredSurahs = allSurahs
          .where(
            (surah) => surah.namaLatin!
              .toLowerCase()
              .contains(keyword.toLowerCase())
          ).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget SearchHead() {
      return Container(
        margin: EdgeInsets.only(top: 16, bottom: 16),
        child: Column(
          children: [
            Text(
              "Related Surah",
              style: medium.prim.semiBold,
            ),
            SizedBox(height: 16),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24),
              height: 2,
              width: double.infinity,
              color: primary,
            ),
          ],
        ),
      );
    }

    Widget SurahLoading() {
      return Container(
        height: 350,
        child: Center(
          child: CircularProgressIndicator(
            color: primary,
          ),
        ),
      ); 
    }

    Widget SurahFailed() {
      return Container(
        height: 350,
        child: Center(
          child: RetryFetch(
            title: "Failed to get surah data",
            onRefetch: () => searchVM.getSurahData(),
          ),
        ),
      ); 
    }

    Widget SurahList(GetSurahResponseModel surahs) {
      var displayedSurahs = filteredSurahs ?? surahs.data!;
      if (displayedSurahs.length < 1) {
        return Container(
          margin: EdgeInsets.only(top: getWH(context, "height") / 8),
          child: NoData(
            title: "No Surah Found",
            desc: "Seems like there is no surah match with the searched keyword, try another keyword",
          ),
        );
      }

      return ListView.builder(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: 72,
        ),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: displayedSurahs.length,
        itemBuilder: (context, index) {
          var surah = displayedSurahs[index];
          return SurahCard(
            surah: surah,
            onPress: () {
              goToPage(context, SurahDetailPage(surah));
            },
          );
        }
      );
    }

    Widget SurahContent() {
      return BlocConsumer<GetSurahCubit, GetSurahState>(
        listener: (context, state) {
          if (!(state is GetSurahSuccess)) searchVM.getSurahData();
          if (state is GetSurahFailed) {
            showGLobalAlert("danger", "Failed to get surah data", context);
          }
        },
        builder: (context, state) {
          if (state is GetSurahLoading) return SurahLoading();
          if (state is GetSurahFailed) return SurahFailed();
          if (state is GetSurahSuccess) return SurahList(state.surahs);
          return Container();
        },
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              SearchInput(
                onBack: () => Navigator.pop(context),
                searchController: searchController,
                onFieldSubmitted: (keyword){
                  final cubitState = context.read<GetSurahCubit>().state;
                  if (cubitState is GetSurahSuccess) {
                    filterSurahs(keyword, cubitState.surahs.data!);
                  }
                }
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SearchHead(),
                      SurahContent(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}