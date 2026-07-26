import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import '../../../../../../../core/widget/navigation/app_appbar.dart';
import '../controllers/index_controller.dart';

class IndexKunciBerkasView extends GetView<IndexKunciBerkasController> {
  const IndexKunciBerkasView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPengguna(
        title: "Kunci Berkas",
        subtitle: "Lakukan Penguncian Berkas Terhadap Dokumen Anda",
        actionIcon1: Symbols.event,
        actionIcon2: Symbols.more_vert_rounded,
        onAction1: () {},
        onAction2: () {},
        onBackPressed: () {
          Get.back();
        },
        showBackButton: false,
      ),
      body: const Center(
        child: Text(
          'IndexKunciBerkasView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
