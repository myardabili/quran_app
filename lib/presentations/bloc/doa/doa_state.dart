// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'doa_bloc.dart';

sealed class DoaState {}

final class DoaInitial extends DoaState {}

class DoaLoading extends DoaState {}

class DoaLoaded extends DoaState {
  final List<DoaModel> model;
  DoaLoaded({
    required this.model,
  });
}

class DoaError extends DoaState {
  final String message;
  DoaError({
    required this.message,
  });
}
