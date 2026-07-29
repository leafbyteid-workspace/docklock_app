import 'package:archive/archive.dart';

class LayananMetadata {

  ArchiveFile membuatMetadata(
      String json,
      ) {

    return ArchiveFile.string(
      "metadata.json",
      json,
    );

  }

}