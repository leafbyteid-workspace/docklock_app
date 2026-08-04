import 'package:isar/isar.dart';

import '../models/sesi_model.dart';
import '../services/main/isar_service.dart';

class RepositoriSesi {
  RepositoriSesi({Isar? isar}) : _isar = isar ?? IsarService.instance.isar;

  final Isar _isar;

  Future<SesiModel?> dapatkanSesiAktif() {
    return _isar.sesiModels.filter().sedangMasukEqualTo(true).findFirst();
  }

  Future<SesiModel?> berdasarkanIdAkun(int idAkun) {
    return _isar.sesiModels.filter().idAkunEqualTo(idAkun).findFirst();
  }

  Future<void> masuk({
    required int idAkun,
    required String tokenAkses,
    required String tokenPemulihan,
    DateTime? tokenAksesAkhir,
    DateTime? tokenPemulihanAkhir,
  }) async {
    final sekarang = DateTime.now();

    final sesi = await berdasarkanIdAkun(idAkun);

    if (sesi == null) {
      final data = SesiModel()
        ..idAkun = idAkun
        ..tokenAkses = tokenAkses
        ..tokenPemulihan = tokenPemulihan
        ..tokenAksesAkhir = tokenAksesAkhir
        ..tokenPemulihanAkhir = tokenPemulihanAkhir
        ..status = StatusSesi.aktif
        ..sedangMasuk = true
        ..dibuatPada = sekarang
        ..diPerbaruiPada = sekarang
        ..terakhirAktifPada = sekarang
        ..masukTerakhirPada = sekarang;

      await _isar.writeTxn(() async {
        await _isar.sesiModels.put(data);
      });

      return;
    }

    sesi
      ..tokenAkses = tokenAkses
      ..tokenPemulihan = tokenPemulihan
      ..tokenAksesAkhir = tokenAksesAkhir
      ..tokenPemulihanAkhir = tokenPemulihanAkhir
      ..status = StatusSesi.aktif
      ..sedangMasuk = true
      ..diPerbaruiPada = sekarang
      ..terakhirAktifPada = sekarang
      ..masukTerakhirPada = sekarang;

    await _isar.writeTxn(() async {
      await _isar.sesiModels.put(sesi);
    });
  }

  Future<void> tokenPemulihan({
    required int idAkun,
    required String tokenAkses,
    required String tokenPemulihan,
    DateTime? tokenAksesAkhir,
    DateTime? tokenPemulihanAkhir,
  }) async {
    final sesi = await berdasarkanIdAkun(idAkun);

    if (sesi == null) return;

    sesi
      ..tokenAkses = tokenAkses
      ..tokenPemulihan = tokenPemulihan
      ..tokenAksesAkhir = tokenAksesAkhir
      ..tokenPemulihanAkhir = tokenPemulihanAkhir
      ..status = StatusSesi.aktif
      ..sedangMasuk = true
      ..diPerbaruiPada = DateTime.now()
      ..terakhirAktifPada = DateTime.now();

    await _isar.writeTxn(() async {
      await _isar.sesiModels.put(sesi);
    });
  }

  Future<void> perbaruiAktivitas(int idAkun) async {
    final sesi = await berdasarkanIdAkun(idAkun);

    if (sesi == null) return;

    sesi
      ..terakhirAktifPada = DateTime.now()
      ..diPerbaruiPada = DateTime.now();

    await _isar.writeTxn(() async {
      await _isar.sesiModels.put(sesi);
    });
  }

  Future<void> keluar(int idAkun) async {
    final sesi = await berdasarkanIdAkun(idAkun);

    if (sesi == null) return;

    sesi
      ..status = StatusSesi.keluar
      ..sedangMasuk = false
      ..tokenAkses = null
      ..tokenPemulihan = null
      ..tokenAksesAkhir = null
      ..tokenPemulihanAkhir = null
      ..terakhirAktifPada = DateTime.now()
      ..keluarPada = DateTime.now()
      ..diPerbaruiPada = DateTime.now();

    await _isar.writeTxn(() async {
      await _isar.sesiModels.put(sesi);
    });
  }

  Future<void> kedaluwarsa(int idAkun) async {
    final sesi = await berdasarkanIdAkun(idAkun);

    if (sesi == null) return;

    sesi
      ..status = StatusSesi.kedaluwarsa
      ..sedangMasuk = false
      ..tokenAkses = null
      ..tokenPemulihan = null
      ..tokenAksesAkhir = null
      ..tokenPemulihanAkhir = null
      ..diPerbaruiPada = DateTime.now();

    await _isar.writeTxn(() async {
      await _isar.sesiModels.put(sesi);
    });
  }

  Future<void> hapusBerdasarkanPengguna(int idPengguna) async {
    await _isar.writeTxn(() async {
      final data =
          await _isar.sesiModels.filter().idAkunEqualTo(idPengguna).findAll();

      await _isar.sesiModels.deleteAll(
        data.map((e) => e.id).toList(),
      );
    });
  }

  Future<void> hapus(int idAkun) async {
    final sesi = await berdasarkanIdAkun(idAkun);

    if (sesi == null) return;

    await _isar.writeTxn(() async {
      await _isar.sesiModels.delete(sesi.id);
    });
  }
}
