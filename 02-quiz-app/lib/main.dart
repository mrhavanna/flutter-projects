import 'package:flutter/material.dart';
import '../widget/question.dart';
import '../widget/answer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  // Definiere eine Liste mit einer Map
  var qa = [
    {
      'questionText': 'Was ist dein Lieblingsessen?',
      'answers': [
        'Cordon Bleu',
        'Thai Chicken Satay',
        'Manchurian  Chicken',
        'Rosenkohl und Kartoffelpüree'
      ],
    },
    {
      'questionText': 'Was ist dein Lieblingstier?',
      'answers': ['Hase', 'Schlange', 'Elefant', 'Löwe'],
    },
    {
      'questionText': 'Wie heisst dein Lieblingsfilm',
      'answers': ['Ready Player 1', 'Matrix', 'Minority Report', 'Al Capone'],
    },
  ];

  void _answerQuestion() {
    setState(() {
      _questionIndex = (_questionIndex + 1) % 3;
    });
  }

  int _questionIndex = 2;

  @override
  build(BuildContext context) {
    return (MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Meine App')),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Question(qa[_questionIndex]['questionText'].toString()),
            ),

            // hole das Element aus questionIndex und dort die anwers
            // und zwar als Liste von Strings.
            // diese werden mit .map(answer) "gemappt", d.h. für jede answer wird
            // der Code ausgeführt:
            // return Anwer.... also gib ein Answer Widget zurück

            // Das ganze wird mit (....).toList() in eine Liste verwandelt die dann mit dem
            //...  Spread Operator in einzelne Objekte aufgeteilt wird.
            //... teilt eine Liste in einzelne Objekte auf.

            ...(qa[_questionIndex]['answers'] as List<String>).map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList()
          ],
        ),
      ),
    ));
  }
}
