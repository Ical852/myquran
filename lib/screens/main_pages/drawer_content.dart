import 'package:flutter/material.dart';
import 'package:myquran/functions/global_func.dart';
import 'package:myquran/screens/search_pages/search_bookmark_page/search_bookmark_page.dart';
import 'package:myquran/shared/constants.dart';
import 'package:myquran/widgets/image_custom.dart';
import 'package:myquran/widgets/nav_item.dart';

// ignore: must_be_immutable
class DrawerContent extends StatelessWidget {
  Function() closeDrawer;
  DrawerContent(this.closeDrawer);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: white,
      child: Column(
        children: [
          ImageCustom(
            height: 120,
            margin: EdgeInsets.only(top: 36),
            width: 120,
            image: AssetImage(getIM("img-quran.png")),
          ),
          NavItem(
            title: "Home",
            icon: "ic-home-active.png",
            onPress: () {
              changeTab(context, "home");
              closeDrawer();
            },
          ),
          NavItem(
            title: "Bookmark",
            icon: "ic-ayat-bookmark.png",
            onPress: () {
              changeTab(context, "bookmark");
              closeDrawer();
            } ,
          ),
          NavItem(
            title: "Bookmarked Surah",
            icon: "ic-quran-num.png",
            onPress: () {
              goToPage(context, SearchBookmarkPage("surah"));
              closeDrawer();
            },
          ),
          NavItem(
            title: "Bookmarked Ayat",
            icon: "ic-ayat-bookmarked.png",
            onPress: () {
              goToPage(context, SearchBookmarkPage("ayat"));
              closeDrawer();
            },
          ),
        ],
      ),
    );
  }
}