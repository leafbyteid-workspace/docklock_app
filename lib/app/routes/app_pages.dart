import 'package:get/get.dart';

import '../modules/auth/pengguna/daftar/views/index_view.dart';
import '../modules/auth/pengguna/layar_pembuka/views/index_view.dart';
import '../../core/navigation/pengguna/main_navigasi_pengguna.dart';

import '../bindings/initial_binding.dart';
import '../bindings/pengguna_binding.dart';
import '../modules/auth/pengguna/layar_sambutan/halaman_utama/views/index_view.dart';
import '../modules/auth/pengguna/masuk/views/index_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.mainNavigasiPengguna;

  static final routes = [
    GetPage(
      name: _Paths.indexLayarPembuka,
      page: () => const LayarPembukaView(),
      binding: InitialBinding(),
    ),

    // Pengguna
    // Autentikasi
    GetPage(
      name: _Paths.indexMasukPengguna,
      page: () => const IndexMasukPenggunaView(),
      binding: PenggunaBinding(),
    ),
    GetPage(
      name: _Paths.indexDaftarPengguna,
      page: () => const IndexDaftarPenggunaView(),
      binding: PenggunaBinding(),
    ),
    // Main Pengguna
    GetPage(
      name: _Paths.indexHalamanUtamaPengguna,
      page: () => const IndexHalamanUtamaView(),
      binding: PenggunaBinding(),
    ),
    GetPage(
      name: _Paths.mainNavigasiPengguna,
      page: () => const MainNavigasiPenggunaView(),
      binding: PenggunaBinding(),
    ),
  ];
}
