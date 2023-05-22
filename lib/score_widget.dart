import 'dart:convert';
import 'dart:io';
// import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';

mixin ScoreDialog {
  var scores = [].obs;

  Future<void> getScores(int i) async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File("${dir.path}/scores.json");
    try {
      final response = await file.readAsString();
      final jsonRead = await jsonDecode(response);
      var data = jsonRead["game$i"]["scores"];
      for (var score = 0; score < 5 && score < data.length; ++score) {
        scores.add(data[data.length - score - 1]);
      }
    } catch (e) {
      await file.writeAsString(jsonEncode({
        "game1": {"scores": []},
        "game2": {"scores": []}
      }));
    }
  }

  Future<void> setScores(int i, int val) async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File("${dir.path}/scores.json");
    final response = await file.readAsString();
    final jsonRead = await jsonDecode(response);
    jsonRead["game$i"]["scores"].add(val);
    jsonRead["game$i"]["scores"].sort();
    if (jsonRead["game$i"]["scores"].length == 6) {
      jsonRead["game$i"]["scores"].remove(jsonRead["game$i"]["scores"].first);
    }
    await file.writeAsString(jsonEncode(jsonRead));
  }
}
