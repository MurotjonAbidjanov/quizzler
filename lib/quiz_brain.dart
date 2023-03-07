import 'package:quizzler/question.dart';

class QuizBrain {
  int _questionNumber = 0;

  List<Question> _questionBank = [
    Question('Человек состоит на 70% из воды.', true),
    Question('Пингвины умеют летать.', false),
    Question('В Кыргзстане 7 областей.', true),
    Question('Столица США - Вашингтон.', true),
    Question('Напалеон был высокоруслым полководцем.', false),
    Question('Pepsi появилась раньше чем Coca-Cola.', false),
    Question('Зажигалка была изобретена раньше спичек.', true),
    Question('Microsoft выпустил компьютер раньше чем Apple.', false),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].qText;
  }

  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].qAnswer;
  }

  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {
      print('Now returning true');
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}
