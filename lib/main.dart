import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/data/datasources/doa_remote_datasource.dart';
import 'package:quran_app/data/datasources/surah_remote_datasource.dart';
import 'package:quran_app/presentations/bloc/detail_surah/detail_surah_bloc.dart';
import 'package:quran_app/presentations/bloc/doa/doa_bloc.dart';
import 'package:quran_app/presentations/bloc/surah/surah_bloc.dart';
import 'package:quran_app/presentations/bloc/tafsir_surah/tafsir_surah_bloc.dart';
import 'package:quran_app/presentations/pages/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SurahBloc(SurahRemoteDatasources()),
        ),
        BlocProvider(
          create: (context) => DetailSurahBloc(SurahRemoteDatasources()),
        ),
        BlocProvider(
          create: (context) => TafsirSurahBloc(SurahRemoteDatasources()),
        ),
        BlocProvider(
          create: (context) => DoaBloc(DoaRemoteDatasource()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Splash(),
      ),
    );
  }
}
