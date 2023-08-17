import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
// import 'package:rflutter_alert/rflutter_alert.dart';

import '../../question.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit()
      : super(HomeState(
          questionNumber: 0,
          scoreKeeper: [],
        ));

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
    if (state.questionNumber! < _questionBank.length - 1) {
      emit(state.copyWith(questionNumber: state.questionNumber! + 1));
    }
  }

  String getQuestionText() {
    return _questionBank[state.questionNumber!].qText!;
  }

  bool getCorrectAnswer() {
    return _questionBank[state.questionNumber!].qAnswer!;
  }

  bool isFinished() {
    if (state.questionNumber! >= _questionBank.length - 1) {
      print('Now returning true');
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    emit(state.copyWith(questionNumber: state.questionNumber = 0));
  }

  void check(bool userPickedAnswer) {
    bool correctAnswer = getCorrectAnswer();
    final list = state.scoreKeeper!;

    if (isFinished() == true) {
      // Alert(
      //   context: context,
      //   title: 'Finished!',
      //   desc: 'You\'ve reached the end of the quiz.',
      //   image: Image.asset(
      //     'assets/images/logo.png',
      //     width: 150,
      //   ),
      // ).show();
      reset();
      state.scoreKeeper = [];
    } else {
      if (userPickedAnswer == correctAnswer) {
        list.add(
          Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
        emit(state.copyWith(scoreKeeper: list));
      } else {
        list.add(
          Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
        emit(state.copyWith(scoreKeeper: list));
      }
      nextQuestion();
    }
  }
}
