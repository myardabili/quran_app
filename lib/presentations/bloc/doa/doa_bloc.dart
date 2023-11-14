// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:quran_app/data/datasources/doa_remote_datasource.dart';
import 'package:quran_app/data/models/doa_model.dart';

part 'doa_event.dart';
part 'doa_state.dart';

class DoaBloc extends Bloc<DoaEvent, DoaState> {
  final DoaRemoteDatasource datasource;
  DoaBloc(
    this.datasource,
  ) : super(DoaInitial()) {
    on<GetDoaEvent>((event, emit) async {
      emit(DoaLoading());
      final result = await datasource.getDoa();
      result.fold(
        (error) => emit(DoaError(message: error)),
        (data) => emit(DoaLoaded(model: data)),
      );
    });
  }
}
