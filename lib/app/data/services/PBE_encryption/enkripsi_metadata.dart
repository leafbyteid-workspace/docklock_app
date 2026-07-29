import 'dart:convert';

class EnkripsiMetadataModel {
  final String id;
  final String salt;
  final String nonce;
  final String mac;
  final String originalName;
  final String originalExtension;
  final int originalSize;
  final String hint;
  final String description;
  final DateTime createdAt;
  final String algorithm;
  final int iteration;
  final String checksum;
  final String formatVersion;
  final bool integrityProtected;
  final int encryptedSize;
  final String originalFileName;
  final String mimeType;
  final DateTime lastModified;
  final String readableSize;
  final String passwordHash;

  const EnkripsiMetadataModel({
    required this.id,
    required this.salt,
    required this.nonce,
    required this.mac,
    required this.originalName,
    required this.originalExtension,
    required this.originalSize,
    required this.hint,
    required this.description,
    required this.createdAt,
    required this.algorithm,
    required this.iteration,
    required this.checksum,
    required this.formatVersion,
    required this.integrityProtected,
    required this.encryptedSize,
    required this.originalFileName,
    required this.mimeType,
    required this.lastModified,
    required this.readableSize,
    required this.passwordHash,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "salt": salt,
      "nonce": nonce,
      "mac": mac,
      "originalName": originalName,
      "originalExtension": originalExtension,
      "originalSize": originalSize,
      "hint": hint,
      "description": description,
      "createdAt": createdAt.toIso8601String(),
      "algorithm": algorithm,
      "iteration": iteration,
      "checksum": checksum,
      "formatVersion": formatVersion,
      "integrityProtected": integrityProtected,
      "encryptedSize": encryptedSize,
      "originalFileName": originalFileName,
      "mimeType": mimeType,
      "lastModified": lastModified.toIso8601String(),
      "readableSize": readableSize,
      "passwordHash": passwordHash,
    };
  }

  factory EnkripsiMetadataModel.fromJson(Map<String, dynamic> json) {
    return EnkripsiMetadataModel(
      id: json["id"],
      salt: json["salt"],
      nonce: json["nonce"],
      mac: json["mac"],
      originalName: json["originalName"],
      originalExtension: json["originalExtension"],
      originalSize: json["originalSize"],
      hint: json["hint"],
      description: json["description"],
      createdAt: DateTime.parse(json["createdAt"]),
      algorithm: json["algorithm"],
      iteration: json["iteration"],
      checksum: json["checksum"],
      formatVersion: json["formatVersion"],
      integrityProtected: json["integrityProtected"],
      encryptedSize: json["encryptedSize"],
      originalFileName: json["originalFileName"],
      mimeType: json["mimeType"],
      lastModified: DateTime.parse(
        json["lastModified"],
      ),
      readableSize: json["readableSize"],
      passwordHash:
    json["passwordHash"],
    );
  }

  String encode() => jsonEncode(toJson());

  factory EnkripsiMetadataModel.decode(String value) =>
      EnkripsiMetadataModel.fromJson(jsonDecode(value));
}
