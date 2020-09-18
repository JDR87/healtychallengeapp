import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:healtychallengeapp/models/usuario.dart';

class UsuarioScreen extends StatefulWidget {
  final Usuario usuario;
  UsuarioScreen(this.usuario);
  @override
  _UsuarioScreenState createState() => _UsuarioScreenState();
}
final usuarioReference = FirebaseDatabase.instance.reference().child('usuario');
class _UsuarioScreenState extends State<UsuarioScreen> {
  List<Usuario> itemsRoutines;

  TextEditingController _nombreController;
  TextEditingController _apellidoController;
  TextEditingController _emailController;
  TextEditingController _passwordController;
  TextEditingController _telefonoController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nombreController = new TextEditingController(text: widget.usuario.nombre);
    _apellidoController = new TextEditingController(text: widget.usuario.apellido);
    _emailController = new TextEditingController(text: widget.usuario.email);
    _passwordController = new TextEditingController(text: widget.usuario.password);
    _telefonoController = new TextEditingController(text: widget.usuario.telefono);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Usuarios '),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: Container(
        height: 600.0,
        padding: const EdgeInsets.all(10.0),
        child: Card(
          child: Center(
            child: Column(
              children: <Widget>[
                TextField(
                  controller: _nombreController,
                  style: TextStyle(fontSize:10.0,color: Colors.green),
                  decoration: InputDecoration(icon: Icon(Icons.person),labelText: 'Nombre '),
                ),
                Padding(padding: EdgeInsets.only(top: 5.0)),
                Divider(),
                TextField(
                  controller: _apellidoController,
                  style: TextStyle(fontSize: 14.0,color: Colors.green),
                  decoration: InputDecoration(icon: Icon(Icons.person),labelText: 'Apellido'),
                ),
                Padding(padding: EdgeInsets.only(top: 5.0)),
                Divider(),
                TextField(
                  controller: _emailController,
                  style: TextStyle(fontSize: 14.0,color: Colors.green),
                  decoration: InputDecoration(icon: Icon(Icons.person),labelText: 'Email'),
                ),
                Padding(padding: EdgeInsets.only(top: 5.0)),
                Divider(),
                TextField(
                  controller: _passwordController,
                  style: TextStyle(fontSize: 14.0,color: Colors.green),
                  decoration: InputDecoration(icon: Icon(Icons.person),labelText: 'Password'),
                ),
                Padding(padding: EdgeInsets.only(top: 5.0)),
                Divider(),
                TextField(
                  controller: _telefonoController,
                  style: TextStyle(fontSize: 14.0,color: Colors.green),
                  decoration: InputDecoration(icon: Icon(Icons.person),labelText: 'Telefono'),
                ),
                Padding(padding: EdgeInsets.only(top: 5.0)),
                Divider(),
                FlatButton(
                    onPressed: (){
                      if(widget.usuario.id !=null){
                        usuarioReference.child(widget.usuario.id).set({
                          'nombre': _nombreController.text,
                          'apellido': _apellidoController.text,
                          'email': _emailController.text,
                          'password': _passwordController.text,
                          'telefono': _telefonoController.text

                        }).then((_){
                          Navigator.pop(context);
                        });
                      }else{
                        usuarioReference.push().set({
                          'nombre': _nombreController.text,
                          'apellido': _apellidoController.text,
                          'email': _emailController.text,
                          'password': _passwordController.text,
                          'telefono': _telefonoController.text
                        }).then((_){
                          Navigator.pop(context);
                        });
                      }
                    },
                    child: (widget.usuario.id != null) ? Text('Update'):Text('Add')),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
