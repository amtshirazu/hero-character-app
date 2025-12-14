import 'package:flutter/material.dart';
import 'package:hero_characters/models/characters.dart';
import 'package:hero_characters/models/skills.dart';
import 'package:hero_characters/models/vocation.dart';
import 'package:hero_characters/services/styledVariousText.dart';
import 'package:hero_characters/services/themes.dart';




class SkillList extends StatefulWidget {
  const SkillList(this.character,{super.key});

  final Character character;

  @override
  State<SkillList> createState() => _SkillListState();
}

class _SkillListState extends State<SkillList> {
  late List<Skill> filteredSkill;
  late String selectedSkill;


  @override
  void initState() {
    super.initState();
    filteredSkill = allSkills.where((skill) {
      return skill.vocation == widget.character.vocation;
    }).toList();

    selectedSkill = "";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Container(
        padding: EdgeInsets.all(8),
        color: AppColors.secondaryColor.withOpacity(0.5),
        child: Column(
          children: [
            StyledHeading("Choose an active skill"),
            StyledText("Skills are unique to your vocation"),
            SizedBox(height: 20,),


            Row(
              children: filteredSkill.map((skill) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedSkill =  skill.name;
                      widget.character.updateSkill(skill);
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: selectedSkill == skill.name ? AppColors.highlightColor : Colors.transparent,
                        width: 3,
                      ),
                    ),
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(3),
                    child: Image.asset(
                      "lib/assets/img/skills/${skill.image}",
                      width: 70,
                    ),
                  ),
                );
              }).toList(),
            ),

            SizedBox(height: 20,),
            StyledTitle(selectedSkill),


          ],
        )



      ),
    );
  }
}
