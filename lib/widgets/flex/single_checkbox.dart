import 'package:flutter/material.dart';

class ChoiceQuestion extends StatefulWidget {
  final String text;

  const ChoiceQuestion({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  State<ChoiceQuestion> createState() => _ChoiceQuestionState();
}

class _ChoiceQuestionState extends State<ChoiceQuestion> {
  var isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          value: isChecked,
          onChanged: (val) => {
            setState((){
              isChecked = val!;
            })
          },
          fillColor: MaterialStateProperty.all(const Color(0xffFFE17D)),
          checkColor: Colors.black,
        ),
        Text(
          widget.text,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 18,
          ),
        )
      ],
    );
  }
}
