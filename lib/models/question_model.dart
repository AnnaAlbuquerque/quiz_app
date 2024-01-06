class QuestionModel {
  final String question;
  final List<String> options;

  const QuestionModel({
    required this.question,
    required this.options,
  });

  List<String> get shuffledAnswers {
    final shuffledList = List.of(options);
    shuffledList.shuffle();
    return shuffledList;
  }
}
