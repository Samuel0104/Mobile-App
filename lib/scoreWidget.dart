import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'dart:io';

Future<List> readJsonFile() async {
  var input = await File("lib/scores.json").readAsString();
  var map = jsonDecode(input);
  return map;
}

class ScoreDialog extends StatelessWidget {
  ScoreDialog(this.game, {super.key});
  int game;
  var scores = [];

  Future<void> getScores() async {
    scores = [];
    var jsonRead = await readJsonFile();
    for (var i = 0; i < jsonRead.length; i++) {
      if (jsonRead[i]["Game"] == game) {
        scores.add(jsonRead[i]["Score"]);
      }
    }
    scores.sort();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Mejores Puntuaciones",
        style: GoogleFonts.staatliches(fontSize: 32),
      ),
      content: FutureBuilder(
        future: getScores(),
        initialData: [],
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var i = 0; i < 5 && i < scores.length; i++)
                Text(
                  "${scores[scores.length - 1 - i]}",
                  style: GoogleFonts.staatliches(fontSize: 24),
                ),
            ],
          );
        },
      ),
      actions: <Widget>[
        TextButton(
          child: const Text("CERRAR"),
          onPressed: () => Get.back(),
        ),
      ],
    );
  }
}
