
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled4/logic/blocs/chatgpt_bloc.dart';

import '../logic/blocs/chatgpt_event.dart';
import '../logic/blocs/chatgpt_state.dart';
import 'answer_screen.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final questionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Answer from ChatGPT')),
      body: Column(
        children: [
          BlocBuilder<ChatGptBloc, ChatGptState>(
            builder: (context, state) {
              if (state is FetchingAnswerState) {
                return const CircularProgressIndicator();
              } else if (state is FetchedAnswerState) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(state.answer),
                );
              } else if (state is ErrorState) {
                return Text(state.message);
              } else {
                return TextFormField(
                  decoration: const InputDecoration(
                      labelText: "Ask Question"
                  ),
                );
              }
            },
          ),
          ElevatedButton(
            child: const Text('Get Answer'),
            onPressed: () {
              context.read<ChatGptBloc>().add(FetchAnswerEvent(questionController.text));
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AnswerScreen()),
              );

            },
          ),

        ],
      ),
    );
  }

}