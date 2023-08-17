part of 'home_cubit.dart';

class HomeState {
  List<Icon>? scoreKeeper;
  int? questionNumber;
  HomeState({this.scoreKeeper, this.questionNumber});

  HomeState copyWith({
    List<Icon>? scoreKeeper,
    int? questionNumber,}
  ) {
    return HomeState(
        questionNumber: questionNumber ?? this.questionNumber,
        scoreKeeper: scoreKeeper ?? this.scoreKeeper);
  }
}
