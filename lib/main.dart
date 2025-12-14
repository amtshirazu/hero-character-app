import 'package:flutter/material.dart';
import 'package:hero_characters/screens/CreateScreen.dart';
import 'package:hero_characters/services/character_store.dart';
import 'package:hero_characters/services/themes.dart';
import 'package:provider/provider.dart';
import 'screens/home.dart';




void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (_) => CharacterStore(),
          ),
        ],
        child: MyApp(),
    )
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: primaryTheme,
      home:  Home(),
    );
  }
}




