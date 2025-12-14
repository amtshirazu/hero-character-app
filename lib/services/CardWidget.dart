import 'package:flutter/material.dart';
import 'package:hero_characters/screens/profile.dart';
import 'package:hero_characters/services/styledVariousText.dart';
import 'package:hero_characters/services/themes.dart';
import '../models/characters.dart';




class CardWidget extends StatelessWidget {
  const CardWidget(this.character,{super.key});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 25,horizontal: 20),
        child: Row(
          children: [

            Image.asset(
              "lib/assets/img/vocations/${character.vocation.image}",
              width: 80,
            ),

            SizedBox(width: 25,),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StyledTitle(character.name),
                  StyledHeading(character.slogan),
                ]
              ),
            ),



            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                  return Profile(character: character);
                }));
              },

              icon: Icon(
                Icons.arrow_forward,
                color: AppColors.textColor,
                size: 30,
              ),
            )

          ],
        ),
      ),
    );;
  }
}
