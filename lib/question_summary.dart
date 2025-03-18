import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: summaryData.map((data) {
            final isCorrect = data['is_correct'] as bool? ?? false;
            return Container(
              margin: const EdgeInsets.only(bottom: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 15,
                    backgroundColor: isCorrect ? const Color.fromRGBO(19, 181, 22, 1) : const Color.fromRGBO(229, 54, 42, 1),
                    child: Text(
                      ((data['question_index'] as int) + 1).toString(),
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Question Text
                        Text(
                          data['question'] as String,
                          style: GoogleFonts.lato(
                            color: const Color.fromARGB(255, 237, 223, 252),
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 5),
                        // Your Answer Text
                        Text(
                          "Your Answer: ${data['your_answer'] as String}",
                          style: GoogleFonts.lato(
                            color: isCorrect ? Colors.green : Colors.red, // Green if correct, Red if incorrect
                            fontWeight:
                                isCorrect ? FontWeight.bold : FontWeight.normal, // Bold if correct
                            fontSize: 14,
                          ),
                        ),
                        // Correct Answer Text
                        Text(
                          "Correct Answer: ${data['correct_answer'] as String}",
                          style: GoogleFonts.lato(
                            color: Colors.lightGreenAccent,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

