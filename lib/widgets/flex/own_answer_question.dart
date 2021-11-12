import 'package:flutter/material.dart';
import '../widgets.dart';

class OwnAnswerQuestion extends StatefulWidget {
  const OwnAnswerQuestion({
    Key? key,
    required this.text,
    required this.pageSize,
  }) : super(key: key);
  final String text;
  final Size pageSize;

  @override
  State<OwnAnswerQuestion> createState() => _OwnAnswerQuestionState();
}

class _OwnAnswerQuestionState extends State<OwnAnswerQuestion> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.text,
          style: const TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
            width:
                widget.pageSize.width > 825 ? 650 : widget.pageSize.width - 200,
            child: const InputField())
      ],
    );
  }
}
