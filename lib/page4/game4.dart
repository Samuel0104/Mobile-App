import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller4.dart';

class Game4 extends StatelessWidget {
  Game4({super.key});

  final Controller4 controller4 = Get.put(Controller4());

  @override
  Widget build(BuildContext context) {
    Controller4 controller4 = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Juego 4"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.question_mark_outlined),
            tooltip: "Ayuda",
            onPressed: () => Get.dialog(
              AlertDialog(
                title: const Text("AYUDA"),
                content: const Text(
                  "Aprendan FiM++",
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
