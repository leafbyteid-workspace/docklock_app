import 'package:isar/isar.dart';

part 'akun_model.g.dart';

@collection
class AkunModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  int? idPengguna;

  @Index(unique: true)
  late String email;

  late String kataSandi;

  DateTime dibuatPada = DateTime.now();
  DateTime diperbaruiPada = DateTime.now();
  DateTime? dihapusPada;
}
