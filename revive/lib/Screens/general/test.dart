// // import 'package:flutter/material.dart';

// // class SudQuestionWidget extends StatefulWidget {
// //   final List<Map<String, dynamic>> questions;
// //   final String? title;

// //   const SudQuestionWidget({Key? key,required this.title, required this.questions}) : super(key: key);

// //   @override
// //   State<SudQuestionWidget> createState() => _SudQuestionWidgetState();
// // }

// // class _SudQuestionWidgetState extends State<SudQuestionWidget> {
// //   List<int> selectedOptions = List.filled(10, -1); // Initialize selectedOptions

// //   int totalScore = 0;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: ListView.builder(
// //         itemCount: widget.questions.length,
// //         itemBuilder: (context, index) {
// //           final question = widget.questions[index];

// //           return Card(
// //             margin: EdgeInsets.all(8),
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 Padding(
// //                   padding: const EdgeInsets.all(8.0),
// //                   child: Text(
// //                     'Question ${index + 1}: ${question['question']}',
// //                     style: TextStyle(fontSize: 18),
// //                   ),
// //                 ),
// //                 Padding(
// //                   padding: const EdgeInsets.all(8.0),
// //                   child: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: List.generate(
// //                       question['options'].length,
// //                       (optionIndex) => CheckboxListTile(
// //                         title: Text(
// //                           '${question['options'][optionIndex]}',
// //                           style: TextStyle(fontSize: 16),
// //                         ),
// //                         value: selectedOptions[index] == optionIndex,
// //                         onChanged: (value) {
// //                           setState(() {
// //                             selectedOptions[index] =
// //                                 value! ? optionIndex : -1;
// //                           });
// //                         },
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           );
// //         },
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: () {
// //           computeScore();
// //         },
// //         backgroundColor: Color(0xff881736),
// //         child: Padding(
// //           padding: const EdgeInsets.all(8.0),
// //           child: Column(
// //             children: [
// //               Text(
// //                 'Score',
// //                 style: TextStyle(color: Colors.white, fontSize: 10),
// //               ),
// //               Icon(Icons.save, color: Colors.white),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   void computeScore() {
// //     totalScore = 0;
// //     for (int optionIndex in selectedOptions) {
// //       if (optionIndex != -1) {
// //         totalScore += optionIndex; // Accumulate scores (0 or 1)
// //       }
// //     }

// //     String riskLevel;
// //     if (totalScore > 8) {
// //       riskLevel = 'At Risk';
// //     } else if (totalScore > 5) {
// //       riskLevel = 'Moderate';
// //     } else {
// //       riskLevel = 'No Risk';
// //     }

// //     String message = 'Your score is $totalScore.\n Risk Level: $riskLevel';

// //     showDialog(
// //       context: context,
// //       builder: (BuildContext context) {
// //         return AlertDialog(
// //           title: Text('Total Score'),
// //           content: Text(message),
// //           actions: [
// //             TextButton(
// //               onPressed: () {
// //                 Navigator.of(context).pop();
// //               },
// //               child: Text('Ok'),
// //             ),
// //           ],
// //         );
// //       },
// //     );
// //   }
// // }


// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:revive/Services/assesmentService.dart';
// import 'package:revive/Services/authprovider.dart';
// import 'package:revive/Models/assesmentModal.dart';

// class SudQuestionWidget extends StatefulWidget {
//   final List<Map<String, dynamic>> questions;
//   final String title;
//   const SudQuestionWidget({Key? key, required this.title, required this.questions}) : super(key: key);

//   @override
//   State<SudQuestionWidget> createState() => _SudQuestionWidgetState();
// }

// class _SudQuestionWidgetState extends State<SudQuestionWidget> {
//   List<int> selectedOptions = List.filled(10, -1); // Initialize selectedOptions
//   final AssesmentService _assesmentService = AssesmentService();
//   int totalScore = 0;

//   Future<void> computeScore(String title) async {
//      totalScore = 0;
//     for (int optionIndex in selectedOptions) {
//       if (optionIndex != -1) {
//         totalScore += optionIndex; // Accumulate scores (0 or 1)
//       }
//     }

//     String riskLevel;
//     if (totalScore > 8) {
//       riskLevel = 'At Risk';
//     } else if (totalScore > 5) {
//       riskLevel = 'Moderate';
//     } else {
//       riskLevel = 'No Risk';
//     }

//     String message = 'Your score is $totalScore. Risk Level: $riskLevel';

//     final authProvider = Provider.of<AuthProvider>(context, listen: false);
//     Assessment assessment = Assessment(
//       title: title,
//       score: totalScore,
//       date: DateTime.now(),
//     );

//     try {
//       await _assesmentService.registerAssesment(assessment, authProvider.uid);
//       print('score saved');
//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text('Total Score'),
//             content: Text(message),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                   Navigator.pop(context);
//                 },
//                 child: Text('Ok'),
//               ),
//             ],
//           );
//         },
//       );
//     } catch (e) {
//       print(e);
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView.builder(
//         itemCount: widget.questions.length,
//         itemBuilder: (context, index) {
//           final question = widget.questions[index];

//           return Card(
//             margin: EdgeInsets.all(8),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(
//                     'Question ${index + 1}: ${question['question']}',
//                     style: TextStyle(fontSize: 18),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: List.generate(
//                       question['options'].length,
//                       (optionIndex) => CheckboxListTile(
//                         title: Text(
//                           '${question['options'][optionIndex]}',
//                           style: TextStyle(fontSize: 16),
//                         ),
//                         value: selectedOptions[index] == optionIndex,
//                         onChanged: (value) {
//                           setState(() {
//                             selectedOptions[index] = value! ? optionIndex : -1;
//                           });
//                         },
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           computeScore(widget.title);
//         },
//         backgroundColor: Color(0xff881736),
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               Text(
//                 'Score',
//                 style: TextStyle(color: Colors.white, fontSize: 10),
//               ),
//               Icon(Icons.save, color: Colors.white),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:revive/Services/assesmentService.dart';
import 'package:revive/Services/authprovider.dart';
import 'package:revive/Models/assesmentModal.dart';

class SudQuestionWidget extends StatefulWidget {
  final List<Map<String, dynamic>> questions;
  final String title;

  const SudQuestionWidget({Key? key, required this.title, required this.questions}) : super(key: key);

  @override
  State<SudQuestionWidget> createState() => _SudQuestionWidgetState();
}

class _SudQuestionWidgetState extends State<SudQuestionWidget> {
  List<int> selectedOptions = List.filled(10, -1); // Initialize selectedOptions
  final AssesmentService _assesmentService = AssesmentService();
  int totalScore = 0;

  Future<void> computeScore(String title) async {
    // Check if all questions have been answered
    bool allAnswered = selectedOptions.every((option) => option != -1);
    if (!allAnswered) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Incomplete'),
            content: Text('Please answer all the questions.'),
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
      return;
    }

    totalScore = 0;
    for (int optionIndex in selectedOptions) {
      if (optionIndex != -1) {
        totalScore += optionIndex; // Accumulate scores (0 or 1)
      }
    }

    String riskLevel;
    if (totalScore > 8) {
      riskLevel = 'At Risk';
    } else if (totalScore > 5) {
      riskLevel = 'Moderate';
    } else {
      riskLevel = 'No Risk';
    }

    String message = 'Your score is $totalScore. Risk Level: $riskLevel';

    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    Assessment assessment = Assessment(
      title: title,
      score: totalScore,
      date: DateTime.now(),
    );

    try {
      await _assesmentService.registerAssesment(assessment, authProvider.uid);
      print('score saved');
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
                  Navigator.pop(context);
                },
                child: Text('Ok'),
              ),
            ],
          );
        },
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
  }

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
                      (optionIndex) => RadioListTile<int>(
                        title: Text(
                          '${question['options'][optionIndex]}',
                          style: TextStyle(fontSize: 16),
                        ),
                        value: optionIndex,
                        groupValue: selectedOptions[index],
                        onChanged: (value) {
                          setState(() {
                            selectedOptions[index] = value!;
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
          computeScore(widget.title);
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
}
