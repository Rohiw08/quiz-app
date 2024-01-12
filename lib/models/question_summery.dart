import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {Key? key}) : super(key: key);

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: 300,
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          overscroll: false,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: summaryData.map(
              (item) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: (item['is_true'] as bool)
                                ? Colors.blueAccent
                                : Colors.pinkAccent),
                        child: Center(
                          child: Text(
                            ((item['question_index'] as int) + 1).toString(),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['question'] as String,
                            style: GoogleFonts.lato(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            item['user_answer'] as String,
                            style: const TextStyle(
                                color: Colors.pinkAccent,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(item['correct_answer'] as String,
                              style: const TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ).toList(),
          ),
        ),
      ),
    );
  }
}
