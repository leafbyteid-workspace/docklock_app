import 'package:get/get.dart';

import '../../../../../../../../data/local/isar/repository/akun_repository.dart';
import '../../../../../../../../data/local/isar/repository/pengguna_repository.dart';
import '../../../../../../../../data/local/isar/services/auth/pengguna/auth_service.dart';
import '../../../../../../../../routes/app_pages.dart';

class IndexAkunKeamananAkunController extends GetxController {
  final RepositoriPengguna _repositoriPengguna = RepositoriPengguna();
  final RepositoriAkun _repositoriAkun = RepositoriAkun();
  final AuthServicePengguna _auth = Get.find<AuthServicePengguna>();

  Future<void> hapusAkun() async {
    final idAkun = await _auth.idAkunSaatIni();
    if (idAkun == null) return;
    final akun = await _repositoriAkun.berdasarkanId(idAkun);
    if (akun == null) return;
    final idPengguna = akun.idPengguna;
    await _repositoriAkun.hapus(idAkun);
    if (idPengguna != null) {
      await _repositoriPengguna.hapus(idPengguna);
    }
    await _auth.keluar();

    Get.offAllNamed(Routes.indexMasukPengguna);
  }
}
