import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answerText;
  final Function selectHandler;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: () {
          selectHandler();
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.green,
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          textStyle:
              const TextStyle(fontSize: 24, fontWeight: FontWeight.normal),
        ),
        child: Center(child: Text(answerText)),
      ),
    );
  }
}
