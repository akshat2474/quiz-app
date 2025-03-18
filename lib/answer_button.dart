import 'package:flutter/material.dart';


class AnswerButton extends StatelessWidget {
  const AnswerButton(this.onTap, this.answerText, {super.key});
  final String answerText;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 3),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 40,vertical: 10),
            backgroundColor: Color.fromRGBO(93, 88, 225, 1),
            foregroundColor: Color.fromRGBO(248, 248, 248, 1),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40),
        
          )
      
          ),
          onPressed: onTap,
          child: Text(answerText,textAlign: TextAlign.center,)),
    );
  }
}
