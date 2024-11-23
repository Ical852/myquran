import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myquran/blocs/cubits/get_surah_cubit.dart';
import 'package:myquran/functions/global_func.dart';
import 'package:myquran/models/get_surah_response_model.dart';
import 'package:myquran/screens/detail_pages/surah_detail_page/surah_detail_page.dart';
import 'package:myquran/screens/main_pages/tabs/home_tab/partials/last_read.dart';
import 'package:myquran/screens/main_pages/tabs/home_tab/partials/surah_gap.dart';
import 'package:myquran/screens/search_pages/search_page/search_page.dart';
import 'package:myquran/shared/constants.dart';
import 'package:myquran/view_models/main_page/home_view_model.dart';
import 'package:myquran/widgets/header_custom.dart';
import 'package:myquran/widgets/retry_fetch.dart';
import 'package:myquran/widgets/surah_card.dart';

// ignore: must_be_immutable
class HomeTab extends StatefulWidget {
  Function() openDrawer;
  HomeTab(this.openDrawer);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  late HomeViewModel homeVM = HomeViewModel(context);

  @override
  void initState() {
    super.initState();
    homeVM.getSurahData();
  }

  @override
  Widget build(BuildContext context) {
    Widget HeaderContent() {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 32
        ),
        child: HeaderCustom(
          leftIcon: "ic-bar.png",
          title: "Home",
          onRight: () => goToPage(context, SearchPage()),
          onLeft: () => widget.openDrawer(),
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
            onRefetch: () => homeVM.getSurahData(),
          ),
        ),
      ); 
    }

    Widget SurahList(GetSurahResponseModel surahs) {
      return ListView.builder(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 8,
          bottom: 124,
        ),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: surahs.data!.length,
        itemBuilder: (context, index) {
          var surah = surahs.data![index];
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

    return Container(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            HeaderContent(),
            LastRead(),
            SurahGap(),
            SurahContent(),
          ],
        ),
      ),
    );
  }
}