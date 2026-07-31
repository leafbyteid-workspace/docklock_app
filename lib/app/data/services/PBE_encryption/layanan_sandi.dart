import 'package:crypto/crypto.dart';

class LayananSandi {
  const LayananSandi();

  String kunciHash(
    List<int> keyBytes,
  ) {
    return sha256.convert(keyBytes).toString();
  }
}
