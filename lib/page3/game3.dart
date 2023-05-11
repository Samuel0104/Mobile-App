import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller3.dart';

class Game3 extends StatelessWidget {
  Game3({super.key});

  final Controller3 controller3 = Get.put(Controller3());

  @override
  Widget build(BuildContext context) {
    Controller3 controller3 = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Juego 3"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.question_mark_outlined),
            tooltip: "Ayuda",
            onPressed: () => Get.dialog(
              AlertDialog(
                title: const Text("AYUDA"),
                content: const Text(
                  "No sé qué poner",
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
