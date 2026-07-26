import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'referensi_controller.dart';

class ReferensiView extends GetView<ReferensiController> {
  const ReferensiView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ReferensiView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ReferensiView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
