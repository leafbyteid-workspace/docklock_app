import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../data/local/isar/models/berkas_model.dart';
import '../../../../../../data/local/isar/models/riwayat_berkas_model.dart';
import '../../../../../../data/local/isar/repository/berkas_repository.dart';
import '../../../../../../data/local/isar/repository/riwayat_berkas_repository.dart';
import '../../../../../../data/local/isar/services/auth/sesi_service.dart';

enum FilterAktivitas {
  semua,
  terkunci,
  terbuka,
}

class IndexAktivitasController extends GetxController {
  final RepositoriRiwayatBerkas repositoriRiwayat = RepositoriRiwayatBerkas();
  final RepositoriBerkas repositoriBerkas = RepositoriBerkas();
  final SesiService sesiService = SesiService();

  final searchController = TextEditingController();

  final filter = FilterAktivitas.semua.obs;

  final isLoading = false.obs;

  final daftarRiwayat = <RiwayatBerkasModel>[].obs;

  final daftarBerkas = <int, BerkasModel>{}.obs;

  int? idPengguna;

  @override
  Future<void> onInit() async {
    super.onInit();

    await memuatData();
  }

  Future<void> memuatData() async {
    try {
      isLoading.value = true;

      idPengguna = await sesiService.penggunaSaatIni();

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
    daftarRiwayat.assignAll(hasil);
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

  Future<void> refreshData() async {
    await memuatRiwayat();
  }

  Future<void> cari(String value) async {
    if (idPengguna == null) return;

    if (value.trim().isEmpty) {
      await memuatRiwayat();
      return;
    }

    final hasil = await repositoriRiwayat.cari(
      idPengguna!,
      value,
    );

    daftarRiwayat.assignAll(hasil);

    await memuatBerkas();
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
