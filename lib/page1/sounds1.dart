import 'package:flutter/services.dart';
import 'package:soundpool/soundpool.dart';

class Sound {
  Sound();
  Soundpool pool = Soundpool.fromOptions();
  var soundId = [];

  Future<void> setSound() async {
    for (var i = 0; i < 9; ++i) {
      soundId.add(await rootBundle
          .load("assets/sounds/button${i + 1}.mp3")
          .then((ByteData soundData) {
        return pool.load(soundData);
      }));
    }
    soundId.add(await rootBundle
        .load("assets/sounds/lose.mp3")
        .then((ByteData soundData) {
      return pool.load(soundData);
    }));
  }

  Future<void> play(int i) async {
    int streamId = await pool.play(soundId[i]);
  }
}
