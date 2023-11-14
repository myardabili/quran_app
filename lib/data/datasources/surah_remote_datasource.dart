import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'package:quran_app/data/models/surah_model.dart';
import 'package:quran_app/data/models/detail_surah_model.dart';
import 'package:quran_app/data/models/tafsir_surah_model.dart';

class SurahRemoteDatasources {
  Future<Either<String, List<SurahModel>>> getSurah() async {
    final response = await http.get(Uri.parse('https://equran.id/api/surat/'));
    if (response.statusCode == 200) {
      return Right(List<SurahModel>.from(
          jsonDecode(response.body).map((x) => SurahModel.fromMap(x))));
    } else {
      return const Left('Get surah error');
    }
  }

  Future<Either<String, DetailSurahModel>> getDetailSurah(int number) async {
    final response =
        await http.get(Uri.parse('https://equran.id/api/surat/$number'));
    if (response.statusCode == 200) {
      return Right(DetailSurahModel.fromJson(response.body));
    } else {
      return const Left('Get detail surah error');
    }
  }

  Future<Either<String, TafsirSurahModel>> getTafsirSurah(int number) async {
    final response =
        await http.get(Uri.parse('https://equran.id/api/tafsir/$number'));
    if (response.statusCode == 200) {
      return Right(TafsirSurahModel.fromJson(response.body));
    } else {
      return const Left('Get tafsir surah error');
    }
  }
}
