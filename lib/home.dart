import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

mixin JsonManager {
  late final String user;
  late final String admin;

  Future<void> createJsons() async {
    final dir = await getApplicationDocumentsDirectory();
    final file1 = File("${dir.path}/scores.json");
    final file2 = File("${dir.path}/stats.json");
    try {
      final response1 = await file1.readAsString();
      final jsonRead1 = await jsonDecode(response1);
      user = jsonRead1["name"];
      final response2 = await file2.readAsString();
      final jsonRead2 = await jsonDecode(response2);
      admin = jsonRead2["name"];
    } catch (e) {
      await file1.writeAsString(jsonEncode({
        "name": "",
        "game1": {"scores": []},
        "game2": {"scores": []}
      }));
      await file2.writeAsString(jsonEncode({
        "name": "",
        "id": {
          "Samuel Moreno": {
            "current": false,
            "game1": {"31-05-23": 100, "20-05-23": 50},
            "game2": {"31-05-23": 80, "20-05-23": 30}
          },
        },
      }));
      user = "";
      admin = "";
    }
  }

  Future<void> signJson(String name) async {
    if (user == "" && admin == "") {
      final dir = await getApplicationDocumentsDirectory();
      if (name != "SOY ADMIN") {
        final file = File("${dir.path}/scores.json");
        final response = await file.readAsString();
        final jsonRead = await jsonDecode(response);
        jsonRead["name"] = name;
        await file.writeAsString(jsonEncode(jsonRead));
      } else {
        final file = File("${dir.path}/stats.json");
        final response = await file.readAsString();
        final jsonRead = await jsonDecode(response);
        jsonRead["name"] = name;
        await file.writeAsString(jsonEncode(jsonRead));
      }
    }
  }
}

class HomePage extends StatelessWidget with JsonManager {
  HomePage({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    createJsons();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menú principal"),
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Image(
              image: AssetImage("assets/images/logo.png"),
            ),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 64),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      hintText: "Nombre completo",
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Por favor, ingresa tu nombre";
                      }
                      if (user != "") {
                        if (user != value) {
                          return "Nombre incorrecto";
                        }
                      } else if (admin != "") {
                        if (admin != value) {
                          return "Nombre incorrecto";
                        }
                      }
                      return null;
                    },
                    onSaved: (String? value) {
                      signJson(value!);
                      if (value == "SOY ADMIN") {
                        Get.toNamed("/names");
                      } else {
                        Get.toNamed("/menu");
                      }
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                      }
                    },
                    child: const Text('SIGUIENTE'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
