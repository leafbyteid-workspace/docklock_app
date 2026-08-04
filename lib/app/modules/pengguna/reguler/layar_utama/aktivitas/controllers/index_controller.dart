import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../data/local/isar/models/berkas_model.dart';
import '../../../../../../data/local/isar/models/riwayat_berkas_model.dart';
import '../../../../../../data/local/isar/repository/berkas_repository.dart';
import '../../../../../../data/local/isar/repository/riwayat_berkas_repository.dart';
import '../../../../../../data/local/isar/services/auth/pengguna/auth_service.dart';

enum FilterAktivitas {
  semua,
  terkunci,
  terbuka,
}

class IndexAktivitasController extends GetxController {
  final AuthServicePengguna _layananAutentikasi =
      Get.find<AuthServicePengguna>();

  final RepositoriRiwayatBerkas repositoriRiwayat = RepositoriRiwayatBerkas();
  final RepositoriBerkas repositoriBerkas = RepositoriBerkas();

  final searchController = TextEditingController();

  final filter = FilterAktivitas.semua.obs;

  final isLoading = false.obs;

  final semuaRiwayat = <RiwayatBerkasModel>[].obs;
  final daftarRiwayat = <RiwayatBerkasModel>[].obs;
  final daftarBerkas = <int, BerkasModel>{}.obs;

  // Paginasi
  static const int _limitPerPage = 5;
  final halaman = 1.obs;
  final bisaLoadLagi = false.obs;

  int? idPengguna;

  @override
  Future<void> onInit() async {
    super.onInit();

    await memuatData();
  }

  Future<void> refreshData() async {
    await memuatRiwayat();
  }

  void _refreshPagination() {
    final total = semuaRiwayat.length;

    final jumlah = halaman.value * _limitPerPage;

    if (jumlah >= total) {
      daftarRiwayat.assignAll(semuaRiwayat);
      bisaLoadLagi.value = false;
    } else {
      daftarRiwayat.assignAll(
        semuaRiwayat.take(jumlah).toList(),
      );

      bisaLoadLagi.value = true;
    }
  }

  void loadMore() {
    if (!bisaLoadLagi.value) return;

    halaman.value++;

    _refreshPagination();
  }

  Future<void> memuatData() async {
    try {
      isLoading.value = true;
      idPengguna = await _layananAutentikasi.penggunaSaatIni();
      await memuatRiwayat();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> memuatRiwayat() async {
    if (idPengguna == null) return;

    List<RiwayatBerkasModel> hasil = [];

    switch (filter.value) {
      case FilterAktivitas.semua:
        hasil = await repositoriRiwayat.semuaPengguna(idPengguna!);
        break;

      case FilterAktivitas.terkunci:
        hasil = await repositoriRiwayat.berdasarkanStatus(
          idPengguna!,
          StatusRiwayatBerkas.terkunci,
        );
        break;

      case FilterAktivitas.terbuka:
        hasil = await repositoriRiwayat.berdasarkanStatus(
          idPengguna!,
          StatusRiwayatBerkas.terbuka,
        );
        break;
    }

    final Map<int, BerkasModel> cache = {};

    for (final item in hasil) {
      final berkas = await repositoriBerkas.berdasarkanId(item.idBerkas);

      if (berkas != null) {
        cache[item.idBerkas] = berkas;
      }
    }

    daftarBerkas.assignAll(cache);
    semuaRiwayat.assignAll(hasil);
    halaman.value = 1;
    _refreshPagination();
  }

  Future<void> memuatBerkas() async {
    daftarBerkas.clear();

    for (final item in daftarRiwayat) {
      final berkas = await repositoriBerkas.berdasarkanId(
        item.idBerkas,
      );

      if (berkas != null) {
        daftarBerkas[item.idBerkas] = berkas;
      }
    }
  }

  Future<void> ubahFilter(
    FilterAktivitas value,
  ) async {
    if (filter.value == value) return;

    filter.value = value;

    await memuatRiwayat();
  }

  Future<void> cari(String keyword) async {
    final key = keyword.trim().toLowerCase();

    if (key.isEmpty) {
      halaman.value = 1;
      _refreshPagination();
      return;
    }

    final hasil = semuaRiwayat.where((item) {
      final berkas = daftarBerkas[item.idBerkas];

      final namaFile = berkas?.namaBerkasAsli.toLowerCase() ?? "";

      final judul = item.judul.toLowerCase();

      final keterangan = item.keterangan.toLowerCase();

      final status = item.statusRiwayatBerkas.name.toLowerCase();

      return namaFile.contains(key) ||
          judul.contains(key) ||
          keterangan.contains(key) ||
          status.contains(key);
    }).toList();

    halaman.value = 1;

    const jumlah = _limitPerPage;

    if (hasil.length <= jumlah) {
      daftarRiwayat.assignAll(hasil);
      bisaLoadLagi.value = false;
    } else {
      daftarRiwayat.assignAll(
        hasil.take(jumlah).toList(),
      );

      bisaLoadLagi.value = true;
    }
  }

  BerkasModel? ambilBerkas(
    int idBerkas,
  ) {
    return daftarBerkas[idBerkas];
  }

  @override
  void onClose() {
    searchController.dispose();

    super.onClose();
  }
}
