import 'package:isar/isar.dart';

part 'berkas_model.g.dart';

enum StatusBerkas {
  terkunci,
  terbuka,
}

@collection
class BerkasModel {
  Id id = Isar.autoIncrement;

  @Index()
  late int idPengguna;

  @Index(unique: true)
  late String kodeUnik;

  late String namaBerkasAsli;

  late String namaBerkasEnkripsi;

  late String lokasiBerkas;

  late int ukuranBerkas;

  late String ekstensiBerkas;

  @enumerated
  StatusBerkas statusBerkas = StatusBerkas.terkunci;

  DateTime? waktuTerkunci;

  DateTime? waktuTerbuka;

  DateTime dibuatPada = DateTime.now();
  DateTime diperbaruiPada = DateTime.now();
  DateTime? dihapusPada;
}