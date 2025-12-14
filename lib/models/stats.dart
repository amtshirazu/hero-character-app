
mixin stats {

  int _points = 10;

  //properties
  int _health = 10 ;
  int _attack = 10 ;
  int _defense = 10;
  int _skill = 10;


  void increaseStats (String properties){
    if( _points > 0) {
      switch (properties) {
        case "health" :
          _health++;

        case "attack" :
          _attack++;

        case "defense" :
          _defense++;

        case "skill" :
          _skill++;

      }
      _points--;
    }
  }

  void decreaseStats (String properties){
    if( properties == "health" && _health > 5) {
        _health--;
        _points++;
    }

    if( properties == "attack" && _attack > 5) {
        _attack--;
        _points++;
    }

    if( properties == "defense" && _defense > 5) {
        _defense--;
        _points++;
    }

    if( properties == "skill" && _skill > 5) {
        _skill--;
        _points++;
    }
  }



  //getters
  int get points => _points;

  Map<String,int> get statsAsMap => {
    "health" : _health,
    "attack" : _attack,
    "defense" : _defense,
    "skill" : _skill,
  };


  List<Map<String,String>> get statsAsList => [
      {"title":"health" , "value": _health.toString()},
      {"title":"attack" , "value": _attack.toString()},
      {"title":"defense" , "value": _defense.toString()},
      {"title":"skill" , "value": _skill.toString()},
  ];



}

