import 'package:flutter/material.dart';
import 'package:healtychallengeapp/components/rounded_button.dart';
import 'package:healtychallengeapp/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'ChatHealtyChallenge.dart';
import 'RegistrationHealtyChallenge.dart';


class LoginHealtyChallenge extends StatefulWidget {

  static const String id = 'login_healtychallenge';
  @override
  _LoginHealtyChallengeState createState() => _LoginHealtyChallengeState();
}
final _auth = FirebaseAuth.instance;
class _LoginHealtyChallengeState extends State<LoginHealtyChallenge> {

  String email;
  String password;
  final newEmail = TextEditingController();
  final newPassword = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    //_resetForm();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag:'intro1',
              child: Container(
                height: 200.0,
                child: Image.asset('assets/img/intro1.jpg'),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextFormField(
              controller: newEmail,
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value) {
                email=value;
              },
              // ignore: missing_return
              validator: (value){
                if(value.isEmpty)return "Campo requerido";
              },
              decoration:KTextFieldDecoration.copyWith(hintText: 'Ingrese su Emal'),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextFormField(
              obscureText: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                password=value;
              },
              // ignore: missing_return
              validator: (value){
                if(value.isEmpty)return "Campo requerido";
              },
              decoration:KTextFieldDecoration.copyWith(hintText: 'Ingrese su Password'),
            ),
            SizedBox(
              height: 24.0,
            ),
            RoundedButton(
              title: 'Ingresar',
              colour: Colors.blueAccent,
              onPressed: (){
                _validateEntrance(context);
              Navigator.pushNamed(context, ChatHealtyChallenge.id);
              },
            ),
            FlatButton(
              onPressed: () {  },
              child: Text("¿Olvido su contraseña?",
                  style: TextStyle(fontSize: 20, color: Colors.blue,)),
            ),
          ],
        ),
      ),
    );
  }
  void _validateEntrance(BuildContext context) async {
    if(formkey.currentState.validate()){
      formkey.currentState.save();
      try{
        final user = await _auth.signInWithEmailAndPassword(email: email, password: password);
        if(user != null){
          Navigator.pushNamed(context, ChatHealtyChallenge.id);
        }
      }catch(e){print(e);}
      _resetForm();
    }
  }
  void _showRegisterPage(BuildContext context) {
    Navigator.pushNamed(context, RegistrationHealtyChallenge.id);
  }

  _resetForm() {
    formkey.currentState.reset();
    newEmail.clear();
    newPassword.clear();
  }

}