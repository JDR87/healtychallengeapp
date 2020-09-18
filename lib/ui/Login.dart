import 'package:flutter/material.dart';

import 'Login/ChatHealtyChallenge.dart';
import 'Login/LogiinHealtyChallenge.dart';
import 'Login/RegistrationHealtyChallenge.dart';
import 'Login/WelcomeHealtyChallenge.dart';



class HealtyChallenge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      initialRoute:  WelcomeHealtyChallenge.id,
      routes:{
        WelcomeHealtyChallenge.id:(context)=>WelcomeHealtyChallenge(),
        LoginHealtyChallenge.id:(context)=>LoginHealtyChallenge(),
        ChatHealtyChallenge.id:(context)=>ChatHealtyChallenge(),
        RegistrationHealtyChallenge.id:(context)=>RegistrationHealtyChallenge(),
      },
    );
  }
}







