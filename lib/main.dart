import 'package:flutter/material.dart';
import 'package:hero_characters/screens/CreateScreen.dart';
import 'package:hero_characters/services/character_store.dart';
import 'package:hero_characters/services/themes.dart';
import 'package:provider/provider.dart';
import 'screens/home.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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




