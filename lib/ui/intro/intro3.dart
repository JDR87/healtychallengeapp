import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void main() => runApp(
      MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.white70,
          appBar: AppBar(
            title: Text('Healty Challenge'),
            backgroundColor: Colors.cyan[300],
          ),
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/fondo.png'),
              ),
            ),
            child: Descripcion(),
          ),
        ),
      ),
    );

class Descripcion extends StatefulWidget {
  @override
  _DescripcionState createState() => _DescripcionState();
}

class _DescripcionState extends State<Descripcion> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(100.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Column(
                children: [
                  Text(
                    'Verifica tu Progreso',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 21.0,
                    ),
                  ),
                  Text(
                    'Ve el Historial de tus rutinas',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
            ),
            Image(
              image: AssetImage('assets/images/intro3.jpg'),
            ),
            Icon(
              Icons.linear_scale,
              color: Colors.black,
            ),
            FlatButton(
              textColor: Colors.white,
              color: Colors.cyan,
              child: Text(
                'Siguiente',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
