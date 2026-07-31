import 'package:get/get.dart';

import '../../../../../../data/local/isar/models/riwayat_aktivitas_model.dart';
import '../../../../../../data/local/isar/models/riwayat_berkas_model.dart';
import '../../../../../../data/local/isar/repository/riwayat_aktivitas_repository.dart';
import '../../../../../../data/local/isar/repository/riwayat_berkas_repository.dart';
import '../../../../../../data/local/isar/services/auth/pengguna/auth_service.dart';

class IndexBerandaController extends GetxController {
  final AuthServicePengguna _layananAutentikasi =
      Get.find<AuthServicePengguna>();

  final RepositoriRiwayatAktivitas repositoriRiwayat =
      RepositoriRiwayatAktivitas();
  final RepositoriRiwayatBerkas repositoriRiwayatBerkas =
      RepositoriRiwayatBerkas();

  final aktivitasTerbaru = <RiwayatAktivitasModel>[].obs;
  final totalDokumen = 0.obs;
  final totalEnkripsi = 0.obs;
  final totalDekripsi = 0.obs;

  final isLoading = true.obs;
  final loadingAktivitas = false.obs;

  @override
  void onReady() {
    super.onReady();
    refreshData();
  }

  Future<void> refreshData() async {
    try {
      isLoading.value = true;

      await Future.wait([
        memuatAktivitas(),
        hitungRingkasan(),
      ]);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> memuatAktivitas() async {
    try {
      loadingAktivitas.value = true;

      final idPengguna = await _layananAutentikasi.sesiSaatIni();

      if (idPengguna == null) {
        aktivitasTerbaru.clear();
        return;
      }

      final data = await repositoriRiwayat.terbaru(
        idPengguna.idAkun,
        limit: 3,
      );

      aktivitasTerbaru.assignAll(data);
    } finally {
      loadingAktivitas.value = false;
    }
  }

  Future<void> hitungRingkasan() async {
    final idPengguna = await _layananAutentikasi.sesiSaatIni();

    if (idPengguna == null) {
      totalDokumen.value = 0;
      totalEnkripsi.value = 0;
      totalDekripsi.value = 0;
      return;
    }

    final List<RiwayatBerkasModel> riwayat =
        await repositoriRiwayatBerkas.semuaPengguna(
      idPengguna.idAkun,
    );

    final dokumenUnik = riwayat.map((e) => e.idBerkas).toSet();

    totalDokumen.value = dokumenUnik.length;

    totalEnkripsi.value = riwayat
        .where(
          (e) => e.statusRiwayatBerkas == StatusRiwayatBerkas.terkunci,
        )
        .length;

    totalDekripsi.value = riwayat
        .where(
          (e) => e.statusRiwayatBerkas == StatusRiwayatBerkas.terbuka,
        )
        .length;
  }
}
