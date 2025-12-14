import 'package:flutter/material.dart';
import 'package:hero_characters/models/vocation.dart';
import 'package:hero_characters/services/styledVariousText.dart';
import 'package:hero_characters/services/themes.dart';
import '../models/characters.dart';



class VocationCard extends StatelessWidget {
  const VocationCard({
    required this.vocation,
    required this.selected,
    super.key,
    required this.update
  });

  final Function(Vocation) update;
  final bool selected;
  final Vocation vocation;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        update(vocation);
      },
      child: Card(
        color: selected ? AppColors.primaryAccent : AppColors.secondaryColor.withOpacity(1),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 25,horizontal: 20),
          child: Row(
            children: [

              Image.asset(
                "lib/assets/img/vocations/${vocation.image}",
                width: 80,
              ),

              SizedBox(width: 25,),

              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      StyledTitle(vocation.title),
                      SizedBox(height: 5,),
                      StyledText(vocation.description),
                    ]
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
