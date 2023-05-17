import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller2.dart';
import 'package:google_fonts/google_fonts.dart';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            const SizedBox(height: 16),
            Obx(
              () => Text("${controller2.score.value} PUNTOS",
                  style: GoogleFonts.staatliches(fontSize: 32)),
            ),
            Obx(
              () => Text(
                  "${controller2.lives.value} vida${controller2.lives.value != 1 ? "s" : ""}",
                  style: GoogleFonts.staatliches(fontSize: 16)),
            ),
            Expanded(
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.symmetric(horizontal: 64),
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                crossAxisCount: 3,
                children: <Widget>[
                  for (var i = 0; i < 12; ++i)
                    Obx(
                      () => Material(
                        color: Colors.teal,
                        elevation: 10,
                        borderRadius: BorderRadius.circular(16),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: InkWell(
                          onTap: () {
                            controller2.attempt(i);
                            if (controller2.lose.value == true) {
                              Get.dialog(
                                AlertDialog(
                                  title: const Text("INTÉNTALO DE NUEVO"),
                                  content: Text(
                                      "¡Obtuviste ${controller1.score.value} puntos!"),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text("REGRESAR AL MENÚ"),
                                      onPressed: () => Get.offAllNamed("/menu"),
                                    ),
                                  ],
                                ),
                                barrierDismissible: false,
                              );
                            }
                          },
                          highlightColor: Colors.lightBlue,
                          splashColor: Colors.lightBlue,
                          child: Image(
                            image: AssetImage(controller2.getTile(i)),
                            fit: BoxFit.cover,
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
