import 'package:get/get.dart';

import '../../../../../../routes/app_pages.dart';
import '../../../models/sesi_model.dart';
import '../sesi_service.dart';

class AuthServicePengguna extends GetxService {
  AuthServicePengguna({
    SesiService? sesiService,
  }) : _sesiService = sesiService ?? SesiService();

  final SesiService _sesiService;

  final RxBool authenticated = false.obs;

  Future<AuthServicePengguna> init() async {
    authenticated.value = await _sesiService.autentikasi();
    return this;
  }

  Future<bool> cek() async {
    authenticated.value = await _sesiService.autentikasi();
    return authenticated.value;
  }

  Future<bool> validasiSesi() async {
    try {
      final token = await _sesiService.dapatkanTokenAkses();

      authenticated.value = token != null;

      return authenticated.value;
    } catch (_) {
      authenticated.value = false;
      return false;
    }
  }

  Future<SesiModel?> sesiSaatIni() {
    return _sesiService.sesiSaatIni();
  }

  Future<void> cekSesiDanRedirect() async {
    final valid = await validasiSesi();

    if (valid) {
      if (Get.currentRoute != Routes.mainNavigasiPengguna) {
        Get.offAllNamed(Routes.mainNavigasiPengguna);
      }
    } else {
      await keluar();

      if (Get.currentRoute != Routes.indexMasukPengguna) {
        Get.offAllNamed(Routes.indexMasukPengguna);
      }
    }
  }

  Future<void> masuk({
    required int idAkun,
  }) async {
    await _sesiService.masuk(idAkun: idAkun);

    authenticated.value = true;
  }

  Future<void> keluar() async {
    await _sesiService.keluar();

    authenticated.value = false;

    Get.offAllNamed(Routes.indexMasukPengguna);
  }

  Future<int> penggunaSaatIni() {
    return _sesiService.penggunaSaatIni();
  }

  Future<int?> idAkunSaatIni() {
    return _sesiService.idAkunSaatIni();
  }

  Future<String?> tokenAkses() {
    return _sesiService.dapatkanTokenAkses();
  }
}
