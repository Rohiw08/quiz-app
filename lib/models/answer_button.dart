import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(
      {super.key, required this.answerText, required this.onTap});
  final String answerText;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          backgroundColor: const Color.fromARGB(255, 33, 1, 95),
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(40)),
        ),
        child: Text(
          answerText,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
