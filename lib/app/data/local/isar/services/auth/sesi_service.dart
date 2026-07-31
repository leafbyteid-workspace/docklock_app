import 'dart:math';

import 'package:bcrypt/bcrypt.dart';
import 'package:get/get.dart';

import '../../models/sesi_model.dart';
import '../../repository/akun_repository.dart';
import '../../repository/sesi_repository.dart';
import 'pengguna/auth_service.dart';

class SesiService {
  SesiService({
    RepositoriSesi? repositoriSesi,
    RepositoriAkun? repositoriAkun,
  })  : _repositoriSesi = repositoriSesi ?? RepositoriSesi(),
        _repositoriAkun = repositoriAkun ?? RepositoriAkun();

  final RepositoriSesi _repositoriSesi;
  final RepositoriAkun _repositoriAkun;

  static const Duration tokenAksesLifetime = Duration(minutes: 15);
  static const Duration tokenPemulihanLifetime = Duration(days: 30);

  static const _chars =
      'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';

  final Random _random = Random.secure();

  String _fungsiMembuatToken() {
    final randomString = List.generate(
      64,
      (_) => _chars[_random.nextInt(_chars.length)],
    ).join();

    return BCrypt.hashpw(
      randomString,
      BCrypt.gensalt(),
    );
  }

  Future<SesiModel?> _sesiSaatIni() {
    return _repositoriSesi.dapatkanSesiAktif();
  }

  Future<void> masuk({
    required int idAkun,
  }) async {
    final now = DateTime.now();

    await _repositoriSesi.masuk(
      idAkun: idAkun,
      tokenAkses: _fungsiMembuatToken(),
      tokenPemulihan: _fungsiMembuatToken(),
      tokenAksesAkhir: now.add(tokenAksesLifetime),
      tokenPemulihanAkhir: now.add(tokenPemulihanLifetime),
    );
  }

  Future<int> penggunaSaatIni() async {
    final session = await _sesiSaatIni();

    if (session == null) {
      throw Exception("Sesi tidak ditemukan");
    }

    if (!_fungsiPengecekanTokenAksesValid(session)) {
      final refreshed = await _pemulihanAksesToken(session);

      if (!refreshed) {
        await keluar();

        Get.find<AuthServicePengguna>().authenticated.value = false;

        throw Exception("Sesi tidak valid");
      }
    }

    final akun = await _repositoriAkun.berdasarkanId(session.idAkun);

    if (akun?.idPengguna == null) {
      throw Exception("Pengguna tidak ditemukan");
    }

    return akun!.idPengguna!;
  }

  Future<bool> autentikasi() async {
    return (await dapatkanTokenAkses()) != null;
  }

  Future<String?> dapatkanTokenAkses() async {
    final session = await _sesiSaatIni();

    if (session == null) {
      return null;
    }

    if (_fungsiPengecekanTokenAksesValid(session)) {
      return session.tokenAkses;
    }

    final refreshed = await _pemulihanAksesToken(session);

    if (!refreshed) {
      await keluar();

      Get.find<AuthServicePengguna>().authenticated.value = false;

      return null;
    }

    return (await _sesiSaatIni())?.tokenAkses;
  }

  Future<SesiModel?> sesiSaatIni() {
    return _repositoriSesi.dapatkanSesiAktif();
  }

  bool _fungsiPengecekanTokenAksesValid(SesiModel session) {
    final expiredAt = session.tokenAksesAkhir;

    return session.sedangMasuk &&
        session.status == StatusSesi.aktif &&
        session.tokenAkses != null &&
        expiredAt != null &&
        expiredAt.isAfter(DateTime.now());
  }

  bool _fungsiPengecekanTokenPemulihanValid(SesiModel session) {
    final expiredAt = session.tokenPemulihanAkhir;

    return session.tokenPemulihan != null &&
        expiredAt != null &&
        expiredAt.isAfter(DateTime.now());
  }

  Future<bool> _pemulihanAksesToken(SesiModel session) async {
    if (!_fungsiPengecekanTokenPemulihanValid(session)) {
      await keluar();
      return false;
    }

    await _repositoriSesi.tokenPemulihan(
      idAkun: session.idAkun,
      tokenAkses: _fungsiMembuatToken(),
      tokenPemulihan: session.tokenPemulihan!,
      tokenAksesAkhir: DateTime.now().add(tokenAksesLifetime),
      tokenPemulihanAkhir: session.tokenPemulihanAkhir,
    );

    return true;
  }

  Future<void> keluar() async {
    final session = await _sesiSaatIni();

    if (session == null) {
      return;
    }

    await _repositoriSesi.keluar(session.idAkun);
  }
}
