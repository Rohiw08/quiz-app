import 'package:flutter/material.dart';
import 'package:quizapp/data/questins_data.dart';
import 'package:quizapp/screens/final_answers_screen.dart';
import 'package:quizapp/screens/intro_screen.dart';
import 'package:quizapp/screens/quiz_screen.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  String currentScreen = 'intro-screen';
  List<String> selectedAnswerList = [];

  void changeScreen() {
    setState(() {
      currentScreen = 'quiz-screen';
    });
  }

  void storeAnswer(String selectedAnswer) {
    if (selectedAnswerList.length == questions.length - 1) {
      setState(() {
        currentScreen = 'final-screen';
      });
    }
    selectedAnswerList.add(selectedAnswer);
  }

  void restartQuiz() {
    setState(() {
      selectedAnswerList = [];
      currentScreen = 'intro-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget? decision;
    if (currentScreen == 'intro-screen') {
      decision = IntroScreen(changeScreen);
    } else if (currentScreen == 'quiz-screen') {
      decision = QuizScreen(onSelectAnswer: storeAnswer);
    } else {
      decision = FinalAnswers(
        chosenAnswers: selectedAnswerList,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.deepPurple,
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.deepPurple,
                Color.fromARGB(255, 45, 15, 96),
              ],
            ),
          ),
          child: decision,
        ),
      ),
    );
  }
}
