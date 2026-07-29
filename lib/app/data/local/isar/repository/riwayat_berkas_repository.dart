import 'package:isar/isar.dart';

import '../models/riwayat_berkas_model.dart';
import '../services/main/isar_service.dart';

class RepositoriRiwayatBerkas {
  RepositoriRiwayatBerkas({Isar? isar})
      : _isar = isar ?? IsarService.instance.isar;

  final Isar _isar;

  //==========================================================
  // CREATE
  //==========================================================

  Future<int> simpan(
    RiwayatBerkasModel riwayat,
  ) async {
    return await _isar.writeTxn(() async {
      riwayat.dibuatPada = DateTime.now();
      riwayat.diperbaruiPada = DateTime.now();

      return await _isar.riwayatBerkasModels.put(riwayat);
    });
  }

  //==========================================================
  // UPDATE
  //==========================================================

  Future<void> perbarui(
    RiwayatBerkasModel riwayat,
  ) async {
    await _isar.writeTxn(() async {
      riwayat.diperbaruiPada = DateTime.now();

      await _isar.riwayatBerkasModels.put(riwayat);
    });
  }

  //==========================================================
  // GET BY ID
  //==========================================================

  Future<RiwayatBerkasModel?> getById(
    int id,
  ) async {
    return await _isar.riwayatBerkasModels.get(id);
  }

  //==========================================================
  // GET BY BERKAS
  //==========================================================

  Future<List<RiwayatBerkasModel>> getByBerkas(
    int idBerkas,
  ) async {
    return await _isar.riwayatBerkasModels
        .filter()
        .idBerkasEqualTo(idBerkas)
        .sortByDibuatPadaDesc()
        .findAll();
  }

  //==========================================================
  // GET BY USER
  //==========================================================

  Future<List<RiwayatBerkasModel>> getByPengguna(
    int idPengguna,
  ) async {
    return await _isar.riwayatBerkasModels
        .filter()
        .idPenggunaEqualTo(idPengguna)
        .sortByDibuatPadaDesc()
        .findAll();
  }

  //==========================================================
  // GET ALL
  //==========================================================

  Future<List<RiwayatBerkasModel>> getSemua() async {
    return await _isar.riwayatBerkasModels
        .where()
        .sortByDibuatPadaDesc()
        .findAll();
  }

  //==========================================================
  // DELETE
  //==========================================================

  Future<void> hapus(int id) async {
    await _isar.writeTxn(() async {
      await _isar.riwayatBerkasModels.delete(id);
    });
  }

  //==========================================================
  // CLEAR
  //==========================================================

  Future<void> hapusSemua() async {
    await _isar.writeTxn(() async {
      await _isar.riwayatBerkasModels.clear();
    });
  }
}