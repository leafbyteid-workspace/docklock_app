import 'dart:convert';

class ManifestEnkripsi {
  final String signature;

  final String application;

  final String formatVersion;

  final DateTime createdAt;

  const ManifestEnkripsi({
    required this.signature,
    required this.application,
    required this.formatVersion,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      "signature": signature,
      "application": application,
      "formatVersion": formatVersion,
      "createdAt": createdAt.toIso8601String(),
    };
  }

  factory ManifestEnkripsi.fromJson(
      Map<String, dynamic> json) {
    return ManifestEnkripsi(
      signature: json["signature"],
      application: json["application"],
      formatVersion: json["formatVersion"],
      createdAt: DateTime.parse(json["createdAt"]),
    );
  }

  String encode() => jsonEncode(toJson());

  factory ManifestEnkripsi.decode(String value) =>
      ManifestEnkripsi.fromJson(
        jsonDecode(value),
      );
}