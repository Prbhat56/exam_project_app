import 'package:exam_project_app/quiz_main_screens/qusetion_dummy_list/question_dummy_list.dart';
import 'package:exam_project_app/quiz_main_screens/result_screen/result_screen.dart';
import 'package:flutter/material.dart';

class QuizDisplayPge extends StatefulWidget {
  const QuizDisplayPge({super.key});

  @override
  State<QuizDisplayPge> createState() => _QuizDisplayPgeState();
}

class _QuizDisplayPgeState extends State<QuizDisplayPge> {
  Color mainColor = const Color(0xFF252c4a);
  Color secondColor = const Color(0xFF117eeb);
  final PageController _controller = PageController(initialPage: 0);
  bool isPressed = false;
  Color isTrue = Colors.green;
  Color isFalse = Colors.redAccent;
  Color btnColor = const Color(0xFF117eeb);
  int score = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            controller: _controller,
            onPageChanged: (page) {
              setState(() {
                isPressed = false;
              });
            },
            itemCount: questions.length,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Question ${index + 1}/${questions.length}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 28.0,
                      ),
                    ),
                  ),
                  const Divider(
                    color: Colors.white,
                    height: 8.0,
                    thickness: 1.0,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    questions[index].question!,
                    style: const TextStyle(color: Colors.white, fontSize: 28.0),
                  ),
                  const SizedBox(
                    height: 35.0,
                  ),
                  for (int i = 0; i < questions[index].answer.length; i++)
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(bottom: 18),
                      child: MaterialButton(
                        color: isPressed
                            ? questions[index].answer.entries.toList()[i].value
                                ? isTrue
                                : isFalse
                            : secondColor,
                        shape: const StadiumBorder(),
                        padding: const EdgeInsets.symmetric(vertical: 18.0),
                        onPressed: isPressed
                            ? () {}
                            : () {
                                setState(() {
                                  isPressed = true;
                                });
                                if (questions[index]
                                    .answer
                                    .entries
                                    .toList()[i]
                                    .value) {
                                  score += 10;
                                  print(score);
                                }
                              },
                        child: Text(
                          questions[index].answer.keys.toList()[i],
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceBetween, 
                    children: [
                   
                      if (index > 0)
                        OutlinedButton(
                          onPressed: () {
                            if (isPressed) {
                              _controller.previousPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.linear,
                              );
                            }
                          },
                          style: OutlinedButton.styleFrom(
                              shape: const StadiumBorder(),
                              side: const BorderSide(
                                color: Colors.orange,
                                width: 1.0,
                              )),
                          child: const Text(
                            "Previous",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),

                      OutlinedButton(
                          onPressed: isPressed
                              ? index + 1 == questions.length
                                  ? () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ResultScreen(
                                                    score: score,
                                                  )));
                                    }
                                  : () {
                                      _controller.nextPage(
                                          duration: const Duration(milliseconds: 500),
                                          curve: Curves.linear);
                                    }
                              : null,
                          style: OutlinedButton.styleFrom(
                              shape: const StadiumBorder(),
                              side: const BorderSide(
                                color: Colors.orange,
                                width: 1.0,
                              )),
                          child: Text(
                            index + 1 == questions.length
                                ? "See result"
                                : "Next question",
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ))
                    ],
                  ),
                ],
              );
            },
          )),
    );
  }
}
