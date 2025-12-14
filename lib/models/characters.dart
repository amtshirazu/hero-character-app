import 'package:hero_characters/models/skills.dart';
import 'package:hero_characters/models/stats.dart';
import 'package:hero_characters/models/vocation.dart';




class Character with stats {

  final Set<Skill> skills = {};
  final String id;
  final String name;
  final String slogan;
  bool _isFav = false;
  final Vocation vocation;


  Character({
    required this.id,
    required this.name,
    required this.slogan,
    required this.vocation,
});


   void toggleIsFav () {
     _isFav = !_isFav;
   }


   void updateSkill(Skill skill) {
     skills.clear();
     skills.add(skill);
   }


   bool get fav => _isFav;

}

