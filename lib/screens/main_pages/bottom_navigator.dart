import 'package:flutter/material.dart';
import 'package:myquran/shared/constants.dart';
import 'package:myquran/widgets/menu_item.dart';

// ignore: must_be_immutable
class BottomNavigator extends StatelessWidget {
  Function(String) onPress;
  String currentPage;

  BottomNavigator({
    super.key,
    required this.onPress,
    required this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    Widget MenuItems() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 70,
          decoration: BoxDecoration(
            color: whiteColor,
            boxShadow: [
              BoxShadow(
                color: black.withOpacity(0.9),
                blurRadius: 9,
                offset: Offset(0, 9)
              )
            ]
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              MenuItemCustom(
                icon: 'home',
                onPress: () => onPress('home'),
                active: currentPage == 'home',
              ),
              MenuItemCustom(
                icon: 'bookmark',
                onPress: () => onPress('bookmark'),
                active: currentPage == 'bookmark',
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      width: double.infinity,
      height: 88,
      child: Stack(
        children: [
          MenuItems(),
        ],
      ),
    );
  }
}
