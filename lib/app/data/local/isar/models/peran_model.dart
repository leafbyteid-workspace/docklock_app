import 'package:isar/isar.dart';

part 'peran_model.g.dart';

@collection
class PeranModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String namaPeran;

  bool status = true;

  DateTime dibuatPada = DateTime.now();
  DateTime diperbaruiPada = DateTime.now();
  DateTime? dihapusPada;
}
