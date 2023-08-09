import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'chatgpt_event.dart';
import 'chatgpt_state.dart';

class ChatGptBloc extends Bloc<ChatGptEvent, ChatGptState> {
  ChatGptBloc() : super(InitialState()) {
    on<FetchAnswerEvent>(_onFetchAnswerEvent);
  }

  Future<void> _onFetchAnswerEvent(FetchAnswerEvent event, Emitter<ChatGptState> emit) async {
    emit(FetchingAnswerState());

    const endpoint = 'https://api.openai.com/v1/engines/davinci/completions';
    final headers = {
      'Authorization': 'Bearer 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',
      'Content-Type': 'application/json',
    };


    try {
      final response = await http.post(
        Uri.parse(endpoint),
        headers: headers,
        body: jsonEncode({'prompt': event.question, 'max_tokens': 150}),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        emit(FetchedAnswerState(responseData['choices'][0]['text'].trim()));
      } else {
        print(response.statusCode);
        emit(ErrorState('Error fetching answer.'));
      }
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}
