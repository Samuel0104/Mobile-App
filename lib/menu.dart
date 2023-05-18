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
          children: <Widget>[
            Expanded(
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(64),
                crossAxisSpacing: 16,
                mainAxisSpacing: 32,
                crossAxisCount: 1,
                children: <Widget>[
                  for (var i = 1; i <= 2; ++i)
                    Material(
                      color: Colors.teal,
                      elevation: 10,
                      borderRadius: BorderRadius.circular(16),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: InkWell(
                        onTap: () {
                          Get.toNamed("/game$i");
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Image(
                              image: AssetImage("assets/images/image.png"),
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(height: 6),
                            Text(
                              "Juego $i",
                              style: GoogleFonts.staatliches(
                                  fontSize: 24, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
