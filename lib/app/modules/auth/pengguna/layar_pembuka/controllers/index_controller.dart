import 'package:get/get.dart';

import '../../../../../data/local/isar/services/auth/pengguna/auth_service.dart';
import '../../../../../data/services/connection/alert_confirmation.dart';
import '../../../../../data/services/connection/internet_service.dart';
import '../../../../../routes/app_pages.dart';

class LayarPembukaController extends GetxController {
  final AuthServicePengguna _auth = Get.find<AuthServicePengguna>();

  @override
  void onReady() {
    super.onReady();
    _inisialisasi();
  }

  Future<void> _inisialisasi() async {
    await Future.delayed(const Duration(seconds: 2));

    final connected = await InternetService.hasConnection();

    if (!connected) {
      await AppConnectionDialog.noConnection(Get.context!);
      return;
    }

    final valid = await _auth.validasiSesi();

    if (valid) {
      Get.offAllNamed(Routes.mainNavigasiPengguna);
    } else {
      Get.offAllNamed(Routes.indexMasukPengguna);
    }
  }
}
