import 'package:get/get.dart';

import '../../../../../../../../../core/theme/app_theme_service.dart';
import '../../../../../../../../../localization/localization_service.dart';
import '../../../../../../../../data/local/isar/repository/akun_repository.dart';
import '../../../../../../../../data/local/isar/repository/berkas_repository.dart';
import '../../../../../../../../data/local/isar/repository/pengguna_repository.dart';
import '../../../../../../../../data/local/isar/repository/riwayat_aktivitas_repository.dart';
import '../../../../../../../../data/local/isar/repository/riwayat_berkas_repository.dart';
import '../../../../../../../../data/local/isar/repository/sesi_repository.dart';
import '../../../../../../../../data/local/isar/repository/setelan_akun_repository.dart';
import '../../../../../../../../data/local/isar/services/auth/pengguna/auth_service.dart';

class IndexAkunKeamananAkunController extends GetxController {
  final AuthServicePengguna _auth = Get.find<AuthServicePengguna>();

  final RepositoriAkun akun = RepositoriAkun();
  final RepositoriPengguna pengguna = RepositoriPengguna();

  final RepositoriSesi sesiPengguna = RepositoriSesi();
  final RepositoriRiwayatBerkas riwayatBerkas = RepositoriRiwayatBerkas();
  final RepositoriBerkas berkas = RepositoriBerkas();
  final RepositoriRiwayatAktivitas riwayatAktivitas =
      RepositoriRiwayatAktivitas();
  final RepositoriSetelanAkun setelanAkun = RepositoriSetelanAkun();

  Future<void> hapusAkun() async {
    final idAkun = await _auth.idAkunSaatIni();

    if (idAkun == null) {
      throw Exception("Sesi tidak ditemukan.");
    }

    final akunModel = await akun.berdasarkanId(idAkun);
    final themeService = Get.find<AppThemeService>();
    final localizationService = Get.find<LocalizationService>();

    if (akunModel == null) {
      throw Exception("Akun tidak ditemukan.");
    }

    final idPengguna = akunModel.idPengguna;

    if (idPengguna != null) {
      await sesiPengguna.hapusBerdasarkanPengguna(idPengguna);
      await riwayatBerkas.hapusBerdasarkanPengguna(idPengguna);
      await berkas.hapusBerdasarkanPengguna(idPengguna);
      await riwayatAktivitas.hapusBerdasarkanPengguna(idPengguna);
      await setelanAkun.hapusBerdasarkanPengguna(idPengguna);
      await themeService.clearTheme();
      await localizationService.clearLocale();
      await pengguna.hapus(idPengguna);
    }

    await akun.hapus(idAkun);

    await _auth.keluar();
  }
}
