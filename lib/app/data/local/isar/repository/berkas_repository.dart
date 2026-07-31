import 'package:isar/isar.dart';

import '../models/berkas_model.dart';
import '../models/riwayat_berkas_model.dart';
import '../services/main/isar_service.dart';

class RepositoriBerkas {
  RepositoriBerkas({Isar? isar}) : _isar = isar ?? IsarService.instance.isar;

  final Isar _isar;

  Future<int> tambahBerkas({
    required int idPengguna,
    required String kodeUnik,
    required String namaBerkasAsli,
    required String namaBerkasEnkripsi,
    required int ukuranBerkas,
    required String ekstensiBerkas,
    StatusBerkas status = StatusBerkas.terkunci,
    DateTime? waktuTerkunci,
    DateTime? waktuTerbuka,
  }) async {
    final data = BerkasModel()
      ..idPengguna = idPengguna
      ..kodeUnik = kodeUnik
      ..namaBerkasAsli = namaBerkasAsli
      ..namaBerkasEnkripsi = namaBerkasEnkripsi
      ..ukuranBerkas = ukuranBerkas
      ..ekstensiBerkas = ekstensiBerkas
      ..statusBerkas = status
      ..waktuTerkunci = waktuTerkunci
      ..waktuTerbuka = waktuTerbuka;

    return simpan(data);
  }

  Future<int> simpanHasilDekripsi({
    required int idPengguna,
    required String kodeUnik,
    required String namaBerkasAsli,
    required String namaBerkasEnkripsi,
    required int ukuranBerkas,
    required String ekstensiBerkas,
    required String judulRiwayat,
    required String keteranganRiwayat,
  }) async {
    return await _isar.writeTxn(() async {
      BerkasModel? berkas = await _isar.berkasModels
          .filter()
          .kodeUnikEqualTo(kodeUnik)
          .findFirst();

      if (berkas == null) {
        berkas = BerkasModel()
          ..idPengguna = idPengguna
          ..kodeUnik = kodeUnik
          ..namaBerkasAsli = namaBerkasAsli
          ..namaBerkasEnkripsi = namaBerkasEnkripsi
          ..ukuranBerkas = ukuranBerkas
          ..ekstensiBerkas = ekstensiBerkas
          ..statusBerkas = StatusBerkas.terbuka
          ..waktuTerbuka = DateTime.now();

        final idBaru = await _isar.berkasModels.put(berkas);

        final riwayat = RiwayatBerkasModel()
          ..idBerkas = idBaru
          ..idPengguna = idPengguna
          ..judul = judulRiwayat
          ..keterangan = keteranganRiwayat
          ..statusRiwayatBerkas = StatusRiwayatBerkas.terbuka;

        await _isar.riwayatBerkasModels.put(riwayat);

        return idBaru;
      }

      berkas
        ..statusBerkas = StatusBerkas.terbuka
        ..waktuTerbuka = DateTime.now()
        ..diperbaruiPada = DateTime.now();

      await _isar.berkasModels.put(berkas);

      final riwayat = RiwayatBerkasModel()
        ..idBerkas = berkas.id
        ..idPengguna = berkas.idPengguna
        ..judul = judulRiwayat
        ..keterangan = keteranganRiwayat
        ..statusRiwayatBerkas = StatusRiwayatBerkas.terbuka;

      await _isar.riwayatBerkasModels.put(riwayat);

      return berkas.id;
    });
  }

  Future<int> simpan(BerkasModel data) async {
    data.diperbaruiPada = DateTime.now();

    return await _isar.writeTxn(
      () async => await _isar.berkasModels.put(data),
    );
  }

  Future<BerkasModel?> berdasarkanId(int id) async {
    return await _isar.berkasModels.get(id);
  }

  Future<BerkasModel?> berdasarkanKode(String kode) async {
    return await _isar.berkasModels.filter().kodeUnikEqualTo(kode).findFirst();
  }

  Future<List<BerkasModel>> semuaBerkasPengguna(
    int idPengguna,
  ) async {
    return await _isar.berkasModels
        .filter()
        .idPenggunaEqualTo(idPengguna)
        .dihapusPadaIsNull()
        .sortByDibuatPadaDesc()
        .findAll();
  }

  Future<List<BerkasModel>> semua() async {
    return await _isar.berkasModels
        .filter()
        .dihapusPadaIsNull()
        .sortByDibuatPadaDesc()
        .findAll();
  }

  Future<void> ubahStatus({
    required int idBerkas,
    required StatusBerkas status,
  }) async {
    final data = await berdasarkanId(idBerkas);

    if (data == null) return;

    data.statusBerkas = status;
    data.diperbaruiPada = DateTime.now();

    if (status == StatusBerkas.terkunci) {
      data.waktuTerkunci = DateTime.now();
    } else {
      data.waktuTerbuka = DateTime.now();
    }

    await simpan(data);
  }

  Future<void> hapus(int id) async {
    final data = await berdasarkanId(id);

    if (data == null) return;

    data.dihapusPada = DateTime.now();

    await simpan(data);
  }

  Future<bool> hapusPermanent(int id) async {
    return await _isar.writeTxn(
      () async => await _isar.berkasModels.delete(id),
    );
  }

  Future<int> jumlahBerkas(int idPengguna) async {
    return await _isar.berkasModels
        .filter()
        .idPenggunaEqualTo(idPengguna)
        .dihapusPadaIsNull()
        .count();
  }
}
