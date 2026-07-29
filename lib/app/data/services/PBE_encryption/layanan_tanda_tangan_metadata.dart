import 'dart:convert';

import 'package:crypto/crypto.dart';

class LayananTandaTanganMetadata {
  const LayananTandaTanganMetadata();

  String tandaTangan({
    required String json,
    required List<int> key,
  }) {
    final hmac = Hmac(
      sha256,
      key,
    );

    return hmac
        .convert(
          utf8.encode(json),
        )
        .toString();
  }
}
