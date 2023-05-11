import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller2.dart';

class Game2 extends StatelessWidget {
  Game2({super.key});

  final Controller2 controller1 = Get.put(Controller2());

  @override
  Widget build(BuildContext context) {
    Controller2 controller2 = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Juego 2"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.question_mark_outlined),
            tooltip: "Ayuda",
            onPressed: () => Get.dialog(
              AlertDialog(
                title: const Text("AYUDA"),
                content: const Text(
                  "AAAAAAAAAAAAAAAAAAAAA",
                ),
                actions: <Widget>[
                  TextButton(
                    child: const Text("CERRAR"),
                    onPressed: () => Get.back(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(),
      ),
    );
  }
}
