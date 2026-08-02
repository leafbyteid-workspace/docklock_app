import 'package:get/get.dart';

import '../../../../../../../../../core/errors/app_snackbar.dart';
import '../../../../../../../../../core/theme/app_theme_service.dart';
import '../../../../../../../../data/local/isar/models/setelan_akun_model.dart';

class IndexPreferensiTemaController extends GetxController {
  final AppThemeService _themeService = Get.find<AppThemeService>();

  Rx<TemaAplikasi> get temaDipilih => _themeService.tema;

  final loading = false.obs;

  Future<void> pilihTema(TemaAplikasi tema) async {
    if (tema == temaDipilih.value) return;
    loading.value = true;
    try {
      await _themeService.ubahTema(tema);

      AppSnackbar.sukses(
        title: "Berhasil",
        message: "Tema berhasil diubah.",
      );

      Get.back();
    } catch (e) {
      AppSnackbar.gagal(
        title: "Gagal",
        message: "Terjadi kesalahan saat mengubah tema.",
      );
    } finally {
      loading.value = false;
    }
  }
}
