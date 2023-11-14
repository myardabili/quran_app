// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'detail_surah_bloc.dart';

sealed class DetailSurahState {}

final class DetailSurahInitial extends DetailSurahState {}

class DetailSurahLoading extends DetailSurahState {}

class DetailSurahLoaded extends DetailSurahState {
  final DetailSurahModel model;
  DetailSurahLoaded({
    required this.model,
  });
}

class DetailSurahError extends DetailSurahState {
  final String message;
  DetailSurahError({
    required this.message,
  });
}
