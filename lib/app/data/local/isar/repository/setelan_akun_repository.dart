import 'package:isar/isar.dart';

import '../models/setelan_akun_model.dart';
import '../services/main/isar_service.dart';

class RepositoriSetelanAkun {
  RepositoriSetelanAkun({
    Isar? isar,
  }) : _isar = isar ?? IsarService.instance.isar;

  final Isar _isar;

  Future<SetelanAkunModel?> berdasarkanIdAkun(int idAkun) {
    return _isar.setelanAkunModels.filter().idAkunEqualTo(idAkun).findFirst();
  }

  Future<SetelanAkunModel> buatSetelanDefault(
    int idAkun,
  ) async {
    final data = SetelanAkunModel()
      ..idAkun = idAkun
      ..tema = TemaAplikasi.sistem
      ..bahasa = "id";

    await simpan(data);

    return data;
  }

  Future<SetelanAkunModel> dapatkanAtauBuat(
    int idAkun,
  ) async {
    final data = await berdasarkanIdAkun(idAkun);

    if (data != null) {
      return data;
    }

    return await buatSetelanDefault(idAkun);
  }

  Future<int> simpan(SetelanAkunModel model) async {
    model.diperbaruiPada = DateTime.now();

    return await _isar.writeTxn(
      () => _isar.setelanAkunModels.put(model),
    );
  }

  Future<void> simpanTema({
    required int idAkun,
    required TemaAplikasi tema,
  }) async {
    final data = await dapatkanAtauBuat(idAkun);

    data.tema = tema;

    await simpan(data);
  }

  Future<void> simpanBahasa({
    required int idAkun,
    required String bahasa,
  }) async {
    final data = await dapatkanAtauBuat(idAkun);

    data.bahasa = bahasa;

    await simpan(data);
  }

  Future<void> hapus(int idAkun) async {
    final data = await berdasarkanIdAkun(idAkun);

    if (data == null) {
      return;
    }

    data.dihapusPada = DateTime.now();

    await simpan(data);
  }
}
