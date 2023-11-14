import 'dart:convert';

class DoaModel {
  String? id;
  String? doa;
  String? ayat;
  String? latin;
  String? artinya;

  DoaModel({
    this.id,
    this.doa,
    this.ayat,
    this.latin,
    this.artinya,
  });

  factory DoaModel.fromJson(String str) => DoaModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DoaModel.fromMap(Map<String, dynamic> json) => DoaModel(
        id: json["id"],
        doa: json["doa"],
        ayat: json["ayat"],
        latin: json["latin"],
        artinya: json["artinya"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "doa": doa,
        "ayat": ayat,
        "latin": latin,
        "artinya": artinya,
      };
}
