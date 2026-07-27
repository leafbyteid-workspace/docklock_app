import 'package:bcrypt/bcrypt.dart';

class PasswordHasher {
  PasswordHasher._();
  static const int _rounds = 12;

  static String hash(String password) {
    return BCrypt.hashpw(
      password,
      BCrypt.gensalt(logRounds: _rounds),
    );
  }

  static bool verify({
    required String password,
    required String hashedPassword,
  }) {
    try {
      return BCrypt.checkpw(password, hashedPassword);
    } catch (_) {
      return false;
    }
  }
}
