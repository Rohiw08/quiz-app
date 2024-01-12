import 'package:flutter/material.dart';
import 'package:quizapp/models/answer_button.dart';
import 'package:quizapp/data/questins_data.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key, required this.onSelectAnswer}) : super(key: key);

  final void Function(String selectedAnswer) onSelectAnswer;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;

  void changeQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);

    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get the current question
    var currentQuestion = questions[currentQuestionIndex];

    return SafeArea(
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Display the current question
            Text(
              currentQuestion.question,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 23,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            // Generate shuffled answer buttons
            ...currentQuestion.shuffledAnswers.map(
              (item) {
                return AnswerButton(
                  answerText: item,
                  onTap: () {
                    changeQuestion(item);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
