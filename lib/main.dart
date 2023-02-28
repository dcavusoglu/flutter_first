import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(FirstFlutter());
}

class FirstFlutter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FirstFlutterState();
  }
}

class _FirstFlutterState extends State<FirstFlutter> {
  final _questions = const [
    {
      'questionText': 'What\'s your fav color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'White', 'score': 1},
        {'text': 'Purple', 'score': 5},
      ],
    },
    {
      'questionText': 'What\'s your fav drink?',
      'answers': [
        {'text': 'Water', 'score': 1},
        {'text': 'Beer', 'score': 10},
        {'text': 'Wine', 'score': 5},
      ],
    },
    {
      'questionText': 'What\'s your fav exercise?',
      'answers': [
        {'text': 'Walking', 'score': 1},
        {'text': 'Yoga', 'score': 5},
        {'text': 'Football', 'score': 10},
      ],
    },
    {
      'questionText': 'What\'s your fav animal?',
      'answers': [
        {'text': 'Cat', 'score': 10},
        {'text': 'Dog', 'score': 5},
        {'text': 'Bird', 'score': 1},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;
  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_totalScore);
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first flutter app'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
