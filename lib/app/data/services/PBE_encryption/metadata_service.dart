import 'package:archive/archive.dart';

class MetadataService {

  ArchiveFile createMetadata(
      String json,
      ) {

    return ArchiveFile.string(
      "metadata.json",
      json,
    );

  }

}