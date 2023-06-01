import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';

class JsonReader2 extends GetxController {
  var name = "".obs;
  var scores = [].obs;

  @override
  onInit() {
    super.onInit();
    readJson();
  }

  Future<void> readJson() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File("${dir.path}/stats.json");
    final response = await file.readAsString();
    final jsonRead = await jsonDecode(response);
    var data = jsonRead["id"];
    for (var student in data.keys) {
      if (data[student]["current"] == true) {
        name.value = student;
        for (var i = 1; i <= 2; ++i) {
          scores.add(
              Text("Juego $i", style: GoogleFonts.staatliches(fontSize: 36)));
          for (var game in data[student]["game$i"].keys) {
            scores.add(Text("$game: ${data[student]["game$i"][game]}",
                style: GoogleFonts.staatliches(fontSize: 24)));
          }
        }
        jsonRead["id"][student]["current"] = false;
        await file.writeAsString(jsonEncode(jsonRead));
      }
    }
  }
}

class StatsPage extends StatelessWidget {
  StatsPage({super.key});

  final JsonReader2 controller = Get.put(JsonReader2());

  @override
  Widget build(BuildContext context) {
    JsonReader2 controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.name.value),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.refresh_outlined),
            tooltip: "Recargar",
            onPressed: () => controller.readJson(),
          ),
          IconButton(
            icon: const Icon(Icons.brightness_4_outlined),
            tooltip: "Tema",
            onPressed: () => Get.changeThemeMode(
              Get.isDarkMode ? ThemeMode.light : ThemeMode.dark,
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () => ListView(
                  primary: false,
                  padding: const EdgeInsets.all(32),
                  children: <Widget>[
                    for (var item in controller.scores) item,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
