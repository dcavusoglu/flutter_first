import 'package:flutter/material.dart';
import './question.dart';

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
  var _questionIndex = 0;
  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      'What\'s your fav color?',
      'What\'s your fav drink?',
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first flutter app'),
        ),
        body: Column(children: [
          Question(
            questions[_questionIndex],
          ),
          ElevatedButton(
            child: Text('Answer 1'),
            onPressed: _answerQuestion,
          ),
          ElevatedButton(
            child: Text('Answer 2'),
            onPressed: _answerQuestion,
          ),
          ElevatedButton(
            child: Text('Answer 3'),
            onPressed: _answerQuestion,
          ),
        ]),
      ),
    );
  }
}
