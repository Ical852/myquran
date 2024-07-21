import 'package:flutter/material.dart';
import 'package:myquran/functions/global_func.dart';
import 'package:myquran/shared/text_styles.dart';
import 'package:myquran/widgets/image_custom.dart';

// ignore: must_be_immutable
class HeaderCustom extends StatelessWidget {
  String? icon;
  String title;
  bool backAble;
  Function()? onBack, onSearch;

  HeaderCustom({
    super.key,
    required this.title,
    this.backAble = false,
    this.onBack = null,
    this.onSearch = null,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    var rightIcon = this.icon != null ? this.icon : "ic-search.png";
    
    Widget LeftContent() {
      var icon = backAble ? "ic-back.png" : "ic-bar.png";
      return GestureDetector(
        onTap: (){
          if (backAble) {
            if (onBack != null) onBack!();
            Navigator.pop(context);
          }
        },
        child: ImageCustom(
          height: backAble ? 26 : 24,
          width: backAble ? 26 : 24,
          image: AssetImage(getIC(icon)),
        ),
      );
    }
    
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              LeftContent(),
              SizedBox(width: 32),
              Text(
                title,
                style: mega.text.bold,
              )
            ],
          ),
          GestureDetector(
            onTap: (){
              if (onSearch != null) onSearch!();
            },
            child: ImageCustom(
              height: 24,
              width: 24,
              image: AssetImage(getIC(rightIcon!)),
            ),
          )
        ],
      ),
    );
  }
}