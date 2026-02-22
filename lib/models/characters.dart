import 'package:cloud_firestore/cloud_firestore.dart';
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

   //character to firestore
   Map<String,dynamic> toFireStore () {
     return {
       'name': name,
       'slogan': slogan,
       'isFav': _isFav,
       'vocation': vocation.toString(),
       'skills': skills.map((s) => s.id).toList(),
       'stats': statsAsMap,
       'points': points,
     };
   }

   //character from firestore
   factory Character.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot,SnapshotOptions? options) {

     final data = snapshot.data()!;

     Character character = Character(
         id: snapshot.id,
         name: data["name"],
         slogan: data["slogan"],
         vocation: Vocation.values.firstWhere((v) => v.toString() == data["vocation"] ),
     );


     //update skill
     for (String id in List<String>.from(data["skills"])) {
       Skill skill = allSkills.firstWhere(
          (val) => val.id == id,
         orElse: () => throw Exception("Skill not found: $id"),
       );
       character.updateSkill(skill);
     }

     //set isFav
     if(data["isFav"] == true){
       character.toggleIsFav();
     }

     character.setStats(points: data["points"], stats: data["stats"]);

     return character;
   }


   bool get fav => _isFav;

}

