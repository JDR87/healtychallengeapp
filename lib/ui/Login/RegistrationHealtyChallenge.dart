import 'package:flutter/material.dart';
import 'package:healtychallengeapp/components/rounded_button.dart';
import 'package:healtychallengeapp/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:healtychallengeapp/models/user.dart';
import 'package:healtychallengeapp/utils/databasehelper.dart';

import 'ChatHealtyChallenge.dart';
import 'LogiinHealtyChallenge.dart';
class RegistrationHealtyChallenge extends StatefulWidget {
  static const String id = 'registration_healtychallenge';

  @override
  _RegistrationHealtyChallengeState createState() => _RegistrationHealtyChallengeState();
}

final  _auth = FirebaseAuth.instance;
class _RegistrationHealtyChallengeState extends State<RegistrationHealtyChallenge> {

  final newNombre = TextEditingController();
  final newApellido = TextEditingController();
  final newEmail = TextEditingController();
  final newPassword = TextEditingController();

  Usuario _user = Usuario();
  List<Usuario> _registers = [];
  DatabaseHelper _dbHelper = DatabaseHelper.instance;



  bool state = false;
  String nombre;
  String apellido;
  String email;
  String password;
  final formkey = GlobalKey<FormState>();

  get context => null;

  @override
  void initState() {
    super.initState();
   ///* _resetForm();
    _dbHelper = DatabaseHelper.instance;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: Padding(

        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: ListView(
          //mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[

            SizedBox(
              height: 48.0,
            ),
            TextFormField(
              controller: newNombre,
              keyboardType: TextInputType.text,
              textAlign: TextAlign.center,
              onChanged: (value) {
                nombre=value;
              },
              onSaved: (newValue) {
               _user.name = newValue;
              },
              // ignore: missing_return
              validator: (value){
                if(value.isEmpty)return "Campo requerido";
              },
              decoration:KTextFieldDecoration.copyWith(hintText: 'Ingrese tu nombre'),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextFormField(
              controller: newApellido,
              keyboardType: TextInputType.text,
              textAlign: TextAlign.center,
              onChanged: (value) {
                apellido=value;
              },
              onSaved: (newValue) {
                  _user.lastname = newValue;
              },
              // ignore: missing_return
              validator: (value){
                if(value.isEmpty)return "Campo requerido";
              },
              decoration:KTextFieldDecoration.copyWith(hintText: 'Ingrese tu Apellido'),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextFormField(
              controller: newEmail,
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value) {
                email=value;
              },
              onSaved: (newValue) {
                 _user.mail = newValue;
              },
              // ignore: missing_return
              validator: (value){
                if(value.isEmpty)return "Campo requerido";
              },
              decoration:KTextFieldDecoration.copyWith(hintText: 'Ingrese tu Correo'),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextFormField(
              controller: newPassword,
              obscureText: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                password=value;
              },
              onSaved: (newValue) {
              _user.pass = newValue;
              },
              // ignore: missing_return
              validator: (value){
                if(value.isEmpty)return "Campo requerido";
                if(value.length < 6)return "La contraseña debe tener más de 5 caracteres";
              },
              decoration:KTextFieldDecoration.copyWith(hintText: 'Ingrese su Password'),
            ),
            SizedBox(
              height: 24.0,
            ),
            RoundedButton(
              title: 'Registrar',
              colour: Colors.orange,
              onPressed: () async{

                print(nombre);
                print(apellido);
                print(email);
                print(password);
                print(context.toString());
                //_saveInformation(context);
              //  Navigator.pushNamed(context, RegistrationHealtyChallenge.id);
              },
            ),
            SizedBox(
              height: 24.0,
            ),
            Text("Sus datos personales han sido y están siendo tratados conforme con la Política de Tratamiento de Datos Personales. Para mayor información podrá consultar nuestra política en: ",
                style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, color: Colors.blue)),
          ],
        ),
      ),
    );
  }

  void _saveInformation(BuildContext context) async{
    if(formkey.currentState.validate()){
      formkey.currentState.save();
      if(_user.id == null) await _dbHelper.insertContact(_user);
      else await _dbHelper.updateContact(_user);
      _refreshContactsList();

      print(_user.name);


      //Para subir la información a Firebase
      try{
        final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
        if(newUser != null){
          Navigator.pushNamed(context, LoginHealtyChallenge.id);
          _resetForm();
        }
      }catch(e){
        print(e);
      }


    }
  }
  void _showHomePage(BuildContext context) {
    Navigator.pushNamed(context, ChatHealtyChallenge.id);
  }
  _refreshContactsList() async{
    List<Usuario> x = await _dbHelper.fetchRegisters();
    setState(() {
      _registers = x;
    });
  }
  _resetForm() {
    setState(() {
      formkey.currentState.reset();
      newEmail.clear();
      newPassword.clear();
    });
  }
}