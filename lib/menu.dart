import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menú de selección"),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Material(
                  color: Colors.teal,
                  elevation: 10,
                  borderRadius: BorderRadius.circular(16),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: InkWell(
                    onTap: () {
                      Get.toNamed("/game1");
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Image(
                          image: AssetImage("assets/images/image.png"),
                          width: 210,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          "Juego 1",
                          style: GoogleFonts.staatliches(
                              fontSize: 24, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
                Material(
                  color: Colors.teal,
                  elevation: 10,
                  borderRadius: BorderRadius.circular(16),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: InkWell(
                    onTap: () {
                      Get.toNamed("/game2");
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Image(
                          image: AssetImage("assets/images/image.png"),
                          width: 210,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          "Juego 2",
                          style: GoogleFonts.staatliches(
                              fontSize: 24, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Material(
                  color: Colors.teal,
                  elevation: 10,
                  borderRadius: BorderRadius.circular(16),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: InkWell(
                    onTap: () {
                      Get.toNamed("/game3");
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Image(
                          image: AssetImage("assets/images/image.png"),
                          width: 210,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          "Juego 3",
                          style: GoogleFonts.staatliches(
                              fontSize: 24, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
                Material(
                  color: Colors.teal,
                  elevation: 10,
                  borderRadius: BorderRadius.circular(16),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: InkWell(
                    onTap: () {
                      Get.toNamed("/game4");
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Image(
                          image: AssetImage("assets/images/image.png"),
                          width: 210,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          "Juego 4",
                          style: GoogleFonts.staatliches(
                              fontSize: 24, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
