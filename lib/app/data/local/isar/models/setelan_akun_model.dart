import 'package:isar/isar.dart';

part 'setelan_akun_model.g.dart';

enum TemaAplikasi {
  sistem,
  terang,
  gelap,
}

@collection
class SetelanAkunModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late int idAkun;

  @enumerated
  TemaAplikasi tema = TemaAplikasi.sistem;

  late String bahasa;

  DateTime dibuatPada = DateTime.now();
  DateTime diperbaruiPada = DateTime.now();
  DateTime? dihapusPada;
}