
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled4/logic/blocs/chatgpt_bloc.dart';

import 'UI/answer_screen.dart';
import 'UI/input_screen.dart';
import 'logic/blocs/chatgpt_event.dart';
import 'logic/blocs/chatgpt_state.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatGptBloc(),
      child: MaterialApp(
        title: 'ChatGPT Flutter App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: InputScreen(),
      ),
    );
  }
}
