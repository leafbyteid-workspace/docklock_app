import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/index_controller.dart';

class IndexBerandaView extends GetView<IndexBerandaController> {
  const IndexBerandaView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IndexBerandaView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'IndexBerandaView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
