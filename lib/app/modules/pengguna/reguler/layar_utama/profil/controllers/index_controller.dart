import 'package:get/get.dart';

import '../../../../../../data/local/isar/models/pengguna_model.dart';
import '../../../../../../data/local/isar/repository/akun_repository.dart';
import '../../../../../../data/local/isar/repository/pengguna_repository.dart';
import '../../../../../../data/local/isar/services/auth/sesi_service.dart';

class IndexProfilPenggunaController extends GetxController {
  IndexProfilPenggunaController({
    SesiService? sesiService,
    RepositoriPengguna? repositoriPengguna,
    RepositoriAkun? repositoriAkun,
  })  : _sesiService = sesiService ?? SesiService(),
        _repositoriPengguna = repositoriPengguna ?? RepositoriPengguna(),
        _repositoriAkun = repositoriAkun ?? RepositoriAkun();

  final SesiService _sesiService;
  final RepositoriPengguna _repositoriPengguna;
  final RepositoriAkun _repositoriAkun;

  final isLoading = true.obs;
  final pengguna = Rxn<PenggunaModel>();
  final email = ''.obs;

  @override
  void onInit() {
    super.onInit();
    muatProfil();
  }

  Future<void> refreshData() async {
    try {
      isLoading.value = true;
      await muatProfil();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> muatProfil() async {
    try {
      isLoading.value = true;

      final idPengguna = await _sesiService.penggunaSaatIni();

      final dataPengguna = await _repositoriPengguna.berdasarkanId(idPengguna);

      if (dataPengguna == null) {
        throw Exception("Data pengguna tidak ditemukan.");
      }

      final akun = await _repositoriAkun.berdasarkanIdPengguna(idPengguna);

      pengguna.value = dataPengguna;
      email.value = akun?.email ?? "-";
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> keluar() async {
    await _sesiService.keluar();

    // Get.offAllNamed(Routes.login);
  }
}
