import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:healtychallengeapp/models/routine.dart';



class RoutineInformation extends StatefulWidget {
  final Routine routine;
  RoutineInformation(this.routine);
  @override
  _RoutineInformationState createState() => _RoutineInformationState();
}

final routineReference = FirebaseDatabase.instance.reference().child('routine');

class _RoutineInformationState extends State<RoutineInformation> {

  List<Routine> itemsRoutine;

 // String productImage;//nuevo

  @override
  void initState() {   
    super.initState();
  ///  productImage = widget.product.productImage;//nuevo
  //  print(productImage);//nuevo
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informacion de Rutina'),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Container(
        height: 800.0,
        padding: const EdgeInsets.all(20.0),
        child: Card(
          child: Center(
            child: Column(
              children: <Widget>[                
                new Text("Nombre Rutina : ${widget.routine.nameactivity}", style: TextStyle(fontSize: 18.0),),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                new Text("Descripcion : ${widget.routine.description}", style: TextStyle(fontSize: 18.0),),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                new Text("Nivel : ${widget.routine.level}", style: TextStyle(fontSize: 18.0),),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                new Text("Objetivo : ${widget.routine.objective}", style: TextStyle(fontSize: 18.0),),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                new Text("Rutina : ${widget.routine.challenge}", style: TextStyle(fontSize: 18.0),),
                Divider(),
                new Text("Reto : ${widget.routine.perform}", style: TextStyle(fontSize: 18.0),),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                new Text("Parte del Cuerpo : ${widget.routine.bodypart}", style: TextStyle(fontSize: 18.0),),
                Divider(),
         /*       Container(
                          height: 300.0,
                          width: 300.0,
              child: Center(
                child: productImage == ''
                    ? Text('No Image')
                    : Image.network(productImage+'?alt=media'),//nuevo para traer la imagen de firestore
              ),
            ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
