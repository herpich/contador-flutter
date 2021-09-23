import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(title: "Contador de Pessoas", home: Home()));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _numAlunos = 0; //_ para indicar que é acessível apenas aqui dentro
  String _infoText = "Pode Entrar!";

  void _changeAlunos(int delta) {
    setState(() {
      //  manda atualizar a tela (só a parte modificada do código)
      _numAlunos += delta; //executar o incremento

      if (_numAlunos < 0) {
        _infoText = "Mundo invertido?";
      } else if (_numAlunos <= 10) {
        _infoText = "Pode Entrar!";
      } else {
        _infoText = "Lotado!!!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/sala.jpg",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        //agora adicione <como filho> a outra parte do código já desenvolvida
        Column(
          // inclua o widget coluna
          mainAxisAlignment:
              MainAxisAlignment.center, //centralizando os widgets
          children: <Widget>[
            //adicione um children
            Text(
              // e inclua um widget de text
              "Pessoas: $_numAlunos", // adicione um texto
              style: TextStyle(
                  color: Colors.white, // cor do texto
                  fontWeight: FontWeight.bold), //configure o estilo do texto
            ),
            Row(
                //Crie uma linha dentro da coluna
                mainAxisAlignment:
                    MainAxisAlignment.center, //centralizando os widgets
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(
                        10.0), //adicionando espaço igual nas laterais
                    child: FlatButton(
                      //adicione um FlatButton
                      child: Text(
                        //adicione o texto +1
                        "+1",
                        style: TextStyle(fontSize: 40.0, color: Colors.white),
                      ),
                      onPressed: () {
                        _changeAlunos(1);
                        //debugPrint("+1");
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(
                        10.0), //adicionando espaço igual nas laterais
                    child: FlatButton(
                      //adicione um FlatButton
                      child: Text(
                        //adicione o texto +1
                        "-1",
                        style: TextStyle(fontSize: 40.0, color: Colors.white),
                      ),
                      onPressed: () {
                        _changeAlunos(-1);
                        //debugPrint("-1");
                      },
                    ),
                  ),
                ]),
            Text(
              // inclua um outro widget de texto
              _infoText, // adicione um texto
              style: TextStyle(
                  //configure o estilo do texto
                  color: Colors.white, // cor do texto
                  fontStyle: FontStyle
                      .italic, //configure o estilo do texto e o tamanho
                  fontSize: 30.0), //configure o tamanho
            ),
          ],
        )
      ],
    );
  }
}
