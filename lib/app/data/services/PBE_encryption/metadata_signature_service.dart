import 'dart:convert';

import 'package:crypto/crypto.dart';

class MetadataSignatureService {
  const MetadataSignatureService();

  String sign({
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
