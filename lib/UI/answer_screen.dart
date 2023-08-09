import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../logic/blocs/chatgpt_bloc.dart';
import '../logic/blocs/chatgpt_state.dart';

class AnswerScreen extends StatelessWidget {
  const AnswerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Answer from ChatGPT')),
      body: BlocBuilder<ChatGptBloc, ChatGptState>(
        builder: (context, state) {
          if (state is FetchingAnswerState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is FetchedAnswerState) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(state.answer),
            );
          } else if (state is ErrorState) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: Text('Ask a question from the previous screen.'));
          }
        },
      ),
    );
  }
}
