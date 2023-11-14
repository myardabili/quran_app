// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'tafsir_surah_bloc.dart';

sealed class TafsirSurahState {}

final class TafsirSurahInitial extends TafsirSurahState {}

class TafsirSurahLoading extends TafsirSurahState {}

class TafsirSurahLoaded extends TafsirSurahState {
  final TafsirSurahModel model;
  TafsirSurahLoaded({
    required this.model,
  });
}

class TafsirSurahError extends TafsirSurahState {
  final String message;
  TafsirSurahError({
    required this.message,
  });
}
