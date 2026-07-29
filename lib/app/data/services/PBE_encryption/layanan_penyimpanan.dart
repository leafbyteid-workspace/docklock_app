import 'dart:io';

import 'package:path_provider/path_provider.dart';

class LayananPenyimpanan {
  Future<Directory> enkripsiDirektori() async {
    final dir = await getApplicationDocumentsDirectory();

    final folder = Directory(
      "${dir.path}/DocLock",
    );

    if (!folder.existsSync()) {
      folder.createSync(recursive: true);
    }

    return folder;
  }

  Future<Directory> dekripsiDirektori() async {
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
