import 'package:get/get.dart';

import '../modules/auth/pengguna/layar_pembuka/controllers/index_controller.dart';

class LayarPembukaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LayarPembukaController>(
      () => LayarPembukaController(),
    );
  }
}
