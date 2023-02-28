import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

void main() {
  runApp(FirstFlutter());
}

class FirstFlutter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FirstFlutterState();
  }
}

class _FirstFlutterState extends State<FirstFlutter> {
  final questions = const [
    {
      'questionText': 'What\'s your fav color?',
      'answers': ['Black', 'White', 'Purple'],
    },
    {
      'questionText': 'What\'s your fav drink?',
      'answers': ['Water', 'Beer', 'Wine'],
    },
    {
      'questionText': 'What\'s your fav exercise?',
      'answers': ['Walking', 'Yoga', 'Football'],
    },
    {
      'questionText': 'What\'s your fav animal?',
      'answers': ['Cat', 'Dog', 'Bird'],
    },
  ];

  var _questionIndex = 0;
  void _answerQuestion() {
    if (_questionIndex < questions.length) {}
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first flutter app'),
        ),
        body: _questionIndex < questions.length
            ? Column(children: [
                Question(
                  (questions[_questionIndex]['questionText'] as String),
                ),
                ...(questions[_questionIndex]['answers'] as List<String>)
                    .map((answer) {
                  return Answer(_answerQuestion, answer);
                }).toList()
              ])
            : Center(child: Text('You made it!')),
      ),
    );
  }
}
