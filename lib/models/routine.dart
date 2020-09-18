import 'package:firebase_database/firebase_database.dart';


class Routine {
  String _id;
  String _nameactivity;
  String _description;
  String _level;
  String _objective;
  String _challenge;
  String _perform;
  String _bodypart;


  Routine(this._id, this._nameactivity, this._description, this._level,
      this._objective, this._challenge, this._perform, this._bodypart);

  Routine.map(dynamic obj){
    this._nameactivity = obj['nameactivity'];
    this._description = obj['description'];
    this._level = obj['level'];
    this._objective = obj['objective'];
    this._challenge = obj['challenge'];
    this._perform = obj['perform'];
    this._bodypart = obj['bodypart'];
  }

  String get id => _id;
  String get nameactivity => _nameactivity;
  String get description => _description;
  String get level => _level;
  String get objective => _objective;
  String get challenge => _challenge;
  String get perform => _perform;
  String get bodypart => _bodypart;

  Routine.fromSnapShot(DataSnapshot snapshot){
    _id = snapshot.key;
    _nameactivity = snapshot.value['nameactivity'];
    _description = snapshot.value['description'];
    _level = snapshot.value['level'];
    _objective = snapshot.value['objective'];
    _challenge = snapshot.value['challenge'];
    _perform = snapshot.value['perform'];
    _bodypart = snapshot.value['bodypart'];
  }
}
