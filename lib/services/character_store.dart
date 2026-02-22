import 'package:flutter/material.dart';
import 'package:hero_characters/services/firestore_service.dart';
import '../models/characters.dart';




class CharacterStore extends ChangeNotifier {

  final List<Character> characters = [];
  late Character? activeCharacter;

  Future<void> addCharacter(Character character) async {

    await FirestoreService.addCharacter(character);

    characters.add(character);
    notifyListeners();
  }

  void selectedCharacter(Character character){
    activeCharacter = character;
    notifyListeners();
  }

  // save(update) character
  Future<void> saveCharacter(Character character) async {
    await FirestoreService.updateCharacter(character);
    return;
  }

  //initially fetch character
  void fetchAllCharacters() async {

    if ( characters.isEmpty ) {
      final snapshot = await FirestoreService.getAllCharactersOnce();

      for(var doc in snapshot.docs) {
        characters.add(doc.data());
      }

      notifyListeners();
    }
  }

  //delete character
  void deleteCharacter(Character character) async{

    await FirestoreService.deleteCharacter(character);

    characters.remove(character);
    notifyListeners();
  }

}
