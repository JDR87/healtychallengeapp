import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

//nuevo para imagenes
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:healtychallengeapp/components/rounded_button.dart';
import 'package:healtychallengeapp/models/routine.dart';
import 'package:image_picker/image_picker.dart';


//File image;
//String filename;

class RoutineScreen extends StatefulWidget {
  final Routine routine;
  RoutineScreen(this.routine);
  @override
  _RoutineScreenState createState() => _RoutineScreenState();
}

final routineReference = FirebaseDatabase.instance.reference().child('routine');

class _RoutineScreenState extends State<RoutineScreen> {

  List<Routine> itemsRoutines;

  TextEditingController _nameactivityController;
  TextEditingController _descriptionController;
  TextEditingController _levelController;
  TextEditingController _objectiveController;
  TextEditingController _challengeController;
  TextEditingController _performController;
  TextEditingController _bodypartController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameactivityController = new TextEditingController(text: widget.routine.nameactivity);
    _descriptionController = new TextEditingController(text: widget.routine.description);
    _levelController = new TextEditingController(text: widget.routine.level);
    _objectiveController = new TextEditingController(text: widget.routine.objective);
    _challengeController = new TextEditingController(text: widget.routine.challenge);
    _performController = new TextEditingController(text: widget.routine.perform);
    _bodypartController = new TextEditingController(text: widget.routine.bodypart);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Registrar Rutina'),
        backgroundColor: Colors.amberAccent
      ),
      body: Container(
        height: 900.0,
        padding: const EdgeInsets.all(2.0),
        child: Card(
          child:Center(
            child: Column(
                children: <Widget>[
               TextField(
                 controller: _nameactivityController,
                 style: TextStyle(fontSize:10.0,color: Colors.green),
                 decoration: InputDecoration(icon: Icon(Icons.person),labelText: 'Nombre de Rutina'),
               ),
                  Padding(padding: EdgeInsets.only(top: 5.0)),
                  Divider(),
                  TextField(
                    controller: _descriptionController,
                    style: TextStyle(fontSize: 14.0,color: Colors.green),
                    decoration: InputDecoration(icon: Icon(Icons.person),labelText: 'Descripcion'),
                  ),
                  Padding(padding: EdgeInsets.only(top: 5.0)),
                  Divider(),
                  TextField(
                    controller: _levelController,
                    style: TextStyle(fontSize: 14.0,color: Colors.green),
                    decoration: InputDecoration(icon: Icon(Icons.person),labelText: 'Nivel de Dificultad'),
                  ),
                  Padding(padding: EdgeInsets.only(top: 5.0)),
                  Divider(),
                  TextField(
                    controller: _objectiveController,
                    style: TextStyle(fontSize: 14.0,color: Colors.green),
                    decoration: InputDecoration(icon: Icon(Icons.person),labelText: 'Objetivo'),
                  ),
                  Padding(padding: EdgeInsets.only(top: 5.0)),
                  Divider(),
                  TextField(
                    controller: _challengeController,
                    style: TextStyle(fontSize: 14.0,color: Colors.green),
                    decoration: InputDecoration(icon: Icon(Icons.person),labelText: 'Desafio'),
                  ),
                  Padding(padding: EdgeInsets.only(top: 5.0)),
                  Divider(),
                  TextField(
                    controller: _performController,
                    style: TextStyle(fontSize: 14.0,color: Colors.green),
                    decoration: InputDecoration(icon: Icon(Icons.person),labelText: 'Retos'),
                  ),
                  Padding(padding: EdgeInsets.only(top: 5.0)),
                  Divider(),
                  TextField(
                    controller: _bodypartController,
                    style: TextStyle(fontSize: 14.0,color: Colors.green),
                    decoration: InputDecoration(icon: Icon(Icons.person),labelText: 'Lugar a ejercitar'),
                  ),
                  Padding(padding: EdgeInsets.only(top: 5.0)),
                  Divider(),
                  FlatButton(
                    onPressed: (){
                     if(widget.routine.id !=null){
                       routineReference.child(widget.routine.id).set({
                      'nameactivity': _nameactivityController.text,
                       'description': _descriptionController.text,
                       'level': _levelController.text,
                       'objective': _objectiveController.text,
                       'challenge': _challengeController.text,
                       'perform': _performController.text,
                       'bodypart': _bodypartController.text
                       }).then((_){
                         Navigator.pop(context);
                       });
                     }else{
                       routineReference.push().set({
                         'nameactivity': _nameactivityController.text,
                         'description': _descriptionController.text,
                         'level': _levelController.text,
                         'objective': _objectiveController.text,
                         'challenge': _challengeController.text,
                         'perform': _performController.text,
                         'bodypart': _bodypartController.text
                       }).then((_){
                         Navigator.pop(context);
                       });
                     }
                    },
                  child: (widget.routine.id!=null) ? Text('Update'):Text('Add')),

                  ],
            ),
          )
        ),
      ),

    );
  }
}
