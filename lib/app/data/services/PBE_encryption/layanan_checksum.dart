import 'dart:typed_data';

import 'package:crypto/crypto.dart' as crypto;

class LayananChecksum {
  const LayananChecksum();

  String membuat(Uint8List bytes) {
    return crypto.sha256.convert(bytes).toString();
  }

  bool verifikasi({
    required Uint8List bytes,
    required String expectedChecksum,
  }) {
    final current = membuat(bytes);

    return current == expectedChecksum;
  }
}
