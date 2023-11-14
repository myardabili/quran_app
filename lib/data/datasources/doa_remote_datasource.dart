import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'package:quran_app/data/models/doa_model.dart';

class DoaRemoteDatasource {
  Future<Either<String, List<DoaModel>>> getDoa() async {
    final response = await http
        .get(Uri.parse('https://doa-doa-api-ahmadramadhan.fly.dev/api'));
    if (response.statusCode == 200) {
      return Right(List<DoaModel>.from(
          jsonDecode(response.body).map((x) => DoaModel.fromMap(x))));
    } else {
      return const Left('Get doa error');
    }
  }
}
