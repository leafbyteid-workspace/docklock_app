import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/index_controller.dart';

class IndexAktivitasView extends GetView<IndexAktivitasController> {
  const IndexAktivitasView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IndexAktivitasView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'IndexAktivitasView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
