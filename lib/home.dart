import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

mixin JsonManager {
  late final String user;

  Future<void> createJson() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File("${dir.path}/scores.json");
    try {
      final response = await file.readAsString();
      final jsonRead = await jsonDecode(response);
      user = jsonRead["name"];
    } catch (e) {
      await file.writeAsString(jsonEncode({
        "name": "",
        "game1": {"scores": []},
        "game2": {"scores": []}
      }));
      user = "";
    }
  }

  Future<void> signJson(String name) async {
    if (user == "") {
      final dir = await getApplicationDocumentsDirectory();
      final file = File("${dir.path}/scores.json");
      final response = await file.readAsString();
      final jsonRead = await jsonDecode(response);
      jsonRead["name"] = name;
      await file.writeAsString(jsonEncode(jsonRead));
    }
  }
}

class HomePage extends StatelessWidget with JsonManager {
  HomePage({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    createJson();
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
                      if (user != "" && user != value) {
                        return "Nombre incorrecto";
                      }
                      return null;
                    },
                    onSaved: (String? value) {
                      if (value != null) {
                        signJson(value);
                      }
                      Get.toNamed("/menu");
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
