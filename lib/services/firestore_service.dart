import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/characters.dart';

class FirestoreService {

  static final _db = FirebaseFirestore.instance
      .collection("characters")
      .withConverter(
      fromFirestore: Character.fromFirestore,
      toFirestore: (Character c, _) => c.toFireStore(),
  );


  // add a new character
  static Future<void> addCharacter(Character character) async {
    try {
      await _db.doc(character.id).set(character);
    } catch (e) {
      print("ERROR: $e");
    }
  }

  // get characters once
  static Future<QuerySnapshot<Character>> getAllCharactersOnce() async {
    return  _db.get();
  }

  // update  a character
   static Future<void> updateCharacter(Character character) async {

     await _db.doc(character.id).update({
       "stats" : character.statsAsMap,
       "points" : character.points,
       "skills" : character.skills.map((s) => s.id).toList(),
       "isFav" : character.fav,
     });
   }

  // delete  a character
  static Future<void> deleteCharacter(Character character) async {
    try {
      await _db.doc(character.id).delete();
    } catch (e) {
      print("ERROR: $e");
    }
  }



}