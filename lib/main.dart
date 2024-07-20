import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myquran/blocs/cubits/get_detail_surah_cubit.dart';
import 'package:myquran/blocs/cubits/get_surah_cubit.dart';
import 'package:myquran/blocs/cubits/get_tafsir_surah_cubit.dart';
import 'package:myquran/blocs/cubits/page_cubit.dart';
import 'package:myquran/screens/main_pages/main_page.dart';
import 'package:myquran/screens/splash_page.dart';
import 'package:myquran/shared/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: primary));

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PageCubit()),
        BlocProvider(create: (context) => GetSurahCubit()),
        BlocProvider(create: (context) => GetDetailSurahCubit()),
        BlocProvider(create: (context) => GetTafsirSurahCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: {
          "/": (context) => SplashPage(),
          "/main": (context) => MainPage()
        },
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) => Scaffold(
              appBar: AppBar(title: Text("Unknown Route")),
              body: Center(child: Text("Unknown Route")),
            ),
          );
        },
      ),
    );
  }
}
