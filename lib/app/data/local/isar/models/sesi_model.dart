import 'package:isar/isar.dart';

part 'sesi_model.g.dart';

enum StatusSesi {
  aktif,
  kedaluwarsa,
  keluar,
}

@collection
class SesiModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late int idAkun;

  String? tokenAkses;
  String? tokenPemulihan;

  DateTime? tokenAksesAkhir;
  DateTime? tokenPemulihanAkhir;

  @enumerated
  StatusSesi status = StatusSesi.keluar;

  bool sedangMasuk = false;

  DateTime dibuatPada = DateTime.now();
  DateTime diPerbaruiPada = DateTime.now();
  DateTime terakhirAktifPada = DateTime.now();
  DateTime? masukTerakhirPada;
  DateTime? keluarPada;
}
