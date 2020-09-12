import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  State<StatefulWidget> createState(){
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp>{
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz(){
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score){

    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if(_questionIndex < _questions.length){
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  final _questions = const [
    {
      'questionText': '好きな色は何？',
      'answers': [
        {'text': '黒', 'score': 10},
        {'text': '赤', 'score': 5},
        {'text': '緑', 'score': 3},
        {'text': '白', 'score': 1},
      ],
    },
    {
      'questionText': '好きな動物は何？',
      'answers': [
        {'text': 'うさぎ', 'score': 5},
        {'text': 'へび', 'score': 3},
        {'text': 'ぞう', 'score': 1},
        {'text': 'ライオン', 'score': 10},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length ?
          Quiz(
            answerQuestion: _answerQuestion,
            questionIndex: _questionIndex,
            questions: _questions,
          ) : 
          Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
