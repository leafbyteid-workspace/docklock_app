
import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../models/akun_model.dart';
import '../../models/berkas_model.dart';
import '../../models/pengguna_model.dart';
import '../../models/peran_model.dart';
import '../../models/riwayat_aktivitas_model.dart';
import '../../models/riwayat_berkas_model.dart';
import '../../models/sesi_model.dart';
import '../../models/setelan_akun_model.dart';

class IsarService {
  IsarService._();

  static final IsarService instance = IsarService._();

  static const _databaseName = 'identitas_db';

  Isar? _isar;

  Isar get isar {
    final database = _isar;

    if (database == null) {
      throw StateError(
        'Isar belum diinisialisasi. Jalankan '
        'await IsarService.instance.init() sebelum memakai repository.',
      );
    }

    return database;
  }

  Future<void> init() async {
    if (_isar != null) return;

    final existingDatabase = Isar.getInstance(_databaseName);
    if (existingDatabase != null) {
      _isar = existingDatabase;
      return;
    }

    final directory = await getApplicationDocumentsDirectory();

    _isar = await Isar.open(
      [
        AkunModelSchema,
        PenggunaModelSchema,
        PeranModelSchema,
        SesiModelSchema,
        BerkasModelSchema,
        RiwayatAktivitasModelSchema,
        RiwayatBerkasModelSchema,
        SetelanAkunModelSchema,
      ],
      directory: directory.path,
      name: _databaseName,
      inspector: kDebugMode,
    );
  }

  Future<void> close() async {
    final database = _isar;

    if (database == null) return;

    await database.close();
    _isar = null;
  }
}
