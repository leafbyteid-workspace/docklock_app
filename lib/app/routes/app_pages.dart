import 'package:get/get.dart';

import '../data/local/isar/services/auth/pengguna/auth_guard.dart';
import '../modules/auth/pengguna/daftar/views/index_view.dart';
import '../modules/auth/pengguna/layar_pembuka/views/index_view.dart';
import '../../core/navigation/pengguna/main_navigasi_pengguna.dart';

import '../bindings/initial_binding.dart';
import '../bindings/pengguna_binding.dart';
import '../modules/auth/pengguna/layar_sambutan/halaman_utama/views/index_view.dart';
import '../modules/auth/pengguna/masuk/views/index_view.dart';
import '../modules/pengguna/reguler/kunci_berkas/buka_berkas/views/index_view.dart';
import '../modules/pengguna/reguler/kunci_berkas/kunci_berkas/views/index_view.dart';
import '../modules/pengguna/reguler/layar_utama/aktivitas/views/detail_berkas_view.dart';
import '../modules/pengguna/reguler/layar_utama/profil/views/akun/informasi_pribadi/index_view.dart';
import '../modules/pengguna/reguler/layar_utama/profil/views/akun/keamanan_akun/index_view.dart';
import '../modules/pengguna/reguler/layar_utama/profil/views/akun/keamanan_akun/ubah_sandi/index_view.dart';
import '../modules/pengguna/reguler/layar_utama/profil/views/bantuan/kebijakan_privasi/index_view.dart';
import '../modules/pengguna/reguler/layar_utama/profil/views/bantuan/syarat_dan_ketentuan/index_view.dart';
import '../modules/pengguna/reguler/layar_utama/profil/views/bantuan/tentang_aplikasi/index_view.dart';
import '../modules/pengguna/reguler/layar_utama/profil/views/preferensi/bahasa/index_view.dart';
import '../modules/pengguna/reguler/layar_utama/profil/views/preferensi/tema/index_view.dart';

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
      middlewares: [
        AuthGuardPengguna(),
      ],
    ),
    GetPage(
      name: _Paths.mainNavigasiPengguna,
      page: () => const MainNavigasiPenggunaView(),
      binding: PenggunaBinding(),
      middlewares: [
        AuthGuardPengguna(),
      ],
    ),
    // Kunci Berkas
    GetPage(
      name: _Paths.indexKunciBerkas,
      page: () => const IndexKunciBerkasView(),
      binding: PenggunaBinding(),
      middlewares: [
        AuthGuardPengguna(),
      ],
    ),
    GetPage(
      name: _Paths.indexBukaKunciBerkas,
      page: () => const IndexBukaKunciBerkasView(),
      binding: PenggunaBinding(),
      middlewares: [
        AuthGuardPengguna(),
      ],
    ),
    GetPage(
      name: _Paths.detailBerkas,
      page: () => const DetailBerkasView(),
      binding: PenggunaBinding(),
      middlewares: [
        AuthGuardPengguna(),
      ],
    ),

    // Profil
    // Akun
    GetPage(
      name: _Paths.indexAkunInformasiPribadi,
      page: () => const IndexAkunInformasiPribadiView(),
      binding: PenggunaBinding(),
      middlewares: [
        AuthGuardPengguna(),
      ],
    ),
    GetPage(
      name: _Paths.indexAkunKeamananAkun,
      page: () => const IndexAkunKeamananAkunView(),
      binding: PenggunaBinding(),
      middlewares: [
        AuthGuardPengguna(),
      ],
    ),

    // Ubah Sandi
    GetPage(
      name: _Paths.indexKeamananAkunUbahSandi,
      page: () => const IndexKeamananAkunUbahSandiView(),
      binding: PenggunaBinding(),
      middlewares: [
        AuthGuardPengguna(),
      ],
    ),

    // Preferensi
    GetPage(
      name: _Paths.indexPreferensiBahasa,
      page: () => const IndexPreferensiBahasaView(),
      binding: PenggunaBinding(),
      middlewares: [
        AuthGuardPengguna(),
      ],
    ),
    GetPage(
      name: _Paths.indexPreferensiTema,
      page: () => const IndexPreferensiTemaView(),
      binding: PenggunaBinding(),
      middlewares: [
        AuthGuardPengguna(),
      ],
    ),

    // Bantuan
    GetPage(
      name: _Paths.indexKebijakanPrivasi,
      page: () => const IndexKebijakanPrivasiView(),
      binding: PenggunaBinding(),
      middlewares: [
        AuthGuardPengguna(),
      ],
    ),
    GetPage(
      name: _Paths.indexSyaratdanKetentuan,
      page: () => const IndexSyaratdanKetentuanView(),
      binding: PenggunaBinding(),
      middlewares: [
        AuthGuardPengguna(),
      ],
    ),
    GetPage(
      name: _Paths.indexTentangAplikasi,
      page: () => const IndexTentangAplikasiView(),
      binding: PenggunaBinding(),
      middlewares: [
        AuthGuardPengguna(),
      ],
    ),
  ];
}
