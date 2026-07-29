import 'dart:io';

import 'package:path_provider/path_provider.dart';

class BerkasService {
  Future<Directory> encryptedDirectory() async {
    final dir = await getApplicationDocumentsDirectory();

    final folder = Directory("${dir.path}/encrypted");

    if (!folder.existsSync()) {
      folder.createSync(recursive: true);
    }

    return folder;
  }
  

}
