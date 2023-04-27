
import 'package:flutter/material.dart';
import 'package:quiz_app/questions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen>{
  int score = 0;
  int questionIndex = 0;
  Answer? correctAnswer;
  List<Question> listOfQuestions = getQuestions();


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 5, 50, 80),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          const Text(
            "Programming Quiz App",
            style: TextStyle(
              color: Colors.cyan,
              fontSize: 24,
            ),
          ),
          _quizWidget(),
          _answerList(),
          _button(),
        ],),
      ),
    );
  }

  _quizWidget(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Quiz ${questionIndex + 1}/${listOfQuestions.length.toString()}",
          style: const TextStyle(
            color: Colors.cyan,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(color: Colors.black,
                      borderRadius: BorderRadius.circular(16)
         ),
         child: Text(
            listOfQuestions[questionIndex].questionText,
            style: const TextStyle(
                color: Colors.cyan,
                fontSize: 18,
                fontWeight: FontWeight.w600,
            ),
           ),
          ),
        ],
      );
  }

  _answerList() {
    return Column(
      children: listOfQuestions[questionIndex]
          .answersList
          .map(
            (e) => _answerButton(e),
      )
          .toList(),
    );
  }

  Widget _answerButton(Answer answer) {
    bool isSelected = answer == correctAnswer;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: isSelected ? Colors.white : Colors.black, backgroundColor: isSelected ? Colors.orangeAccent : Colors.white, shape: const StadiumBorder(),
        ),
        onPressed: () {
          if (correctAnswer == null) {
            if (answer.isCorrect) {
              score++;
            }
            setState(() {
              correctAnswer = answer;
            });
          }
        },
        child: Text(answer.answerText),
      ),
    );
  }

  _button() {
    bool isLastQuestion = false;
    if (questionIndex == listOfQuestions.length - 1) {
      isLastQuestion = true;
    }

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.blue, backgroundColor: Colors.black, shape: const StadiumBorder(),
        ),
        onPressed: () {
          if (isLastQuestion) {
            showDialog(context: context, builder: (_) => _showScoreDialog());
          } else {
            //next question
            setState(() {
              correctAnswer = null;
              questionIndex++;
            });
          }
        },
        child: Text(isLastQuestion ? "Submit" : "Next"),
      ),
    );
  }

  _showScoreDialog() {
    bool isPassed = false;

    if (score >= listOfQuestions.length * 0.6) {

      isPassed = true;
    }
    String title = isPassed ? "Passed " : "Failed";

    return AlertDialog(
      title: Text(
        "$title | Score is $score",
        style: TextStyle(color: isPassed ? Colors.amber : Colors.amberAccent),
      ),
      content: ElevatedButton(
        child: const Text("Restart"),
        onPressed: () {
          Navigator.pop(context);
          setState(() {
            questionIndex = 0;
            score = 0;
            correctAnswer = null;
          });
        },
      ),
    );
  }
}


