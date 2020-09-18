import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(PersonalDescripionHealtyChallenge());
Color colorone = Colors.cyan[300];

class PersonalDescripionHealtyChallenge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Perfil'),
          backgroundColor: colorone,
        ),
        body: PersonalDescripion(),
      ),
    );
  }
}

class PersonalDescripion extends StatefulWidget {
  @override
  _PersonalDescripionState createState() => _PersonalDescripionState();
}

class _PersonalDescripionState extends State<PersonalDescripion> {
  Row Fila({Object icono, String uno, String dos}) {
    return Row(
      children: [
        Icon(
          icono,
          color: Colors.pink[300],
        ),
        Text(
          uno,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 220.0,
        ),
        Text(
          dos,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 50.0,
                        //backgroundColor: Colors.yellow,
                        backgroundImage: AssetImage('assets/images/women.JPG'),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text(
                        'Alicia Gómez',
                        style: TextStyle(
                          fontFamily: 'Lobster',
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(children: [
                        Icon(Icons.phone),
                        Text(
                          '+57-310-1234567',
                          style: TextStyle(
                            fontFamily: 'BebasNeve',
                            color: Colors.black,
                            fontSize: 15.0,
                          ),
                        ),
                      ]),
                      Row(children: [
                        Icon(Icons.email),
                        Text(
                          'usuario@gmail.com',
                          style: TextStyle(
                            fontFamily: 'BebasNeve',
                            color: Colors.black,
                            fontSize: 15.0,
                          ),
                        ),
                      ]),
                      Row(
                        children: [
                          Icon(Icons.add_location),
                          Text(
                            'Colombia',
                            style: TextStyle(
                              fontFamily: 'BebasNeve',
                              color: Colors.black,
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 350.0,
              height: 50.0,
              child: Divider(
                color: Colors.black,
              ),
            ),
            Card(
              color: colorone,
              margin: EdgeInsets.all(10.0),
              child: Fila(
                  icono: Icons.assignment, uno: 'Actividad Completa', dos: '3'),
            ),
            Card(
              color: colorone,
              margin: EdgeInsets.all(10.0),
              child: Fila(
                  icono: Icons.battery_alert,
                  uno: 'Nivel',
                  dos: 'Principiante'),
            ),
            Card(
              color: colorone,
              margin: EdgeInsets.all(10.0),
              child: Fila(
                  icono: Icons.av_timer, uno: 'Objetivo', dos: 'Ganar Pesos'),
            ),
            Card(
              color: colorone,
              margin: EdgeInsets.all(10.0),
              child: Fila(icono: Icons.fitness_center, uno: 'Retos', dos: '4'),
            ),
            Card(
              color: colorone,
              margin: EdgeInsets.all(10.0),
              child: Fila(
                  icono: Icons.calendar_view_day, uno: 'Pendientes', dos: '4'),
            ),
            RaisedButton(
              color: Colors.pink[300],
              onPressed: () {},
              child: Text(
                'Conocer Peso Ideal',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
