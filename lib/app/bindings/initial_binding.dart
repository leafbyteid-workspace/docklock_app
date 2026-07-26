import 'package:get/get.dart';

import '../modules/auth/pengguna/layar_pembuka/controllers/index_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put<AppwriteDatabaseClient>(
    //   databaseClient,
    //   permanent: true,
    // );

    Get.lazyPut<LayarPembukaController>(
      () => LayarPembukaController(),
      fenix: true,
    );
  }
}
