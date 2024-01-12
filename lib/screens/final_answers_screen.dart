import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/models/question_summery.dart';
import 'package:quizapp/data/questins_data.dart';

class FinalAnswers extends StatelessWidget {
  const FinalAnswers(
      {Key? key, required this.chosenAnswers, required this.onRestart})
      : super(key: key);

  final List<String> chosenAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> get summaryData {
    List<Map<String, Object>> summary = [];

    for (int i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
        'is_true': questions[i].answers[0] == chosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final totalQuestions = questions.length;
    final totalCorrect = summaryData
        .where((element) => element['user_answer'] == element['correct_answer'])
        .length;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
              'You answered $totalCorrect out of $totalQuestions questions correctly',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(color: Colors.white, fontSize: 23)),
          const SizedBox(
            height: 30,
          ),
          QuestionSummary(summaryData),
          const SizedBox(
            height: 15,
          ),
          TextButton(
              onPressed: onRestart,
              child: const Text(
                'Done',
                style: TextStyle(fontSize: 25),
              ))
        ],
      ),
    );
  }
}
