import 'package:flutter/material.dart';

class TextFieldLabel extends StatelessWidget {
  final String labelName;
  const TextFieldLabel({Key? key, required this.labelName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18, bottom: 6),
      child: Text(
        labelName,
        style: const TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
