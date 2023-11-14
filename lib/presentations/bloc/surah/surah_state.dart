// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'surah_bloc.dart';

sealed class SurahState {}

final class SurahInitial extends SurahState {}

class SurahLoading extends SurahState {}

class SurahLoaded extends SurahState {
  final List<SurahModel> model;
  SurahLoaded({
    required this.model,
  });
}

class SurahError extends SurahState {
  final String message;
  SurahError({
    required this.message,
  });
}
