import 'dart:io';

class EncryptionResult {
  final File file;
  final String originalName;
  final String encryptedName;
  final String size;
  final DateTime encryptedAt;

  const EncryptionResult({
    required this.file,
    required this.originalName,
    required this.encryptedName,
    required this.size,
    required this.encryptedAt,
  });
}