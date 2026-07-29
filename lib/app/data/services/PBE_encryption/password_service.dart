
import 'package:crypto/crypto.dart';

class PasswordService {
  const PasswordService();

  String hashKey(List<int> keyBytes) {
    return sha256.convert(keyBytes).toString();
  }
}
