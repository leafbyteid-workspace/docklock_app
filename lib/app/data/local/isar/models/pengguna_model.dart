import 'package:isar/isar.dart';

part 'pengguna_model.g.dart';

enum JenisKelamin {
  belumDiisi,
  pria,
  wanita,
}

@collection
class PenggunaModel {
  Id id = Isar.autoIncrement;

  @Index()
  int? idPeran;

  @Index(unique: true)
  late String namaPengguna;

  late String namaLengkap;

  int? usia;

  @enumerated
  JenisKelamin jenisKelamin = JenisKelamin.belumDiisi;

  DateTime dibuatPada = DateTime.now();
  DateTime diperbaruiPada = DateTime.now();
  DateTime? dihapusPada;
}

// HELPER
JenisKelamin konversiJenisKelamin(
  String value,
) {
  switch (value.toLowerCase()) {
    case "pria":
      return JenisKelamin.pria;

    case "wanita":
      return JenisKelamin.wanita;

    default:
      return JenisKelamin.belumDiisi;
  }
}
