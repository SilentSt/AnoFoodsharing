import 'package:flutter/material.dart';
import '../widgets.dart';

class MultipleChoiceQuestion extends StatefulWidget {
  const MultipleChoiceQuestion({
    Key? key,
    required this.names, required this.text,
  }) : super(key: key);
  final String text;
  final List<String> names;

  @override
  State<MultipleChoiceQuestion> createState() => _MultipleChoiceQuestionState();
}

class _MultipleChoiceQuestionState extends State<MultipleChoiceQuestion> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.text,
          style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 20,),
        Column(
            children: widget.names.map((e) => ChoiceQuestion(text: e))
                .toList())
      ],
    );
  }
}