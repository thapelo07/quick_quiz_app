
class Question {
  final String questionText;
  final List<Answer> answersList;

  Question(this.questionText, this.answersList);
}

class Answer {
  final String answerText;
  final bool isCorrect;

  Answer(this.answerText, this.isCorrect);
}

List<Question> getQuestions() {
  List<Question> list = [];


  list.add(Question(
    "In Python to print out an output we use?",
    [
      Answer("console.log", false),
      Answer("System.out.println", false),
      Answer("print", true),
      Answer("Console.WriteLine", false),
    ],
  ));

  list.add(Question(
    "In Java to print out an output we use?",
    [
      Answer("print", false),
      Answer("console.WriteLine", false),
      Answer("System.out.println", true),
      Answer("console.log", false),
    ],
  ));

  list.add(Question(
    "Print(5 * _) is 35",
    [
      Answer("10", false),
      Answer("7", true),
      Answer("4", false),
      Answer("9", true),
    ],
  ));

  list.add(Question(
    "Can you use Android Studio to develop an App?",
    [
      Answer("Yes", true),
      Answer("No", false),
      Answer("None of the Above", false)
    ],
  ));

  return list;
}
