import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

mixin ScoreDialog {
  var scores = [].obs;

  Future<void> getScores(int i) async {
    final String response = await rootBundle.loadString('assets/scores.json');
    final jsonRead = await json.decode(response);
    var data = jsonRead["game$i"]["scores"];
    data.sort();
    for (var score = 0; score < 5 && score < data.length; ++score) {
      scores.add(data[data.length - score - 1]);
    }
  }
}
