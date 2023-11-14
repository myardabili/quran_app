// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quran_app/data/datasources/surah_remote_datasource.dart';
import 'package:quran_app/data/models/tafsir_surah_model.dart';

part 'tafsir_surah_event.dart';
part 'tafsir_surah_state.dart';

class TafsirSurahBloc extends Bloc<TafsirSurahEvent, TafsirSurahState> {
  final SurahRemoteDatasources datasources;
  TafsirSurahBloc(
    this.datasources,
  ) : super(TafsirSurahInitial()) {
    on<GetTafsirSurahEvent>((event, emit) async {
      emit(TafsirSurahLoading());
      final result = await datasources.getTafsirSurah(event.number);
      result.fold(
        (error) => emit(TafsirSurahError(message: error)),
        (data) => emit(TafsirSurahLoaded(model: data)),
      );
    });
  }
}
