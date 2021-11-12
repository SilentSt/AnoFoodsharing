import 'package:flutter/cupertino.dart';
import 'input_field.dart';

class UserDataElement extends StatelessWidget {
  final String text;
  final String textKey;
  const UserDataElement({
    Key? key,
    required this.pageSize, required this.text, required this.textKey,
  }) : super(key: key);

  final Size pageSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(child: Text(text, textAlign: TextAlign.end,), width: 130,),
          const SizedBox(width: 30,),
          SizedBox(
            child: InputField(key: Key(textKey),),
            width: pageSize.width > 820 ? 280 : pageSize.width - 390,
          )
        ],
      ),
    );
  }
}