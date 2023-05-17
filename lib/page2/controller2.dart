import 'dart:async';
import 'package:get/get.dart';
import 'dart:math';
import 'sounds2.dart';

class Controller2 extends GetxController {
  var score = 10.obs;
  var lives = 5.obs;
  var lose = false.obs;
  var playing = false.obs;
  var current = (-1).obs;
  var selected = [for (var i = 0; i < 12; ++i) 0].obs;
  var tiles = [];
  final sound = Sound();

  @override
  onInit() {
    super.onInit();
    sound.setSound();
  }

  void updateScore() {
    score.value += 10;
  }

  Future<void> checkMove(int i) async {
    if (current.value == -1) {
      current.value = i;
      selected[i] = 1;
    } else if (selected[i] == 0) {
      selected[i] = 1;
      if (tiles[i] != tiles[current.value]) {
        await Future.delayed(const Duration(milliseconds: 450));
        lives.value -= 1;
        selected[i] = 0;
        selected[current.value] = 0;
        if (lives.value == 0) {
          lose.value = true;
        }
      } else {
        updateScore();
      }
      current.value = -1;
    }
  }

  Future<void> checkTry() async {
    if (selected.every((x) => x == 1) && (score.value - 10) % 60 == 0) {
      playing.value = false;
      await Future.delayed(const Duration(milliseconds: 450));
      show(0);
      await Future.delayed(const Duration(seconds: 1));
      setTiles();
    }
  }

  void attempt(int i) {
    sound.play(4);
    if (playing.value == true) {
      checkMove(i);
      checkTry();
    }
  }

  void show(int val) {
    for (var i = 0; i < 12; ++i) {
      selected[i] = val;
    }
  }

  Future<void> setTiles() async {
    var temp = [for (var i = 0; i < 12; ++i) i ~/ 2];
    tiles = [];
    for (var i = 0; i < 12; ++i) {
      int pos = Random().nextInt(12 - i);
      tiles.add("images/card${temp[pos] + 1}.png");
      temp.removeAt(pos);
    }
    await Future.delayed(const Duration(milliseconds: 50));
    show(1);
    await Future.delayed(const Duration(seconds: 4));
    show(0);
    await Future.delayed(const Duration(milliseconds: 50));
    playing.value = true;
  }

  String getTile(int i) {
    if (selected[i] == 1) {
      return tiles[i];
    } else {
      return "images/image.png";
    }
  }

  void start() {
    if (tiles.isEmpty) {
      setTiles();
    }
  }
}
