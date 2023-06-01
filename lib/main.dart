import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'names.dart';
import 'stats.dart';
import 'themes.dart';
import 'home.dart';
import 'menu.dart';
import 'page1/game1.dart';
import 'page2/game2.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Proyecto",
      theme: Themes.light,
      darkTheme: Themes.dark,
      initialRoute: "/home",
      getPages: [
        GetPage(name: "/home", page: () => HomePage()),
        GetPage(name: "/names", page: () => NamesPage()),
        GetPage(name: "/stats", page: () => StatsPage()),
        GetPage(name: "/menu", page: () => const MenuPage()),
        GetPage(name: "/game1", page: () => Game1()),
        GetPage(name: "/game2", page: () => Game2()),
      ],
    );
  }
}
