class QuestionsList {
  final String question;
  final List<String> answers;

  const QuestionsList(this.question, this.answers);

  List<String> get shuffledAnswers {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}
