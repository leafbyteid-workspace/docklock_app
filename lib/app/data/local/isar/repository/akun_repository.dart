import 'package:isar/isar.dart';

import '../models/akun_model.dart';
import '../services/main/isar_service.dart';

class RepositoriAkun {
  RepositoriAkun({Isar? isar}) : _isar = isar ?? IsarService.instance.isar;

  final Isar _isar;

  Future<int> tambahAkun({
    required int idPengguna,
    required String email,
    required String kataSandi,
  }) async {
    final akun = AkunModel()
      ..idPengguna = idPengguna
      ..email = email
      ..kataSandi = kataSandi;

    return await simpan(akun);
  }

  Future<int> simpan(AkunModel akun) async {
    return await _isar.writeTxn(() async {
      akun.diperbaruiPada = DateTime.now();
      return await _isar.akunModels.put(akun);
    });
  }

  Future<AkunModel?> berdasarkanId(int id) {
    return _isar.akunModels.get(id);
  }

  Future<AkunModel?> berdasarkanEmail(String email) {
    return _isar.akunModels.filter().emailEqualTo(email).findFirst();
  }

  Future<AkunModel?> berdasarkanIdPengguna(int idPengguna) {
    return _isar.akunModels.filter().idPenggunaEqualTo(idPengguna).findFirst();
  }

  Future<bool> emailSudahDigunakan(String email) async {
    return await berdasarkanEmail(email) != null;
  }

  Future<List<AkunModel>> semua() {
    return _isar.akunModels.where().findAll();
  }

  Future<void> hapus(int id) async {
    await _isar.writeTxn(() async {
      await _isar.akunModels.delete(id);
    });
  }

  Future<void> tandaiDihapus(int id) async {
    final akun = await berdasarkanId(id);

    if (akun == null) return;

    akun.dihapusPada = DateTime.now();
    akun.diperbaruiPada = DateTime.now();

    await simpan(akun);
  }

  Future<void> ubahKataSandi({
    required int id,
    required String passwordBaru,
  }) async {
    await _isar.writeTxn(() async {
      final akun = await _isar.akunModels.get(id);

      if (akun == null) {
        throw Exception("Akun tidak ditemukan.");
      }

      akun.kataSandi = passwordBaru;
      akun.diperbaruiPada = DateTime.now();

      await _isar.akunModels.put(akun);
    });
  }
}
