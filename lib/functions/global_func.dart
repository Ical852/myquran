import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myquran/blocs/cubits/page_cubit.dart';
import 'package:myquran/models/get_detail_surah_response_model.dart';
import 'package:myquran/shared/constants.dart';
import 'package:myquran/shared/text_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

dynamic nullChecker(dynamic check) {
  if (check == null) return null;
  return check;
}

bool isNotNull(dynamic check) {
  return check != null;
}

Color getColorType(type) {
  if (type == 'danger') {
    return danger;
  } else if (type == 'info') {
    return info;
  } else {
    return success;
  }
}

double getWH(BuildContext context, String type) {
  var size = MediaQuery.of(context).size;

  if (type == 'width') return size.width;
  return size.height;
}

String capitalize(String text) {
  if (text.isEmpty) return text;
  return text[0].toUpperCase() + text.substring(1);
}

String cleanHTML(String input) {
  final regex = RegExp(r'<[^>]*>', multiLine: true, caseSensitive: false);
  return input.replaceAll(regex, '').trim();
}

String getIC(String icon) {
  return "assets/icons/$icon";
}

String getIM(String image) {
  return "assets/images/$image";
}

String getIL(String illustrations) {
  return "assets/illustrations/$illustrations";
}

List<dynamic> getAudio(Ayat ayat) {
  var setup = ayat.toJson();
  var audios = [];
  for (var i = 1; i < 6; i++) {
    var audio = setup['audio']['0${i}'];
    if (audio != null) {
      audios.add(audio);
    }
  }
  return audios;
}

BoxShadow getBoxShadow(double show) {
  return BoxShadow(
    color: blackColor.withOpacity(show / 10),
    blurRadius: show,
    offset: Offset(0, show)
  );
}

String getAudioName(String url) {
  List<String> parts = url.split("/");
  return parts[parts.length - 2];
}

Future<SharedPreferences> prefs() async {
  return await SharedPreferences.getInstance();
}

void setStringPref(key, value) async {
  var pref = await prefs();
  pref.setString(key, value);
}

Future<Object?> getStringPref(key) async {
  var pref = await prefs();
  return await pref.get(key);
}

void removeStringPref(key) async {
  var pref = await prefs();
  pref.remove(key);
}

void showGLobalAlert(type, text, context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    duration: Duration(seconds: 2),
    content: Text(
      text,
      style: regular.white.bold,
      textAlign: TextAlign.center,
    ),
    backgroundColor: getColorType(type),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(8)
      )
    ),
  ));
}

void showDrawer(BuildContext context, double height, Widget content) {
  showModalBottomSheet<void>(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(32), topRight: Radius.circular(32)
      )
    ),
    builder: (BuildContext context) {
      return Container(
        height: height,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32), topRight: Radius.circular(32)
          )
        ),
        child: content,
      );
    },
  );
}

void showConfirm(BuildContext context, String confirm, Function onYes, onCancel) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Confirm'),
        content: Text(confirm),
        actions: <Widget>[
          TextButton(
            child: Text('No'),
            onPressed: () {
              onCancel();
              Navigator.of(context).pop(false);
            },
          ),
          TextButton(
            child: Text('Yes'),
            onPressed: () {
              onYes();
              Navigator.of(context).pop(true);
            },
          ),
        ],
      );
    },
  ).then((value) {
    if (value != null && value) {
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Cancelled!'),
      ));
    }
  });
}

void goToPage(BuildContext context, route) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => route
    ),
  );
}

void changeTab(BuildContext context, page) {
  return context.read<PageCubit>().setNewPage(page);
}

void navReplace(BuildContext context, String path) {
  Navigator.pushNamedAndRemoveUntil(
    context, 
    path,
    (route) => false,
  );
}