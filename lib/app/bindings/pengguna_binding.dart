import 'package:doclock_app/app/modules/pengguna/reguler/layar_utama/profil/controllers/akun/informasi_pribadi/index_controller.dart';
import 'package:get/get.dart';

import '../../core/navigation/pengguna/main_navigasi_pengguna.dart';
import '../modules/auth/pengguna/daftar/controllers/index_controller.dart';
import '../modules/auth/pengguna/layar_sambutan/halaman_utama/controllers/index_controller.dart';
import '../modules/auth/pengguna/masuk/controllers/index_controller.dart';
import '../modules/pengguna/reguler/kunci_berkas/buka_berkas/controllers/index_controller.dart';
import '../modules/pengguna/reguler/kunci_berkas/kunci_berkas/controllers/index_controller.dart';
import '../modules/pengguna/reguler/layar_utama/aktivitas/controllers/detail_berkas_controller.dart';
import '../modules/pengguna/reguler/layar_utama/aktivitas/controllers/index_controller.dart';
import '../modules/pengguna/reguler/layar_utama/beranda/controllers/index_controller.dart';
import '../modules/pengguna/reguler/layar_utama/profil/controllers/akun/keamanan_akun/index_controller.dart';
import '../modules/pengguna/reguler/layar_utama/profil/controllers/akun/keamanan_akun/ubah_sandi/index_controller.dart';
import '../modules/pengguna/reguler/layar_utama/profil/controllers/index_controller.dart';
import '../modules/pengguna/reguler/layar_utama/profil/controllers/preferensi/bahasa/index_controller.dart';
import '../modules/pengguna/reguler/layar_utama/profil/controllers/preferensi/tema/index_controller.dart';

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
    Get.lazyPut<IndexBerandaController>(
      () => IndexBerandaController(),
      fenix: true,
    );
    Get.lazyPut<IndexHalamanUtamaController>(
      () => IndexHalamanUtamaController(),
      fenix: true,
    );
    Get.lazyPut<MainNavigasiPenggunaController>(
      () => MainNavigasiPenggunaController(),
      fenix: true,
    );
    Get.lazyPut<IndexAktivitasController>(
      () => IndexAktivitasController(),
      fenix: true,
    );
    Get.lazyPut<IndexProfilPenggunaController>(
      () => IndexProfilPenggunaController(),
      fenix: true,
    );

    // Kunci Berkas
    Get.lazyPut<IndexKunciBerkasController>(
      () => IndexKunciBerkasController(),
      fenix: true,
    );
    Get.lazyPut<IndexBukaKunciBerkasController>(
      () => IndexBukaKunciBerkasController(),
      fenix: true,
    );
    Get.lazyPut<DetailBerkasController>(
      () => DetailBerkasController(),
      fenix: true,
    );

    // Profil
    // Akun
    Get.lazyPut<IndexAkunInformasiPribadiController>(
      () => IndexAkunInformasiPribadiController(),
      fenix: true,
    );
    Get.lazyPut<IndexAkunKeamananAkunController>(
      () => IndexAkunKeamananAkunController(),
      fenix: true,
    );
    Get.lazyPut<IndexKeamananAkunUbahSandiController>(
      () => IndexKeamananAkunUbahSandiController(),
      fenix: true,
    );
    // Preferensi
    Get.lazyPut<IndexPreferensiBahasaController>(
      () => IndexPreferensiBahasaController(),
      fenix: true,
    );
    Get.lazyPut<IndexPreferensiTemaController>(
      () => IndexPreferensiTemaController(),
      fenix: true,
    );
    // Bantuan
  }
}
