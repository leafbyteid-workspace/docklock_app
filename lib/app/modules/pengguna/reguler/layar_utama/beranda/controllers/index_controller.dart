import 'package:get/get.dart';

import '../../../../../../data/local/isar/models/riwayat_aktivitas_model.dart';
import '../../../../../../data/local/isar/repository/riwayat_aktivitas_repository.dart';
import '../../../../../../data/local/isar/repository/sesi_repository.dart';

class IndexBerandaController extends GetxController {
  final RepositoriSesi repositoriSesi = RepositoriSesi();

  final RepositoriRiwayatAktivitas repositoriRiwayat =
      RepositoriRiwayatAktivitas();

  final aktivitasTerbaru = <RiwayatAktivitasModel>[].obs;

  final isLoading = true.obs;
  final loadingAktivitas = false.obs;

  @override
  void onReady() {
    super.onReady();
    memuatAktivitas();
  }

  Future<void> refreshData() async {
    try {
      isLoading.value = true;
      await memuatAktivitas();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> memuatAktivitas() async {
    try {
      loadingAktivitas.value = true;

      final sesi = await repositoriSesi.dapatkanSesiAktif();

      if (sesi == null) {
        aktivitasTerbaru.clear();
        return;
      }

      final data = await repositoriRiwayat.terbaru(
        sesi.idAkun,
        limit: 3,
      );

      aktivitasTerbaru.assignAll(data);
    } finally {
      loadingAktivitas.value = false;
    }
  }
}
