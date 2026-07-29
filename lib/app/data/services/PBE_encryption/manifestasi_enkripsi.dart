import 'dart:convert';

class ManifestasiEnkripsi {
  final String signature;

  final String application;

  final String formatVersion;

  final DateTime createdAt;

  const ManifestasiEnkripsi({
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

  factory ManifestasiEnkripsi.fromJson(Map<String, dynamic> json) {
    return ManifestasiEnkripsi(
      signature: json["signature"],
      application: json["application"],
      formatVersion: json["formatVersion"],
      createdAt: DateTime.parse(json["createdAt"]),
    );
  }

  String encode() => jsonEncode(toJson());

  factory ManifestasiEnkripsi.decode(String value) =>
      ManifestasiEnkripsi.fromJson(
        jsonDecode(value),
      );
}
