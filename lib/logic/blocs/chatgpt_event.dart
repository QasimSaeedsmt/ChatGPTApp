abstract class ChatGptEvent {}

class FetchAnswerEvent extends ChatGptEvent {
  final String question;

  FetchAnswerEvent(this.question);
}
