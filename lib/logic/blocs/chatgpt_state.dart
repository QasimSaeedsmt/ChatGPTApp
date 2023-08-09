abstract class ChatGptState {}

class InitialState extends ChatGptState {}

class FetchingAnswerState extends ChatGptState {}

class FetchedAnswerState extends ChatGptState {
  final String answer;

  FetchedAnswerState(this.answer);
}

class ErrorState extends ChatGptState {
  final String message;

  ErrorState(this.message);
}
