import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: HealtyChallengeOne(),
  ));
}

class HealtyChallengeOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Healty Challenge'),
        ),
        body: Container(
          padding: EdgeInsets.all(50.0),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/fondo.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Column(
                  children: [
                    Text(
                      'Agregar recordatorios',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 21.0,
                      ),
                    ),
                    Text(
                      'Determina el tiempo para tus rutinas',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
              ),
              Image(
                image: AssetImage('assets/images/intro1.jpg'),
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HealtyChallengeTwo()),
                  );
                },
              ),
            ],
          )),
        ),
      ),
    );
  }
}

class HealtyChallengeTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Healty Challenge'),
        ),
        body: Container(
          padding: EdgeInsets.all(50.0),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/fondo.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Column(
                  children: [
                    Text(
                      'Ejercitate',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 21.0,
                      ),
                    ),
                    Text(
                      'DElige tu Entrenador Preferido',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
              ),
              Image(
                image: AssetImage('assets/images/intro2.jpg'),
              ),
              Icon(
                Icons.linear_scale,
                color: Colors.black,
              ),
              FlatButton(
                textColor: Colors.white,
                color: Colors.cyan,
                child: Text(
                  'Atras',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HealtyChallengeThree()),
                  );
                },
              ),
            ],
          )),
        ),
      ),
    );
  }
}

class HealtyChallengeThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Healty Challenge'),
        ),
        body: Container(
          padding: EdgeInsets.all(50.0),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/fondo.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Column(
                  children: [
                    Text(
                      'Ve el Historial de tus rutinas',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 21.0,
                      ),
                    ),
                    Text(
                      'Determina el tiempo para tus rutinas',
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
                  'Atras',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              /*  FlatButton(
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
              ),*/
            ],
          )),
        ),
      ),
    );
  }
}
