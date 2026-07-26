import 'package:get/get.dart';

import '../../core/navigation/pengguna/main_navigasi_pengguna.dart';
import '../modules/auth/pengguna/daftar/controllers/index_controller.dart';
import '../modules/auth/pengguna/layar_sambutan/halaman_utama/controllers/index_controller.dart';
import '../modules/auth/pengguna/masuk/controllers/index_controller.dart';

class PenggunaBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put<AppwriteDatabaseClient>(
    //   databaseClient,
    //   permanent: true,
    // );

    // Autentikasi
    Get.lazyPut<IndexMasukPenggunaController>(
      () => IndexMasukPenggunaController(),
      fenix: true,
    );
    Get.lazyPut<IndexDaftarPenggunaController>(
      () => IndexDaftarPenggunaController(),
      fenix: true,
    );

    // Main Pengguna
    Get.lazyPut<IndexHalamanUtamaController>(
      () => IndexHalamanUtamaController(),
      fenix: true,
    );
    Get.lazyPut<MainNavigasiPenggunaController>(
      () => MainNavigasiPenggunaController(),
      fenix: true,
    );
  }
}
