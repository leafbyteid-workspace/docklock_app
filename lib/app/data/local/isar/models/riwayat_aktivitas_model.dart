import 'package:isar/isar.dart';

part 'riwayat_aktivitas_model.g.dart';

enum StatusAktivitas {
  berhasil,
  gagal,
}

@collection
class RiwayatAktivitasModel {
  Id id = Isar.autoIncrement;

  @Index()
  late int idAkun;

  late String judulAktivitas;

  late String deskripsi;

  @enumerated
  StatusAktivitas statusAktivitas = StatusAktivitas.berhasil;

  late String alamatIp;

  late String namaPerangkat;

  DateTime dibuatPada = DateTime.now();
}