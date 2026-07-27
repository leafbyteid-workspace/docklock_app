import 'package:isar/isar.dart';

part 'riwayat_berkas_model.g.dart';

enum StatusRiwayatBerkas {
  terkunci,
  terbuka,
}

@collection
class RiwayatBerkasModel {
  Id id = Isar.autoIncrement;

  @Index()
  late int idBerkas;

  @Index()
  late int idPengguna;

  late String judul;

  late String keterangan;

  @enumerated
  StatusRiwayatBerkas statusRiwayatBerkas =
      StatusRiwayatBerkas.terkunci;

  DateTime dibuatPada = DateTime.now();
  DateTime diperbaruiPada = DateTime.now();
}