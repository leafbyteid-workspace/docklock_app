import 'package:isar/isar.dart';

import '../models/berkas_model.dart';
import '../services/main/isar_service.dart';

class RepositoriBerkas {
  RepositoriBerkas({Isar? isar})
      : _isar = isar ?? IsarService.instance.isar;

  final Isar _isar;

  //==========================================================
  // CREATE
  //==========================================================

  Future<int> simpan(BerkasModel berkas) async {
    return await _isar.writeTxn(() async {
      berkas.dibuatPada = DateTime.now();
      berkas.diperbaruiPada = DateTime.now();

      return await _isar.berkasModels.put(berkas);
    });
  }

  //==========================================================
  // UPDATE
  //==========================================================

  Future<void> perbarui(BerkasModel berkas) async {
    await _isar.writeTxn(() async {
      berkas.diperbaruiPada = DateTime.now();

      await _isar.berkasModels.put(berkas);
    });
  }

  //==========================================================
  // DELETE (Soft Delete)
  //==========================================================

  Future<void> hapus(int id) async {
    final data = await getById(id);

    if (data == null) return;

    data.dihapusPada = DateTime.now();

    await perbarui(data);
  }

  //==========================================================
  // DELETE PERMANEN
  //==========================================================

  Future<void> hapusPermanen(int id) async {
    await _isar.writeTxn(() async {
      await _isar.berkasModels.delete(id);
    });
  }

  //==========================================================
  // READ
  //==========================================================

  Future<BerkasModel?> getById(int id) async {
    return await _isar.berkasModels.get(id);
  }

  Future<BerkasModel?> getByKode(String kode) async {
    return await _isar.berkasModels
        .filter()
        .kodeUnikEqualTo(kode)
        .findFirst();
  }

  Future<List<BerkasModel>> getSemua() async {
    return await _isar.berkasModels
        .filter()
        .dihapusPadaIsNull()
        .sortByDibuatPadaDesc()
        .findAll();
  }

  Future<List<BerkasModel>> getByPengguna(
    int idPengguna,
  ) async {
    return await _isar.berkasModels
        .filter()
        .idPenggunaEqualTo(idPengguna)
        .and()
        .dihapusPadaIsNull()
        .sortByDibuatPadaDesc()
        .findAll();
  }

  //==========================================================
  // STATUS
  //==========================================================

  Future<void> ubahStatus(
    int id,
    StatusBerkas status,
  ) async {
    final data = await getById(id);

    if (data == null) return;

    data.statusBerkas = status;

    if (status == StatusBerkas.terkunci) {
      data.waktuTerkunci = DateTime.now();
    } else {
      data.waktuTerbuka = DateTime.now();
    }

    await perbarui(data);
  }

  //==========================================================
  // TOTAL
  //==========================================================

  Future<int> totalBerkas(int idPengguna) async {
    return await _isar.berkasModels
        .filter()
        .idPenggunaEqualTo(idPengguna)
        .and()
        .dihapusPadaIsNull()
        .count();
  }

  Future<int> totalTerkunci(int idPengguna) async {
    return await _isar.berkasModels
        .filter()
        .idPenggunaEqualTo(idPengguna)
        .and()
        .statusBerkasEqualTo(StatusBerkas.terkunci)
        .and()
        .dihapusPadaIsNull()
        .count();
  }

  Future<int> totalTerbuka(int idPengguna) async {
    return await _isar.berkasModels
        .filter()
        .idPenggunaEqualTo(idPengguna)
        .and()
        .statusBerkasEqualTo(StatusBerkas.terbuka)
        .and()
        .dihapusPadaIsNull()
        .count();
  }
}