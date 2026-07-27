import 'package:isar/isar.dart';

import '../models/pengguna_model.dart';
import '../services/main/isar_service.dart';

class RepositoriPengguna {
  RepositoriPengguna({Isar? isar}) : _isar = isar ?? IsarService.instance.isar;

  final Isar _isar;

  Future<int> tambahPengguna({
    required String namaLengkap,
    required String namaPengguna,
  }) async {
    final pengguna = PenggunaModel()
      ..namaLengkap = namaLengkap
      ..namaPengguna = namaPengguna;
    return await simpan(pengguna);
  }

  Future<int> simpan(PenggunaModel pengguna) async {
    pengguna.diperbaruiPada = DateTime.now();
    return await _isar.penggunaModels.put(pengguna);
  }

  Future<PenggunaModel?> berdasarkanId(int id) {
    return _isar.penggunaModels.get(id);
  }

  Future<PenggunaModel?> berdasarkanNamaPengguna(
    String namaPengguna,
  ) {
    return _isar.penggunaModels
        .filter()
        .namaPenggunaEqualTo(namaPengguna)
        .findFirst();
  }

  Future<List<PenggunaModel>> semua() {
    return _isar.penggunaModels.where().findAll();
  }

  Future<bool> namaPenggunaSudahDigunakan(
    String namaPengguna,
  ) async {
    return await berdasarkanNamaPengguna(
          namaPengguna,
        ) !=
        null;
  }

  Future<void> hapus(int id) async {
    await _isar.writeTxn(() async {
      await _isar.penggunaModels.delete(id);
    });
  }

  Future<void> tandaiDihapus(int id) async {
    final pengguna = await berdasarkanId(id);

    if (pengguna == null) return;

    pengguna.dihapusPada = DateTime.now();
    pengguna.diperbaruiPada = DateTime.now();

    await simpan(pengguna);
  }

  Future<void> ubahData({
    required int id,
    String? namaLengkap,
    String? namaPengguna,
    int? usia,
    JenisKelamin? jenisKelamin,
    int? idPeran,
  }) async {
    final pengguna = await berdasarkanId(id);

    if (pengguna == null) {
      throw Exception("Pengguna tidak ditemukan.");
    }

    if (namaLengkap != null) {
      pengguna.namaLengkap = namaLengkap;
    }

    if (namaPengguna != null) {
      pengguna.namaPengguna = namaPengguna;
    }

    if (usia != null) {
      pengguna.usia = usia;
    }

    if (jenisKelamin != null) {
      pengguna.jenisKelamin = jenisKelamin;
    }

    if (idPeran != null) {
      pengguna.idPeran = idPeran;
    }

    pengguna.diperbaruiPada = DateTime.now();

    await simpan(pengguna);
  }

  Future<List<PenggunaModel>> cari(String keyword) {
    return _isar.penggunaModels
        .filter()
        .namaLengkapContains(keyword, caseSensitive: false)
        .or()
        .namaPenggunaContains(keyword, caseSensitive: false)
        .findAll();
  }

  Future<int> jumlahPengguna() async {
    return await _isar.penggunaModels.count();
  }
}
