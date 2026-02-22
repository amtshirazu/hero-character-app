import 'package:flutter/material.dart';
import 'package:hero_characters/screens/CreateScreen.dart';
import 'package:hero_characters/services/CardWidget.dart';
import 'package:hero_characters/services/styledVariousText.dart';
import 'package:provider/provider.dart';
import '../models/characters.dart';
import '../services/styledButton.dart';
import 'package:hero_characters/services/character_store.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {

    Provider.of<CharacterStore>(context, listen: false)
     .fetchAllCharacters();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StyledTitle("Characters"),
        centerTitle: true,
      ),

      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [


            Expanded(
              child: Consumer<CharacterStore>(
                builder: (context, store, child) {
                  final characters = store.characters;

                  return ListView.builder(
                    itemCount: characters.length,
                    itemBuilder: (context, index) {
                      final character = characters[index];

                      return Dismissible(
                        key: ValueKey(character.id),
                        onDismissed: (direction) {
                          store.deleteCharacter(character);
                        },
                        child: CardWidget(character),
                      );
                    },
                  );
                },
              ),
            ),
            
            StyledButton(
                onPressed: () async {
                  final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (ctx) => const CreateScreen(),
                  ));


                  if(result == true) {
                    setState(() {});
                  }
                },
                child: StyledHeading("create character"),
            )

          ],
        ),
      ),
    );
  }
}



