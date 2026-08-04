import 'package:isar/isar.dart';

import '../models/riwayat_berkas_model.dart';
import '../services/main/isar_service.dart';

class RepositoriRiwayatBerkas {
  RepositoriRiwayatBerkas({Isar? isar})
      : _isar = isar ?? IsarService.instance.isar;

  final Isar _isar;

  Future<int> tambah({
    required int idBerkas,
    required int idPengguna,
    required String judul,
    required String keterangan,
    required StatusRiwayatBerkas status,
  }) async {
    final data = RiwayatBerkasModel()
      ..idBerkas = idBerkas
      ..idPengguna = idPengguna
      ..judul = judul
      ..keterangan = keterangan
      ..statusRiwayatBerkas = status;

    return simpan(data);
  }

  Future<int> simpan(
    RiwayatBerkasModel data,
  ) async {
    data.diperbaruiPada = DateTime.now();

    return await _isar.writeTxn(
      () async => await _isar.riwayatBerkasModels.put(data),
    );
  }

  Future<RiwayatBerkasModel?> berdasarkanId(
    int id,
  ) async {
    return await _isar.riwayatBerkasModels.get(id);
  }

  Future<List<RiwayatBerkasModel>> berdasarkanBerkas(
    int idBerkas,
  ) async {
    return await _isar.riwayatBerkasModels
        .filter()
        .idBerkasEqualTo(idBerkas)
        .sortByDibuatPadaDesc()
        .findAll();
  }

  Future<List<RiwayatBerkasModel>> berdasarkanPengguna(
    int idPengguna,
  ) async {
    return await _isar.riwayatBerkasModels
        .filter()
        .idPenggunaEqualTo(idPengguna)
        .sortByDibuatPadaDesc()
        .findAll();
  }

  Future<List<RiwayatBerkasModel>> semuaPengguna(
    int idPengguna,
  ) async {
    return await _isar.riwayatBerkasModels
        .filter()
        .idPenggunaEqualTo(idPengguna)
        .sortByDibuatPadaDesc()
        .findAll();
  }

  Future<List<RiwayatBerkasModel>> berdasarkanStatus(
    int idPengguna,
    StatusRiwayatBerkas status,
  ) async {
    return await _isar.riwayatBerkasModels
        .filter()
        .idPenggunaEqualTo(idPengguna)
        .and()
        .statusRiwayatBerkasEqualTo(status)
        .sortByDibuatPadaDesc()
        .findAll();
  }

  Future<List<RiwayatBerkasModel>> cari({
    required int idPengguna,
    required String keyword,
    StatusRiwayatBerkas? filterStatus,
  }) async {
    final kataKunci = keyword.trim().toLowerCase();

    var query =
        _isar.riwayatBerkasModels.filter().idPenggunaEqualTo(idPengguna);

    if (filterStatus != null) {
      query = query.and().statusRiwayatBerkasEqualTo(filterStatus);
    }

    final bool cariStatusTerkunci = "terkunci".contains(kataKunci);

    final bool cariStatusTerbuka = "terbuka".contains(kataKunci);

    query = query.and().group((q) {
      var result = q
          .judulContains(
            kataKunci,
            caseSensitive: false,
          )
          .or()
          .keteranganContains(
            kataKunci,
            caseSensitive: false,
          );

      if (cariStatusTerkunci) {
        result = result.or().statusRiwayatBerkasEqualTo(
              StatusRiwayatBerkas.terkunci,
            );
      }

      if (cariStatusTerbuka) {
        result = result.or().statusRiwayatBerkasEqualTo(
              StatusRiwayatBerkas.terbuka,
            );
      }

      return result;
    });

    return await query.sortByDibuatPadaDesc().findAll();
  }

  Future<bool> hapus(int id) async {
    return await _isar.writeTxn(
      () async => await _isar.riwayatBerkasModels.delete(id),
    );
  }

  Future<void> hapusBerdasarkanPengguna(int idPengguna) async {
    await _isar.writeTxn(() async {
      final data = await _isar.riwayatBerkasModels
          .filter()
          .idPenggunaEqualTo(idPengguna)
          .findAll();

      final ids = data.map((e) => e.id).toList();

      await _isar.riwayatBerkasModels.deleteAll(ids);
    });
  }

  Future<void> hapusSemuaBerkas(
    int idBerkas,
  ) async {
    final data = await berdasarkanBerkas(idBerkas);

    await _isar.writeTxn(() async {
      for (final item in data) {
        await _isar.riwayatBerkasModels.delete(item.id);
      }
    });
  }

  Future<int> jumlahRiwayat(
    int idPengguna,
  ) async {
    return await _isar.riwayatBerkasModels
        .filter()
        .idPenggunaEqualTo(idPengguna)
        .count();
  }
}
