import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:async';

import 'package:healtychallengeapp/models/routine.dart';

import 'routine_information.dart';
import 'routine_screen.dart';


class ListViewRoutine extends StatefulWidget {

  @override
  _ListViewRoutineState createState() => _ListViewRoutineState();
}

final routineReference = FirebaseDatabase.instance.reference().child('routine');

class _ListViewRoutineState extends State<ListViewRoutine> {
  List<Routine> itemsRoutines;
  StreamSubscription<Event> _onRoutineAddedSubscription;
  StreamSubscription<Event> _onRoutineChangedSubscription;

  @override
  void initState() {
    super.initState();
    itemsRoutines = new List();
    _onRoutineAddedSubscription = routineReference.onChildAdded.listen(_onRoutineAdded);
    _onRoutineChangedSubscription = routineReference.onChildChanged.listen(_onRoutineUpdate);
  }

  @override
  void dispose() {
    super.dispose();
    _onRoutineAddedSubscription.cancel();
    _onRoutineChangedSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Lista de Rutinas'),
          centerTitle: true,
          backgroundColor: Colors.orangeAccent,
        ),
        body: Center(
          child: ListView.builder(
              itemCount: itemsRoutines.length,
              padding: EdgeInsets.only(top: 3.0),
              itemBuilder: (context, position) {
                return Column(
                  children: <Widget>[
                    Divider(
                      height: 1.0,
                    ),                    
                    Container(
                      padding: new EdgeInsets.all(3.0),
                      child: Card(                      
                        child: Row(
                          children: <Widget>[
                            //nuevo imagen
                            Expanded(
                              child: ListTile(
                                  title: Text(
                                    '${itemsRoutines[position].nameactivity}',
                                    style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontSize: 21.0,
                                    ),
                                  ),
                                  subtitle: Text(
                                    '${itemsRoutines[position].description}',
                                    style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 21.0,
                                    ),
                                  ),
                                  leading: Column(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.amberAccent,
                                        radius: 17.0,
                                        child: Text(
                                          '${[position +1]}',
                                          style: TextStyle(
                                            color: Colors.blueGrey,
                                            fontSize: 21.0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  onTap: () => _navigateToRoutineInformation(
                                      context, itemsRoutines[position])),
                            ),
                            IconButton(icon: Icon(Icons.delete, color: Colors.red,),
                                //onPressed: () => _showDialog(context, position),
                              onPressed: ()=> _deleteRoutine(context , itemsRoutines[position],position)),
                            //onPressed: () => _deleteProduct(context, items[position],position)),
                            IconButton(icon: Icon(Icons.remove_red_eye,color: Colors.blueAccent,),
                                onPressed: () =>
                                    _navigateToRoutine(context, itemsRoutines[position])),
                          ],
                        ),
                        color: Colors.white,
                      ),
                    ),
                  ],
                );
              }),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add, color: Colors.white,),
          backgroundColor: Colors.pinkAccent,
          onPressed: () => _createNewRoutine(context),
        ),
      ),
    );
  }

  //nuevo para que pregunte antes de eliminar un registro
 /* void _showDialog(context, position) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert'),
          content: Text('Are you sure you want to delete this item?'),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Colors.purple,
                ),
                onPressed: () =>
                  _deleteRoutine(context, itemsRoutines[position], position,),
                    ),                   
            new FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
*/
  void _onRoutineAdded(Event event) {
    setState(() {
      itemsRoutines.add(new Routine.fromSnapShot(event.snapshot));
    });
  }

  void _onRoutineUpdate(Event event) {
    var oldRoutineValue = itemsRoutines.singleWhere((routine) => routine.id == event.snapshot.key);
    setState(() {
      itemsRoutines[itemsRoutines.indexOf(oldRoutineValue)] = new Routine.fromSnapShot(event.snapshot);
    });
  }

  void _deleteRoutine(
      BuildContext context, Routine routine, int position) async {
    await routineReference.child(routine.id).remove().then((_) {
      setState(() {
        itemsRoutines.removeAt(position);
        //Navigator.of(context).pop();
      });
    });
  }

  void _navigateToRoutineInformation(
      BuildContext context, Routine routine) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RoutineScreen(routine)),
    );
  }

  void _navigateToRoutine(BuildContext context, Routine routine) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RoutineInformation(routine)),
    );
  }

  void _createNewRoutine(BuildContext context) async {
    await Navigator.push(context,
      MaterialPageRoute(builder: (context) => RoutineScreen(Routine(null,'','','','','','',''))),
    );
  }
  
}
