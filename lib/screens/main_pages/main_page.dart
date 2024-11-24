import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myquran/blocs/cubits/page_cubit.dart';
import 'package:myquran/functions/global_func.dart';
import 'package:myquran/screens/main_pages/bottom_navigator.dart';
import 'package:myquran/screens/main_pages/drawer_content.dart';
import 'package:myquran/screens/main_pages/tabs/bookmark_tab/bookmark_tab.dart';
import 'package:myquran/screens/main_pages/tabs/home_tab/home_tab.dart';
import 'package:myquran/shared/constants.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final globalKey = GlobalKey<ScaffoldState>();
  void openDrawer() {
    globalKey.currentState?.openDrawer();
  }
  void closeDrawer() {
    globalKey.currentState?.closeDrawer();
  }

  @override
  Widget build(BuildContext context) {
    Widget RenderContent(String state) {
      if (state == "home") return HomeTab(openDrawer);
      return BookmarkTab(openDrawer);
    }

    Widget BottomNavigatorContent(String state) {
      return Align(
        alignment: Alignment.bottomCenter,
        child: BottomNavigator(
          currentPage: state,
          onPress: (page) => changeTab(context, page),
        ),
      );
    }

    return Scaffold(
      backgroundColor: white,
      key: globalKey,
      drawer: Drawer(
        child: DrawerContent(closeDrawer),
      ),
      body: SafeArea(
        child: BlocConsumer<PageCubit, String>(
          listener: (context, state) {},
          builder: (context, state) {
            return Container(
              child: Stack(
                children: [
                  RenderContent(state),
                  BottomNavigatorContent(state),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
