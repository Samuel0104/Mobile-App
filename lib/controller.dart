import 'package:get/get.dart';

abstract class Controller extends GetxController {
  var score = 1.obs;
  var lose = false.obs;
  var playing = false.obs;

  void updateScore();
  void checkTry();

  @override
  void onInit() {
    super.onInit();
  }
}
