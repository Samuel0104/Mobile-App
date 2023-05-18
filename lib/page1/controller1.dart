import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';
import 'sounds1.dart';

class Controller1 extends GetxController {
  var score = 1.obs;
  var lose = false.obs;
  var playing = false.obs;
  var answer = [].obs;
  var current = 0.obs;
  var colors = [Colors.teal, Colors.lightBlue];
  var tiles = [for (var i = 0; i < 9; ++i) 0].obs;
  final sound = Sound();

  @override
  onInit() {
    super.onInit();
    sound.setSound();
  }

  checkMove(int tile) {
    if (tile != answer[current.value]) {
      lose.value = true;
      // sound.play(4);
    }
    current.value++;
  }

  void updateScore() {
    score.value++;
  }

  Future<void> checkTry() async {
    if (current.value == answer.length && lose.value == false) {
      updateScore();
      current.value = 0;
      playing.value = false;
      await Future.delayed(const Duration(seconds: 1));
      addTile();
    }
  }

  void attempt(int i) {
    sound.play(4);
    if (playing.value == true) {
      checkMove(i);
      checkTry();
    }
  }

  MaterialColor getColor(int i) {
    return colors[tiles[i]];
  }

  void changeColor(int i) {
    tiles[i] = tiles[i] == 0 ? 1 : 0;
  }

  Future<void> addTile() async {
    answer.add(Random().nextInt(9));
    for (var i = 0; i < score.value; ++i) {
      sound.play(4);
      if (i == 0) {
        await Future.delayed(const Duration(milliseconds: 50));
      }
      changeColor(answer[i]);
      await Future.delayed(const Duration(milliseconds: 450));
      changeColor(answer[i]);
      await Future.delayed(const Duration(milliseconds: 50));
    }
    playing.value = true;
  }

  void start() {
    if (answer.isEmpty) {
      addTile();
    }
  }

  void editJson() {}
}
