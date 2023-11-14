// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/data/datasources/surah_remote_datasource.dart';
import 'package:quran_app/data/models/surah_model.dart';

part 'surah_event.dart';
part 'surah_state.dart';

class SurahBloc extends Bloc<SurahEvent, SurahState> {
  final SurahRemoteDatasources datasources;
  SurahBloc(
    this.datasources,
  ) : super(SurahInitial()) {
    on<GetSurahEvent>((event, emit) async {
      emit(SurahLoading());
      final result = await datasources.getSurah();
      result.fold(
        (error) => emit(SurahError(message: error)),
        (data) => emit(SurahLoaded(model: data)),
      );
    });
  }
}
