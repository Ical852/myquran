import 'package:myquran/functions/global_func.dart';

class GetTafsirSurahResponseModel {
  int? code;
  String? message;
  Data? data;

  GetTafsirSurahResponseModel({
    this.code,
    this.message,
    this.data
  });

  GetTafsirSurahResponseModel.fromJson(Map<String, dynamic> json) {
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
  List<Tafsir>? tafsir;
  SuratSelanjutnya? suratSelanjutnya;
  bool? suratSebelumnya;

  Data({
    this.nomor,
    this.nama,
    this.namaLatin,
    this.jumlahAyat,
    this.tempatTurun,
    this.arti,
    this.deskripsi,
    this.audioFull,
    this.tafsir,
    this.suratSelanjutnya,
    this.suratSebelumnya
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
    if (isNotNull(json['tafsir'])) {
      tafsir = <Tafsir>[];
      json['tafsir'].forEach((v) {
        tafsir!.add(new Tafsir.fromJson(v));
      });
    }
    suratSelanjutnya = isNotNull(json['suratSelanjutnya'])
      ? new SuratSelanjutnya.fromJson(json['suratSelanjutnya'])
      : null;
    suratSebelumnya = json['suratSebelumnya'];
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
    if (isNotNull(this.tafsir)) {
      data['tafsir'] = this.tafsir!.map((v) => v.toJson()).toList();
    }
    if (isNotNull(this.suratSelanjutnya)) {
      data['suratSelanjutnya'] = this.suratSelanjutnya!.toJson();
    }
    data['suratSebelumnya'] = this.suratSebelumnya;
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
}

class Tafsir {
  int? ayat;
  String? teks;

  Tafsir({this.ayat, this.teks});

  Tafsir.fromJson(Map<String, dynamic> json) {
    ayat = json['ayat'];
    teks = json['teks'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ayat'] = this.ayat;
    data['teks'] = this.teks;
    return data;
  }
}

class SuratSelanjutnya {
  int? nomor;
  String? nama;
  String? namaLatin;
  int? jumlahAyat;

  SuratSelanjutnya({
    this.nomor,
    this.nama,
    this.namaLatin,
    this.jumlahAyat
  });

  SuratSelanjutnya.fromJson(Map<String, dynamic> json) {
    nomor = json['nomor'];
    nama = json['nama'];
    namaLatin = json['namaLatin'];
    jumlahAyat = json['jumlahAyat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nomor'] = this.nomor;
    data['nama'] = this.nama;
    data['namaLatin'] = this.namaLatin;
    data['jumlahAyat'] = this.jumlahAyat;
    return data;
  }
}