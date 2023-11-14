// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quran_app/data/datasources/surah_remote_datasource.dart';
import 'package:quran_app/data/models/detail_surah_model.dart';

part 'detail_surah_event.dart';
part 'detail_surah_state.dart';

class DetailSurahBloc extends Bloc<DetailSurahEvent, DetailSurahState> {
  final SurahRemoteDatasources datasources;
  DetailSurahBloc(
    this.datasources,
  ) : super(DetailSurahInitial()) {
    on<GetDetailSurahEvent>((event, emit) async {
      emit(DetailSurahLoading());
      final result = await datasources.getDetailSurah(event.number);
      result.fold(
        (error) => emit(DetailSurahError(message: error)),
        (data) => emit(DetailSurahLoaded(model: data)),
      );
    });
  }
}
