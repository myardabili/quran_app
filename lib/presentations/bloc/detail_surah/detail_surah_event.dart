// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'detail_surah_bloc.dart';

sealed class DetailSurahEvent {}

class GetDetailSurahEvent extends DetailSurahEvent {
  final int number;
  GetDetailSurahEvent({
    required this.number,
  });
}
