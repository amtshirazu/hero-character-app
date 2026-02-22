import 'package:flutter/material.dart';
import 'package:hero_characters/services/character_store.dart';
import 'package:hero_characters/services/heart.dart';
import 'package:hero_characters/services/skill_list.dart';
import 'package:hero_characters/services/stats_table.dart';
import 'package:hero_characters/services/styledButton.dart';
import 'package:hero_characters/services/styledVariousText.dart';
import 'package:hero_characters/services/themes.dart';
import 'package:provider/provider.dart';
import '../models/characters.dart';

class Profile extends StatelessWidget {
  const Profile({required this.character, super.key});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: StyledTitle(character.name)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  color: AppColors.secondaryColor.withOpacity(0.3),
                  child: Row(
                    children: [
                      Hero(
                        tag: character.id.toString(),
                        child: Image.asset(
                          "lib/assets/img/vocations/${character.vocation.image}",
                          width: 140,
                          height: 140,
                        ),
                      ),

                      SizedBox(width: 15),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            StyledHeading(character.vocation.title),
                            StyledText(character.vocation.description),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Positioned(
                    top: 10,
                    right: 10,
                    child: Heart(character: character)
                ),

              ],


            ),

            SizedBox(height: 20),
            Icon(Icons.code, color: AppColors.primaryColor, size: 50),
            SizedBox(height: 20),

            Container(
              padding: EdgeInsets.all(16),
              color: AppColors.secondaryColor,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StyledHeading("Slogan"),
                  StyledText(character.slogan),
                  SizedBox(height: 16),
                  StyledHeading("Weapon of choice"),
                  StyledText(character.vocation.weapon),
                  SizedBox(height: 16),
                  StyledHeading("Unique ability"),
                  StyledText(character.vocation.ability),
                  SizedBox(height: 16),
                ],
              ),
            ),

            SizedBox(height: 30),

            // stats and skills
            Container(
              alignment: Alignment.center,
              child: Column(
                children: [StatsTable(character), SkillList(character)],
              ),
            ),
            SizedBox(height: 15),

            // save button
            StyledButton(
              onPressed: () {
                Provider.of<CharacterStore>(
                  context,
                  listen: false,
                ).saveCharacter(character);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: AppColors.secondaryColor,
                    content: Center(child: StyledHeading("Character saved.")),
                    duration: Duration(seconds: 2),
                    showCloseIcon: true,
                  ),
                );
              },
              child: StyledHeading("Save Character"),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
