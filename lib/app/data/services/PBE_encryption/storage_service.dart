import 'dart:io';

import 'package:path_provider/path_provider.dart';

class PenyimpananService {
  Future<Directory> encryptedDirectory() async {
    final dir = await getApplicationDocumentsDirectory();

    final folder = Directory(
      "${dir.path}/DocLock",
    );

    if (!folder.existsSync()) {
      folder.createSync(recursive: true);
    }

    return folder;
  }

  Future<Directory> decryptedDirectory() async {
    final dir = await getApplicationDocumentsDirectory();

    final folder = Directory(
      "${dir.path}/DocLock/Decrypted",
    );

    if (!folder.existsSync()) {
      folder.createSync(recursive: true);
    }

    return folder;
  }
  
}
