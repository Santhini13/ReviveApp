import 'package:flutter/material.dart';

class AssessmentReportScreen extends StatelessWidget {
  final List<AssessmentScore> assessmentScores = [
    AssessmentScore(title: 'Depression', score: 75),
    AssessmentScore(title: 'Anxiety', score: 80),
    AssessmentScore(title: 'Stress', score: 65),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Assessment Report'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: assessmentScores.isEmpty
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
          : ListView.builder(
              itemCount: assessmentScores.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    title: Text(
                      assessmentScores[index].title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      _showAssessmentScoreDialog(context, assessmentScores[index]);
                    },
                    leading: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                      child: Icon(
                        Icons.assessment,
                        color: Colors.white,
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                );
              },
            ),
    );
  }

  void _showAssessmentScoreDialog(BuildContext context, AssessmentScore assessmentScore) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(assessmentScore.title),
          content: Text('Score: ${assessmentScore.score}'),
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

class AssessmentScore {
  final String title;
  final int score;

  AssessmentScore({
    required this.title,
    required this.score,
  });
}

