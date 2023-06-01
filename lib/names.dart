import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';

class JsonReader1 extends GetxController {
  var students = [].obs;

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
    for (var i in jsonRead["id"].keys) {
      students.add(i);
    }
  }

  Future<void> selectStudent(String name) async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File("${dir.path}/stats.json");
    final response = await file.readAsString();
    final jsonRead = await jsonDecode(response);
    jsonRead["id"][name]["current"] = true;
    await file.writeAsString(jsonEncode(jsonRead));
  }
}

class NamesPage extends StatelessWidget {
  NamesPage({super.key});

  final JsonReader1 controller = Get.put(JsonReader1());

  @override
  Widget build(BuildContext context) {
    JsonReader1 controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Estudiantes"),
        actions: <Widget>[
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
                  padding: const EdgeInsets.all(64),
                  children: <Widget>[
                    for (var i = 0; i < controller.students.length; ++i)
                      Material(
                        color: Colors.teal,
                        elevation: 10,
                        borderRadius: BorderRadius.circular(16),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: InkWell(
                          onTap: () {
                            controller.selectStudent(controller.students[i]);
                            Get.toNamed("/stats");
                          },
                          child: Text(
                            controller.students[i],
                            style: GoogleFonts.staatliches(
                                fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
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