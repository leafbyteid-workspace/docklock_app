import 'package:disk_space_plus/disk_space_plus.dart';
import 'package:get/get.dart';

import '../../../../../../core/errors/app_confirmationAlert.dart';

class StorageChecker {
  StorageChecker._();

  static const int reservedSpace = 10 * 1024 * 1024;

  static Future<bool> hasEnoughStorage({required int requiredBytes}) async {
    final diskSpace = DiskSpacePlus();
    final freeSpaceMb = await diskSpace.getFreeDiskSpace ?? 0;

    final freeBytes = (freeSpaceMb * 1024 * 1024).toInt();

    return freeBytes >= (requiredBytes + reservedSpace);
  }

  static Future<void> showStorageFullDialog() async {
    await ShowConfirmationDialog.show(
      context: Get.context!,
      title: "Penyimpanan Perangkat Penuh",
      subtitle:
          "Ruang penyimpanan perangkat tidak mencukupi untuk melanjutkan proses. "
          "Silakan kosongkan sebagian ruang penyimpanan terlebih dahulu agar "
          "database lokal dan berkas dapat disimpan dengan aman.",
      confirmText: "Mengerti",
      cancelText: "",
      type: ConfirmationDialogType.warning,
      barrierDismissible: false,
    );
  }
}
