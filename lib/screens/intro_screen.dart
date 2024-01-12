import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  final void Function() startQuiz;
  const IntroScreen(this.startQuiz, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 80),
          Container(
            margin: const EdgeInsets.all(35.0),
            width: 350,
            child: Image.asset('assets/quiz.png'),
          ),
          const Text(
            'Learn in a fun way!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 35),
          ElevatedButton.icon(
            onPressed: () {
              startQuiz();
            },
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text(
              'Start Quiz',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 33, 1, 95),
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
