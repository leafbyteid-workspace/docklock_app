import 'package:isar/isar.dart';

import '../models/riwayat_aktivitas_model.dart';
import '../services/main/isar_service.dart';

class RepositoriRiwayatAktivitas {
  RepositoriRiwayatAktivitas({Isar? isar})
      : _isar = isar ?? IsarService.instance.isar;

  final Isar _isar;

  Future<void> tambah({
    required int idAkun,
    required String judulAktivitas,
    required String deskripsi,
    required String alamatIp,
    required String namaPerangkat,
    StatusAktivitas status = StatusAktivitas.berhasil,
  }) async {
    final riwayat = await _isar.riwayatAktivitasModels
        .filter()
        .idAkunEqualTo(idAkun)
        .sortByDibuatPada()
        .findAll();

    await _isar.writeTxn(() async {
      if (riwayat.length >= 5) {
        await _isar.riwayatAktivitasModels.delete(riwayat.first.id);
      }
      final data = RiwayatAktivitasModel()
        ..idAkun = idAkun
        ..judulAktivitas = judulAktivitas
        ..deskripsi = deskripsi
        ..alamatIp = alamatIp
        ..namaPerangkat = namaPerangkat
        ..statusAktivitas = status
        ..dibuatPada = DateTime.now();

      await _isar.riwayatAktivitasModels.put(data);
    });
  }

  Future<List<RiwayatAktivitasModel>> terbaru(
    int idAkun, {
    int limit = 3,
  }) {
    return _isar.riwayatAktivitasModels
        .filter()
        .idAkunEqualTo(idAkun)
        .sortByDibuatPadaDesc()
        .limit(limit)
        .findAll();
  }

  Future<void> hapusSemua(int idAkun) async {
    final data = await _isar.riwayatAktivitasModels
        .filter()
        .idAkunEqualTo(idAkun)
        .findAll();

    await _isar.writeTxn(() async {
      for (final item in data) {
        await _isar.riwayatAktivitasModels.delete(item.id);
      }
    });
  }
}
