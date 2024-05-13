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
       appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight), // Increase the height of the app bar
        child: AppBar(
          title:Text('Assessment Report',style:TextStyle(color:Colors.white),),
          backgroundColor: Colors.transparent, // Transparent background
          automaticallyImplyLeading: false, // Removes the back button
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff881736), Color(0xff281537)],
              ),
            ),))),
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
          : Padding(
            padding: const EdgeInsets.only(top:20.0,right: 10,left:10),
            child: ListView.builder(
                itemCount: assessmentScores.length,
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
                            color: Color(0xff881736),
                          ),
                          child: Icon(
                            Icons.assessment,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
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

