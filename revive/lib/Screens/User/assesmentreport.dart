// // import 'package:flutter/material.dart';
// // import 'package:intl/intl.dart';
// // import 'package:provider/provider.dart';
// // import 'package:revive/Models/assesmentModal.dart';
// // import 'package:revive/Services/assesmentService.dart';
// // import 'package:revive/Services/authprovider.dart';

// // class AssessmentReportScreen extends StatefulWidget {
// //   @override
// //   State<AssessmentReportScreen> createState() => _AssessmentReportScreenState();
// // }

// // class _AssessmentReportScreenState extends State<AssessmentReportScreen> {
// //   final AssesmentService _assesmentService = AssesmentService();
// //   List<Assessment> _assesmentScore = [];
// //   bool _isLoading = true;
// //  String? uid;
// //   Future<void> _fetchAssesment() async {
// //     print('fetchAssesment');
// //     final authProvider = Provider.of<AuthProvider>(context, listen: false);
// //     try {
// //       List<Assessment> assessments = await _assesmentService.fetchAssesment(authProvider.uid);
// //       setState(() {
// //         _assesmentScore = assessments;
// //         _isLoading = false;
// //       });
// //     } catch (e) {
// //       print('Error fetching assessments: $e');
// //       setState(() {
// //         _isLoading = false;
// //       });
// //     }
// //   }

// //   Future<void> _deleteAssessment(Assessment assessment) async {
// //   try {
// //     final authProvider = Provider.of<AuthProvider>(context, listen: false);
// //     await _assesmentService.deleteAssessment(assessment,authProvider.uid);
// //   } catch (e) {
// //     print('Error deleting assessment: $e');
// //     // Handle any errors that occur during deletion
// //   }
// // }


// // // void _deleteAssessment(Assessment assessment) async {
// // //     final authProvider = Provider.of<AuthProvider>(context, listen: false);
// // //     try {
// // //       await AssesmentService().deleteAssessment(assessment, authProvider.uid!);
// // //       setState(() {
// // //         _assesmentScore.remove(assessment);
// // //       });
// // //       ScaffoldMessenger.of(context).showSnackBar(
// // //         SnackBar(
// // //           content: Text('Assessment deleted successfully.'),
// // //           backgroundColor: Colors.green,
// // //         ),
// // //       );
// // //     } catch (e) {
// // //       print('Error deleting assessment: $e');
// // //       ScaffoldMessenger.of(context).showSnackBar(
// // //         SnackBar(
// // //           content: Text('Error deleting assessment.'),
// // //           backgroundColor: Colors.red,
// // //         ),
// // //       );
// // //     }
// // //   }

// //   @override
// //   void initState() {
// //     super.initState();
// //     _fetchAssesment();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: PreferredSize(
// //         preferredSize: Size.fromHeight(kToolbarHeight),
// //         child: AppBar(
// //           title: Text('Assessment Report', style: TextStyle(color: Colors.white)),
// //           backgroundColor: Colors.transparent,
// //           automaticallyImplyLeading: false,
// //           flexibleSpace: Container(
// //             decoration: BoxDecoration(
// //               gradient: LinearGradient(
// //                 colors: [Color(0xff881736), Color(0xff281537)],
// //               ),
// //             ),
// //           ),
// //         ),
// //       ),
// //       body: Column(
// //         children: [
// //           Container(
// //             child: Stack(
// //               children: [
// //                 Container(
// //                   height: 40,
// //                   decoration: BoxDecoration(
// //                     gradient: LinearGradient(
// //                       colors: [Colors.grey, Colors.green, Colors.yellow, Colors.orange, Colors.red],
// //                       stops: [0.2, 0.4, 0.6, 0.8, 1.0],
// //                     ),
// //                   ),
// //                 ),
// //                 Row(
// //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                   children: [
// //                     _buildRiskLevelText('No Risk\n<=10', Colors.grey),
// //                     _buildRiskLevelText('Normal\n10-15', Colors.green),
// //                     _buildRiskLevelText('Mild\n15-20', Colors.yellow),
// //                     _buildRiskLevelText('Moderate\n20-25', Colors.orange),
// //                     _buildRiskLevelText('At Risk\n>25', Colors.red),
// //                   ],
// //                 ),
// //               ],
// //             ),
// //           ),
// //           Expanded(
// //             child: _isLoading
// //                 ? Center(child: CircularProgressIndicator())
// //                 : _assesmentScore.isEmpty
// //                     ? Center(
// //                         child: Column(
// //                           mainAxisAlignment: MainAxisAlignment.center,
// //                           children: [
// //                             Icon(
// //                               Icons.assessment,
// //                               size: 100,
// //                               color: Colors.grey,
// //                             ),
// //                             SizedBox(height: 20),
// //                             Text(
// //                               'No assessment scores recorded',
// //                               style: TextStyle(
// //                                 fontSize: 16,
// //                                 color: Colors.grey,
// //                               ),
// //                             ),
// //                           ],
// //                         ),
// //                       )
// //                     : Padding(
// //                         padding: const EdgeInsets.only(top: 20.0, right: 10, left: 10),
// //                         child: ListView.builder(
// //                           itemCount: _assesmentScore.length,
// //                           itemBuilder: (context, index) {
// //                             return Padding(
// //                               padding: const EdgeInsets.all(8.0),
// //                               child: Card(
// //                                 elevation: 4,
// //                                 shape: RoundedRectangleBorder(
// //                                   borderRadius: BorderRadius.circular(10),
// //                                 ),
// //                                 child: ListTile(
// //           title: Text(
// //             _assesmentScore[index].title,
// //             style: TextStyle(
// //               fontSize: 18,
// //               fontWeight: FontWeight.bold,
// //             ),
// //           ),
// //           onTap: () {
// //             _showAssessmentScoreDialog(context, _assesmentScore[index]);
// //           },
// //           leading: Container(
// //             padding: EdgeInsets.all(8),
// //             decoration: BoxDecoration(
// //               shape: BoxShape.circle,
// //               color: Color(0xff881736),
// //             ),
// //             child: Icon(
// //               Icons.assessment,
// //               color: Colors.white,
// //             ),
// //           ),
// //           // trailing: IconButton(
// //           //   icon: Icon(Icons.delete),
// //           //   onPressed: () {
// //           //     _deleteAssessment(_assesmentScore[index]);
// //           //   },
// //           // ),
// //           )
                                
// //                               ),
// //                             );
// //                           },
// //                         ),
// //                       ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildRiskLevelText(String level, Color color) {
// //     return Container(
// //       width: 70,
// //       child: Text(
// //         level,
// //         style: TextStyle(
// //           fontWeight: FontWeight.bold,
// //           color: Colors.black,
// //           fontSize: 12,
// //         ),
// //         textAlign: TextAlign.center,
// //       ),
// //     );
// //   }

// //   void _showAssessmentScoreDialog(BuildContext context, Assessment assessment) {
// //     String riskLevel;
// //     Color riskColor;

// //     if (assessment.title == "Substance Use") {
// //       // Substance Use specific risk level calculation
// //       if (assessment.score > 8) {
// //         riskLevel = 'At Risk';
// //         riskColor = Colors.red;
// //       } else if (assessment.score > 5) {
// //         riskLevel = 'Moderate';
// //         riskColor = Colors.orange;
// //       } else {
// //         riskLevel = 'No Risk';
// //         riskColor = Colors.grey;
// //       }
// //     } else {
// //       // General risk level calculation
// //       if (assessment.score > 25) {
// //         riskLevel = 'At Risk';
// //         riskColor = Colors.red;
// //       } else if (assessment.score > 20) {
// //         riskLevel = 'Moderate';
// //         riskColor = Colors.orange;
// //       } else if (assessment.score > 15) {
// //         riskLevel = 'Mild';
// //         riskColor = Colors.yellow;
// //       } else if (assessment.score > 10) {
// //         riskLevel = 'Normal';
// //         riskColor = Colors.green;
// //       } else {
// //         riskLevel = 'No Risk';
// //         riskColor = Colors.grey;
// //       }
// //     }

// //     showDialog(
// //       context: context,
// //       builder: (context) {
// //         return AlertDialog(
// //           backgroundColor: riskColor,
// //           title: Text(
// //             assessment.title,
// //             style: TextStyle(color: Colors.white),
// //           ),
// //           content: Column(
// //             mainAxisSize: MainAxisSize.min,
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               Text(
// //                 'Score: ${assessment.score}',
// //                 style: TextStyle(color: Colors.white),
// //               ),
// //               Text(
// //                 'Date: ${DateFormat.yMMMd().format(assessment.date)}',
// //                 style: TextStyle(color: Colors.white),
// //               ),
// //               SizedBox(height: 10),
// //               Container(
// //                 padding: EdgeInsets.all(4.0),
// //                 color: riskColor,
// //                 child: Text(
// //                   riskLevel,
// //                   style: TextStyle(
// //                     fontWeight: FontWeight.bold,
// //                     color: Colors.white,
// //                     fontSize: 16,
// //                   ),
// //                   textAlign: TextAlign.center,
// //                 ),
// //               ),
// //             ],
// //           ),
// //           actions: [
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.end,
// //               children: [
// //                  if (assessment.title == "Substance Use")
// //                 IconButton(
// //                   icon: Icon(Icons.info, color: Colors.white),
// //                   onPressed: () {
// //                     _showSubstanceUseInfoDialog(context);
// //                   },
// //                 ),
// //                 TextButton(
// //                   onPressed: () {
// //                     Navigator.pop(context);
// //                   },
// //                   child: Text('Close', style: TextStyle(color: Colors.white)),
// //                 ),
// //               ],
// //             ),
// //           ],
// //         );
// //       },
// //     );
// //   }
// //    void _showSubstanceUseInfoDialog(BuildContext context) {
// //     showDialog(
// //       context: context,
// //       builder: (context) {
// //         return AlertDialog(
// //           content: Text(
// //               'Substance Use assessments,\n the risk levels are calculated\nas follows:\n\n'
// //               '- At Risk: Score > 8\n'
// //               '- Moderate: Score > 5\n'
// //               '- No Risk: Score <= 5'),
// //           actions: [
// //             TextButton(
// //               onPressed: () {
// //                 Navigator.pop(context);
// //               },
// //               child: Text('Close'),
// //             ),
// //           ],
// //         );
// //       },
// //     );
// //   }
// // }



// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
// import 'package:revive/Models/assesmentModal.dart';
// import 'package:revive/Services/assesmentService.dart';
// import 'package:revive/Services/authprovider.dart';

// class AssessmentReportScreen extends StatefulWidget {
//   @override
//   State<AssessmentReportScreen> createState() => _AssessmentReportScreenState();
// }

// class _AssessmentReportScreenState extends State<AssessmentReportScreen> {
//   final AssesmentService _assesmentService = AssesmentService();
//   List<Assessment> _assesmentScore = [];
//   bool _isLoading = true;
//  String? uid;
//   Future<void> _fetchAssesment() async {
//     print('fetchAssesment');
//     final authProvider = Provider.of<AuthProvider>(context, listen: false);
//     try {
//       List<Assessment> assessments = await _assesmentService.fetchAssesment(authProvider.uid);
//       setState(() {
//         _assesmentScore = assessments;
//         _isLoading = false;
//       });
//     } catch (e) {
//       print('Error fetching assessments: $e');
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }

//   Future<void> _deleteAssessment(Assessment assessment) async {
//   try {
//     final authProvider = Provider.of<AuthProvider>(context, listen: false);
//     await _assesmentService.deleteAssessment(assessment,authProvider.uid);
//   } catch (e) {
//     print('Error deleting assessment: $e');
//     // Handle any errors that occur during deletion
//   }
// }

//   @override
//   void initState() {
//     super.initState();
//     _fetchAssesment();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(kToolbarHeight),
//         child: AppBar(
//           title: Text('Assessment Report', style: TextStyle(color: Colors.white)),
//           backgroundColor: Colors.transparent,
//           automaticallyImplyLeading: false,
//           flexibleSpace: Container(
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [Color(0xff881736), Color(0xff281537)],
//               ),
//             ),
//           ),
//         ),
//       ),
//       body: Column(
//         children: [
//           Container(
//             child: Stack(
//               children: [
//                 Container(
//                   height: 40,
//                   decoration: BoxDecoration(
//                     gradient: LinearGradient(
//                       colors: [Colors.grey, Colors.green, Colors.yellow, Colors.orange, Colors.red],
//                       stops: [0.1, 0.3, 0.5, 0.7, 0.9],
//                     ),
//                   ),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     _buildRiskLevelText('No Risk\n<=10', Colors.grey),
//                     _buildRiskLevelText('Normal\n10-15', Colors.green),
//                     _buildRiskLevelText('Mild\n15-20', Colors.yellow),
//                     _buildRiskLevelText('Moderate\n20-25', Colors.orange),
//                     _buildRiskLevelText('At Risk\n>25', Colors.red),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: _isLoading
//                 ? Center(child: CircularProgressIndicator())
//                 : _assesmentScore.isEmpty
//                     ? Center(
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Icon(
//                               Icons.assessment,
//                               size: 100,
//                               color: Colors.grey,
//                             ),
//                             SizedBox(height: 20),
//                             Text(
//                               'No assessment scores recorded',
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 color: Colors.grey,
//                               ),
//                             ),
//                           ],
//                         ),
//                       )
//                     : Padding(
//                         padding: const EdgeInsets.only(top: 20.0, right: 10, left: 10),
//                         child: ListView.builder(
//                           itemCount: _assesmentScore.length,
//                           itemBuilder: (context, index) {
//                             return Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Card(
//                                 elevation: 4,
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                                 child: ListTile(
//           title: Text(
//             _assesmentScore[index].title,
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           onTap: () {
//             _showAssessmentScoreDialog(context, _assesmentScore[index]);
//           },
//           leading: Container(
//             padding: EdgeInsets.all(8),
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: Color(0xff881736),
//             ),
//             child: Icon(
//               Icons.assessment,
//               color: Colors.white,
//             ),
//           ),
//           trailing: IconButton(
//             icon: Icon(Icons.delete),
//             onPressed: () {
//               _deleteAssessment(_assesmentScore[index]);
//             },
//           ),
//           )
                                
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildRiskLevelText(String level, Color color) {
//     return Container(
//       width: 70,
//       child: Text(
//         level,
//         style: TextStyle(
//           fontWeight: FontWeight.bold,
//           color: Colors.black,
//           fontSize: 12,
//         ),
//         textAlign: TextAlign.center,
//       ),
//     );
//   }

//   void _showAssessmentScoreDialog(BuildContext context, Assessment assessment) {
//     String riskLevel;
//     Color riskColor;

//     if (assessment.title == "Substance Use") {
//       // Substance Use specific risk level calculation
//       if (assessment.score > 8) {
//         riskLevel = 'At Risk';
//         riskColor = Colors.red;
//       } else if (assessment.score > 5) {
//         riskLevel = 'Moderate';
//         riskColor = Colors.orange;
//       } else {
//         riskLevel = 'No Risk';
//         riskColor = Colors.grey;
//       }
//     } else {
//       // General risk level calculation
//       if (assessment.score > 25) {
//         riskLevel = 'At Risk';
//         riskColor = Colors.red;
//       } else if (assessment.score > 20) {
//         riskLevel = 'Moderate';
//         riskColor = Colors.orange;
//       } else if (assessment.score > 15) {
//         riskLevel = 'Mild';
//         riskColor = Colors.yellow;
//       } else if (assessment.score > 10) {
//         riskLevel = 'Normal';
//         riskColor = Colors.green;
//       } else {
//         riskLevel = 'No Risk';
//         riskColor = Colors.grey;
//       }
//     }

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           backgroundColor: riskColor,
//           title: Text(
//             assessment.title,
//             style: TextStyle(color: Colors.white),
//           ),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Score: ${assessment.score}',
//                 style: TextStyle(color: Colors.white),
//               ),
//               Text(
//                 'Date: ${DateFormat.yMMMd().format(assessment.date)}',
//                 style: TextStyle(color: Colors.white),
//               ),
//               SizedBox(height: 10),
//               Container(
//                 padding: EdgeInsets.all(4.0),
//                 color: riskColor,
//                 child: Text(
//                   riskLevel,
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                     fontSize: 16,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             ],
//           ),
//           actions: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                  if (assessment.title == "Substance Use")
//                 IconButton(
//                   icon: Icon(Icons.info, color: Colors.white),
//                   onPressed: () {
//                     _showSubstanceUseInfoDialog(context);
//                   },
//                 ),
//                 TextButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: Text('Close', style: TextStyle(color: Colors.white)),
//                 ),
//               ],
//             ),
//           ],
//         );
//       },
//     );
//   }
//    void _showSubstanceUseInfoDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           content: Text(
//               'Substance Use assessments,\n the risk levels are calculated\nas follows:\n\n'
//               '- At Risk: Score > 8\n'
//               '- Moderate: Score > 5\n'
//               '- No Risk: Score <= 5'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: Text('Close'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:revive/Models/assesmentModal.dart';
import 'package:revive/Services/assesmentService.dart';
import 'package:revive/Services/authprovider.dart';

class AssessmentReportScreen extends StatefulWidget {
  @override
  State<AssessmentReportScreen> createState() => _AssessmentReportScreenState();
}

class _AssessmentReportScreenState extends State<AssessmentReportScreen> {
  final AssesmentService _assesmentService = AssesmentService();
  List<Assessment> _assesmentScore = [];
  bool _isLoading = true;
  String? uid;

  Future<void> _fetchAssesment() async {
    print('fetchAssesment');
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    try {
      List<Assessment> assessments = await _assesmentService.fetchAssesment(authProvider.uid);
      setState(() {
        _assesmentScore = assessments;
        _isLoading = false;
      });
    } catch (e) {
      print('Error fetching assessments: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _deleteAssessment(Assessment assessment) async {
    try {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      await _assesmentService.deleteAssessment(assessment, authProvider.uid);
      setState(() {
        _assesmentScore.remove(assessment);
      });
    } catch (e) {
      print('Error deleting assessment: $e');
      // Handle any errors that occur during deletion
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchAssesment();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBar(
          title: Text('Assessment Report', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff881736), Color(0xff281537)],
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            child: Stack(
              children: [
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.grey, Colors.green, Colors.yellow, Colors.orange, Colors.red],
                      stops: [0.1, 0.3, 0.5, 0.7, 0.9],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildRiskLevelText('No Risk\n<=10', Colors.grey),
                    _buildRiskLevelText('Normal\n10-15', Colors.green),
                    _buildRiskLevelText('Mild\n15-20', Colors.yellow),
                    _buildRiskLevelText('Moderate\n20-25', Colors.orange),
                    _buildRiskLevelText('At Risk\n>25', Colors.red),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: _isLoading
                ? Center(child: CircularProgressIndicator())
                : _assesmentScore.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.assessment,
                              size: 100,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 20),
                            Text(
                              'No assessment scores recorded',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(top: 20.0, right: 10, left: 10),
                        child: ListView.builder(
                          itemCount: _assesmentScore.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: ListTile(
                                  title: Text(
                                    _assesmentScore[index].title,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onTap: () {
                                    _showAssessmentScoreDialog(context, _assesmentScore[index]);
                                  },
                                  leading: Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xff881736),
                                    ),
                                    child: Icon(
                                      Icons.assessment,
                                      color: Colors.white,
                                    ),
                                  ),
                                  trailing: IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () {
                                      _deleteAssessment(_assesmentScore[index]);
                                    },
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
          ),
        ],
      ),
    );
  }

  Widget _buildRiskLevelText(String level, Color color) {
    return Container(
      width: 70,
      child: Text(
        level,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: 12,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  void _showAssessmentScoreDialog(BuildContext context, Assessment assessment) {
    String riskLevel;
    Color riskColor;

    if (assessment.title == "Substance Use") {
      // Substance Use specific risk level calculation
      if (assessment.score > 8) {
        riskLevel = 'At Risk';
        riskColor = Colors.red;
      } else if (assessment.score > 5) {
        riskLevel = 'Moderate';
        riskColor = Colors.orange;
      } else {
        riskLevel = 'No Risk';
        riskColor = Colors.grey;
      }
    } else {
      // General risk level calculation
      if (assessment.score > 25) {
        riskLevel = 'At Risk';
        riskColor = Colors.red;
      } else if (assessment.score > 20) {
        riskLevel = 'Moderate';
        riskColor = Colors.orange;
      } else if (assessment.score > 15) {
        riskLevel = 'Mild';
        riskColor = Colors.yellow;
      } else if (assessment.score > 10) {
        riskLevel = 'Normal';
        riskColor = Colors.green;
      } else {
        riskLevel = 'No Risk';
        riskColor = Colors.grey;
      }
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: riskColor,
          title: Text(
            assessment.title,
            style: TextStyle(color: Colors.white),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Score: ${assessment.score}',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'Date: ${DateFormat.yMMMd().format(assessment.date)}',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(4.0),
                color: riskColor,
                child: Text(
                  riskLevel,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (assessment.title == "Substance Use")
                  IconButton(
                    icon: Icon(Icons.info, color: Colors.white),
                    onPressed: () {
                      _showSubstanceUseInfoDialog(context);
                    },
                  ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Close', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  void _showSubstanceUseInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(
            'Substance Use assessments,\n the risk levels are calculated\nas follows:\n\n'
            '- At Risk: Score > 8\n'
            '- Moderate: Score > 5\n'
            '- No Risk: Score <= 5',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
