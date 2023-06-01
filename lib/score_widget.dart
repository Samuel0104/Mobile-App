import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'services/database.dart';

mixin ScoreDialog {
  var scores = [].obs;
  var fetch = {}.obs;

  Future<void> getScores(int i) async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File("${dir.path}/scores.json");
    final response = await file.readAsString();
    final jsonRead = await jsonDecode(response);
    var data = jsonRead["game$i"]["scores"];
    for (var score = 0; score < 5 && score < data.length; ++score) {
      scores.add(data[data.length - score - 1]);
    }
    var d = await DatabaseService().getUserData();
    for (var name in d.keys) {
      if (name == jsonRead["name"]) {
        fetch.value = d[name];
      }
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
    fetch["game$i"][DateTime.now().toString()] = val;
    DatabaseService().updateUserData(
        jsonRead["name"], false, fetch["game1"], fetch["game2"]);
  }
}
