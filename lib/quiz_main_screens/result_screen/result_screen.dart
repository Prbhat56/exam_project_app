// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class ResultScreen extends StatefulWidget {
  final int score;

  const ResultScreen({
    Key? key,
    required this.score,
  }) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    Color mainColor = Color(0xFF252c4a);
    Color secondColor = Color(0xFF117eeb);
    return Scaffold(
      backgroundColor: mainColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Congratulation",
              style: TextStyle(
                color: Colors.white,
                fontSize: 38,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20,),
            Text(
              "your score is",
               style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 50,),
            Text(
              "${widget.score}",
              style: TextStyle(
             color: Colors.orange,
             fontSize: 80,
             fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
