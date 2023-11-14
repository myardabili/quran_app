// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'tafsir_surah_bloc.dart';

sealed class TafsirSurahEvent {}

class GetTafsirSurahEvent extends TafsirSurahEvent {
  final int number;
  GetTafsirSurahEvent({
    required this.number,
  });
}
