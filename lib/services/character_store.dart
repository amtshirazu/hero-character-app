import 'package:flutter/material.dart';
import '../models/characters.dart';




class CharacterStore extends ChangeNotifier {

  final List<Character> characters = [];
  late Character? activeCharacter;

  void addCharacter(Character character){
    characters.add(character);
    notifyListeners();
  }

  void selectedCharacter(Character character){
    activeCharacter = character;
    notifyListeners();
  }

}
