import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:healtychallengeapp/models/usuario.dart';


class UsuarioInformation extends StatefulWidget {
  final Usuario usuario;
  UsuarioInformation(this.usuario);
  @override
  _UsuarioInformationState createState() => _UsuarioInformationState();
}

final usuarioReference = FirebaseDatabase.instance.reference().child('usuario');

class _UsuarioInformationState extends State<UsuarioInformation> {
  List<Usuario> itemsUsuario;

  @override
  void initState() {
        super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informacion de Usuario'),
backgroundColor: Colors.green,
      ),
      body: Container(
        height: 900.0,
        padding: const EdgeInsets.all(20.0),
        child: Card(
          child: Center(
            child: Column(
              children: <Widget>[
                new Text("Nombre Usuario : ${widget.usuario.nombre}", style: TextStyle(fontSize: 18.0),),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                new Text("Apellido : ${widget.usuario.apellido}", style: TextStyle(fontSize: 18.0),),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                new Text("Email : ${widget.usuario.email}", style: TextStyle(fontSize: 18.0),),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                new Text("Password : ${widget.usuario.password}", style: TextStyle(fontSize: 18.0),),
                Padding(padding: EdgeInsets.only(top: 8.0),),
                Divider(),
                new Text("Telefono : ${widget.usuario.telefono}", style: TextStyle(fontSize: 18.0),),
                Divider(),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
