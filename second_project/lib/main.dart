import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';
import './result.dart';
import './quiz.dart';

void main() {
  runApp(MyApp());
}

//This Class can be changed
class MyApp extends StatefulWidget //PascalCase
{
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

//Persistent Class
class MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\' is your name?',
      'answers': [
        {'text': 'black', 'score': 10},
        {'text': 'green', 'score': 5},
        {'text': 'blue', 'score': 1}
      ],
    },
    {
      'questionText': 'What\' is your favourite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 2},
        {'text': 'Snake', 'score': 2},
        {'text': 'Lion', 'score': 5}
      ]
    },
    {
      'questionText': 'who\' is your favourite instructor?',
      'answers': [
        {'text': 'Rabbit', 'score': 5},
        {'text': 'Snake', 'score': 3},
        {'text': 'Lion', 'score': 2}
      ]
    },
  ];
  var questionIndex = 0;
  var _totalScore = 0;
  void _answerQuestion(int score) {
    if (questionIndex < _questions.length) {
      print('we have more questions!');
    }
    _totalScore = _totalScore + score;
    setState(() {
      questionIndex++;
    });
    print(questionIndex);
  }

  void _resetQuiz() {
    setState(() {
      questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Hello World!"),
          ),
          body: questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: questionIndex,
                  questions: _questions)
              : Result(_totalScore, _resetQuiz)),
    );
  }
}
