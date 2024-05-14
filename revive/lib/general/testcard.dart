import 'package:flutter/material.dart';

class QuestionWidget extends StatefulWidget {
  final List<Map<String, dynamic>> questions;

  const QuestionWidget({Key? key, required this.questions}) : super(key: key);

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  List<int> selectedOptions = List.filled(10, -1); // Initialize selectedOptions

  int totalScore = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: widget.questions.length,
        itemBuilder: (context, index) {
          final question = widget.questions[index];

          return Card(
            margin: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Question ${index + 1}: ${question['question']}',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                      question['options'].length,
                      (optionIndex) => CheckboxListTile(
                        title: Text(
                          '${question['options'][optionIndex]}',
                          style: TextStyle(fontSize: 16),
                        ),
                        value: selectedOptions[index] == optionIndex,
                        onChanged: (value) {
                          setState(() {
                            selectedOptions[index] =
                                value! ? optionIndex : -1;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          computeScore();
        },
        backgroundColor: Color(0xff881736),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                'Score',
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
              Icon(Icons.save, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }

  void computeScore() {
    totalScore = 0;
    for (int i = 0; i < selectedOptions.length; i++) {
      if (selectedOptions[i] != -1) {
        totalScore += selectedOptions[i];
      }
    }

    String riskLevel;
    if (totalScore > 25) {
      riskLevel = 'At Risk';
    } else if (totalScore > 20) {
      riskLevel = 'Moderate';
    } else if (totalScore > 15) {
      riskLevel = 'Mild';
    } else if (totalScore > 10) {
      riskLevel = 'Normal';
    } else {
      riskLevel = 'No Risk';
    }

    String message = 'Your score is $totalScore. Risk Level: $riskLevel';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Total Score'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Ok'),
            ),
          ],
        );
      },
    );
  }
}
