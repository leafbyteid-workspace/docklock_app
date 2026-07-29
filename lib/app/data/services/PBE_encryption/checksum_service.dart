import 'dart:typed_data';

import 'package:crypto/crypto.dart' as crypto;

class ChecksumService {
  const ChecksumService();

  String generate(Uint8List bytes) {
    return crypto.sha256.convert(bytes).toString();
  }

  bool verify({
    required Uint8List bytes,
    required String expectedChecksum,
  }) {
    final current = generate(bytes);

    return current == expectedChecksum;
  }
}
