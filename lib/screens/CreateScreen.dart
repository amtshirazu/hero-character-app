import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hero_characters/services/character_store.dart';
import 'package:hero_characters/services/themes.dart';
import 'package:hero_characters/services/vocationCard.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import '../models/characters.dart';
import '../models/vocation.dart';
import '../services/styledButton.dart';
import '../services/styledVariousText.dart';

var uuid = Uuid();

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final _nameController = TextEditingController();
  final _sloganController = TextEditingController();
  Vocation? selectedVocation;

  @override
  void dispose() {
    _nameController.dispose();
    _sloganController.dispose();
    super.dispose();
  }

  void updateVocation(Vocation vocation) {
    setState(() {
      selectedVocation = vocation;
    });
  }

  void handleSubmit() {
    if (_nameController.text.trim().isEmpty) {
      showDialog(context: context, builder: (ctx) {
        return AlertDialog(
          title: StyledHeading("Missing character name"),
          content: StyledText("Every good RPG character needs a good name...."),
          actions: [
            StyledButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: StyledHeading("Close"),
            )
          ],
          actionsAlignment: MainAxisAlignment.center,
        );
      });
      return;
    }


    if (_sloganController.text.trim().isEmpty) {
      showDialog(context: context, builder: (ctx) {
        return AlertDialog(
          title: StyledTitle("Missing character slogan"),
          content: StyledHeading("Remember to add a catchy slogan...."),
          actions: [
            StyledButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: StyledText("Close"),
            ),
          ],
          actionsAlignment: MainAxisAlignment.center,
        );
      });
      return;
    }



    Provider.of<CharacterStore>(context, listen: false).addCharacter(
      Character(
          id: uuid.v4(),
          name: _nameController.text.trim(),
          slogan: _sloganController.text.trim(),
          vocation: selectedVocation!,
      )
    );

    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StyledTitle("Create a Character"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Icon(
                  Icons.code,
                  color: AppColors.primaryAccent,
                  size: 40,
                ),
              ),
              Center(
                child: StyledTitle("WELCOME, NEW PLAYER."),
              ),
              Center(
                child: StyledText("Create a name and slogan for your character"),
              ),
              SizedBox(height: 30),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person_2, size: 32),
                  label: StyledText("Character name"),
                ),
                cursorColor: AppColors.textColor,
                style: GoogleFonts.kanit(
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _sloganController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.chat, size: 26),
                  label: StyledText("Character slogan"),
                ),
                cursorColor: AppColors.textColor,
                style: GoogleFonts.kanit(
                  textStyle: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              SizedBox(height: 50),
              Center(
                child: Icon(
                  Icons.code,
                  color: AppColors.primaryAccent,
                  size: 40,
                ),
              ),
              Center(
                child: StyledTitle("Choose a vocation"),
              ),
              Center(
                child: StyledText("This determines the skills you would have"),
              ),

              SizedBox(height: 30),

              VocationCard(
                selected: selectedVocation == Vocation.junkie,
                update: updateVocation,
                vocation: Vocation.junkie,
              ),
              VocationCard(
                selected: selectedVocation == Vocation.raider,
                update: updateVocation,
                vocation: Vocation.raider,
              ),
              VocationCard(
                selected: selectedVocation == Vocation.wizard,
                update: updateVocation,
                vocation: Vocation.wizard,
              ),
              VocationCard(
                selected: selectedVocation == Vocation.ninja,
                update: updateVocation,
                vocation: Vocation.ninja,
              ),

              SizedBox(height: 30),
              Center(
                child: StyledButton(
                  onPressed: handleSubmit,
                  child: StyledHeading("Create"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}