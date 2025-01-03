import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/text_bloc.dart';

class TextScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textBloc = context.read<TextBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Введіть текст'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (newText) {
                textBloc.add(UpdateTextEvent(newText));
              },
              decoration: const InputDecoration(
                labelText: 'Введіть текст',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            BlocBuilder<TextBloc, TextState>(
              builder: (context, state) {
                return Text(
                  'Введений текст: ${state.textValue}',
                  style: const TextStyle(fontSize: 18),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
