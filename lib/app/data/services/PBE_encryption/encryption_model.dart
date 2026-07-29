class EnkripsiBerkasModel {
  final String id;
  final String originalName;
  final String encryptedName;
  final String hint;
  final String description;
  final DateTime createdAt;
  final int fileSize;
  final String checksum;

  EnkripsiBerkasModel({
    required this.id,
    required this.originalName,
    required this.encryptedName,
    required this.hint,
    required this.description,
    required this.createdAt,
    required this.fileSize,
    required this.checksum,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "originalName": originalName,
      "encryptedName": encryptedName,
      "hint": hint,
      "description": description,
      "createdAt": createdAt.toIso8601String(),
      "fileSize": fileSize,
      "checksum": checksum,
    };
  }
}