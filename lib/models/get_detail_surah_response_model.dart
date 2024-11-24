import 'package:myquran/functions/global_func.dart';

class GetDetailSurahResponseModel {
  int? code;
  String? message;
  Data? data;

  GetDetailSurahResponseModel({
    this.code,
    this.message,
    this.data
  });

  GetDetailSurahResponseModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    data = isNotNull(json['data']) ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (isNotNull(this.data)) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? nomor;
  String? nama;
  String? namaLatin;
  int? jumlahAyat;
  String? tempatTurun;
  String? arti;
  String? deskripsi;
  AudioFull? audioFull;
  List<Ayat>? ayat;

  Data({
    this.nomor,
    this.nama,
    this.namaLatin,
    this.jumlahAyat,
    this.tempatTurun,
    this.arti,
    this.deskripsi,
    this.audioFull,
    this.ayat,
  });

  Data.fromJson(Map<String, dynamic> json) {
    nomor = json['nomor'];
    nama = json['nama'];
    namaLatin = json['namaLatin'];
    jumlahAyat = json['jumlahAyat'];
    tempatTurun = json['tempatTurun'];
    arti = json['arti'];
    deskripsi = json['deskripsi'];
    audioFull = isNotNull(json['audioFull'])
      ? new AudioFull.fromJson(json['audioFull'])
      : null;
    if (isNotNull(json['ayat'])) {
      ayat = <Ayat>[];
      json['ayat'].forEach((v) {
        ayat!.add(new Ayat.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nomor'] = this.nomor;
    data['nama'] = this.nama;
    data['namaLatin'] = this.namaLatin;
    data['jumlahAyat'] = this.jumlahAyat;
    data['tempatTurun'] = this.tempatTurun;
    data['arti'] = this.arti;
    data['deskripsi'] = this.deskripsi;
    if (isNotNull(this.audioFull)) {
      data['audioFull'] = this.audioFull!.toJson();
    }
    if (isNotNull(this.ayat)) {
      data['ayat'] = this.ayat!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AudioFull {
  String? s01;
  String? s02;
  String? s03;
  String? s04;
  String? s05;

  AudioFull({
    this.s01,
    this.s02,
    this.s03,
    this.s04,
    this.s05
  });

  AudioFull.fromJson(Map<String, dynamic> json) {
    s01 = json['01'];
    s02 = json['02'];
    s03 = json['03'];
    s04 = json['04'];
    s05 = json['05'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['01'] = this.s01;
    data['02'] = this.s02;
    data['03'] = this.s03;
    data['04'] = this.s04;
    data['05'] = this.s05;
    return data;
  }

  List<String?> toList() {
    return [s01, s02, s03, s04, s05];
  }
}

class Ayat {
  int? nomorAyat;
  String? teksArab;
  String? teksLatin;
  String? teksIndonesia;
  AudioFull? audio;

  Ayat({
    this.nomorAyat,
    this.teksArab,
    this.teksLatin,
    this.teksIndonesia,
    this.audio
  });

  Ayat.fromJson(Map<String, dynamic> json) {
    nomorAyat = json['nomorAyat'];
    teksArab = json['teksArab'];
    teksLatin = json['teksLatin'];
    teksIndonesia = json['teksIndonesia'];
    audio = isNotNull(json['audio']) 
      ? new AudioFull.fromJson(json['audio']) 
      : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nomorAyat'] = this.nomorAyat;
    data['teksArab'] = this.teksArab;
    data['teksLatin'] = this.teksLatin;
    data['teksIndonesia'] = this.teksIndonesia;
    if (isNotNull(this.audio)) {
      data['audio'] = this.audio!.toJson();
    }
    return data;
  }
}
