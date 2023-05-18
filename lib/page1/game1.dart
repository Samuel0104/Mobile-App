import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller1.dart';
import 'package:google_fonts/google_fonts.dart';
import '../scoreWidget.dart';

class Game1 extends StatelessWidget {
  Game1({super.key});

  final Controller1 controller1 = Get.put(Controller1());

  @override
  Widget build(BuildContext context) {
    Controller1 controller1 = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Juego 1"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.workspace_premium_sharp),
            tooltip: "Mis Puntos",
            onPressed: () => Get.dialog(ScoreDialog(1)),
          ),
          IconButton(
            icon: const Icon(Icons.question_mark_outlined),
            tooltip: "Ayuda",
            onPressed: () => Get.dialog(
              AlertDialog(
                title: const Text("AYUDA"),
                content: const Text(
                  "¯\\_(ツ)_/¯",
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            const SizedBox(height: 16),
            Obx(
              () => Text("NIVEL ${controller1.score.value}",
                  style: GoogleFonts.staatliches(fontSize: 32)),
            ),
            Expanded(
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(32),
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                crossAxisCount: 3,
                children: <Widget>[
                  for (var i = 0; i < 9; ++i)
                    Obx(
                      () => GestureDetector(
                        onLongPress: () {
                          controller1.changeColor(i);
                        },
                        onLongPressUp: () {
                          controller1.changeColor(i);
                        },
                        child: Material(
                          color: controller1.getColor(i),
                          elevation: 10,
                          borderRadius: BorderRadius.circular(16),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: InkWell(
                            onTap: () {
                              controller1.attempt(i);
                              if (controller1.lose.value == true) {
                                // controller1.editJson();
                                Get.dialog(
                                  AlertDialog(
                                    title: const Text("INTÉNTALO DE NUEVO"),
                                    content: Text(
                                        "¡Obtuviste ${10 * controller1.score.value} puntos!"),
                                    actions: <Widget>[
                                      TextButton(
                                        child: const Text("REGRESAR AL MENÚ"),
                                        onPressed: () =>
                                            Get.offAllNamed("/menu"),
                                      ),
                                    ],
                                  ),
                                  barrierDismissible: false,
                                );
                              }
                            },
                            highlightColor: Colors.lightBlue,
                            splashColor: Colors.lightBlue,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                textStyle: GoogleFonts.staatliches(fontSize: 32),
              ),
              onPressed: () {
                controller1.start();
              },
              child: const Text("JUGAR"),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
