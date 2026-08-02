import 'package:get/get.dart';

import '../../../models/sesi_model.dart';
import '../sesi_service.dart';

class AuthServicePengguna extends GetxService {
  AuthServicePengguna({
    SesiService? sesiService,
  }) : _sesiService = sesiService ?? SesiService();

  final SesiService _sesiService;

  final RxBool authenticated = false.obs;

  Future<AuthServicePengguna> init() async {
    authenticated.value = await _sesiService.autentikasi();
    return this;
  }

  Future<bool> cek() async {
    authenticated.value = await _sesiService.autentikasi();
    return authenticated.value;
  }

  Future<bool> validasiSesi() async {
    final token = await _sesiService.dapatkanTokenAkses();

    final valid = token != null;

    authenticated.value = valid;

    return valid;
  }

  Future<SesiModel?> sesiSaatIni() {
    return _sesiService.sesiSaatIni();
  }

  Future<void> masuk({
    required int idAkun,
  }) async {
    await _sesiService.masuk(idAkun: idAkun);

    authenticated.value = true;
  }

  Future<void> keluar() async {
    await _sesiService.keluar();

    authenticated.value = false;
  }

  Future<int> penggunaSaatIni() {
    return _sesiService.penggunaSaatIni();
  }

  Future<int?> idAkunSaatIni() {
    return _sesiService.idAkunSaatIni();
  }

  Future<String?> tokenAkses() {
    return _sesiService.dapatkanTokenAkses();
  }
}
