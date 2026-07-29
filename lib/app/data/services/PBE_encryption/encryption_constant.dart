class EncryptionConstant {
  EncryptionConstant._();

  static const String signature = "DOCLOCK";

  static const String appName = "DocLock";

  static const String formatVersion = "1.0";

  static const String algorithm = "AES-256-GCM";

  static const int pbkdf2Iteration = 100000;
}
