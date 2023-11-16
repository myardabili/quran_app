import 'dart:convert';

class TafsirSurahModel {
  bool? status;
  int? nomor;
  String? nama;
  String? namaLatin;
  int? jumlahAyat;
  String? tempatTurun;
  String? arti;
  String? deskripsi;
  String? audio;
  List<Tafsir>? tafsir;

  TafsirSurahModel({
    this.status,
    this.nomor,
    this.nama,
    this.namaLatin,
    this.jumlahAyat,
    this.tempatTurun,
    this.arti,
    this.deskripsi,
    this.audio,
    this.tafsir,
  });

  factory TafsirSurahModel.fromJson(String str) =>
      TafsirSurahModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TafsirSurahModel.fromMap(Map<String, dynamic> json) =>
      TafsirSurahModel(
        status: json["status"],
        nomor: json["nomor"],
        nama: json["nama"],
        namaLatin: json["nama_latin"],
        jumlahAyat: json["jumlah_ayat"],
        tempatTurun: json["tempat_turun"],
        arti: json["arti"],
        deskripsi: json["deskripsi"],
        audio: json["audio"],
        tafsir: json["tafsir"] == null
            ? []
            : List<Tafsir>.from(json["tafsir"]!.map((x) => Tafsir.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "nomor": nomor,
        "nama": nama,
        "nama_latin": namaLatin,
        "jumlah_ayat": jumlahAyat,
        "tempat_turun": tempatTurun,
        "arti": arti,
        "deskripsi": deskripsi,
        "audio": audio,
        "tafsir": tafsir == null
            ? []
            : List<dynamic>.from(tafsir!.map((x) => x.toMap())),
      };
}

class Tafsir {
  int? id;
  int? surah;
  int? ayat;
  String? tafsir;

  Tafsir({
    this.id,
    this.surah,
    this.ayat,
    this.tafsir,
  });

  factory Tafsir.fromJson(String str) => Tafsir.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Tafsir.fromMap(Map<String, dynamic> json) => Tafsir(
        id: json["id"],
        surah: json["surah"],
        ayat: json["ayat"],
        tafsir: json["tafsir"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "surah": surah,
        "ayat": ayat,
        "tafsir": tafsir,
      };
}
