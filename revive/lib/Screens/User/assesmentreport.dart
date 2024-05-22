import 'package:flutter/material.dart';
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
  
  @override
  void initState() {
    super.initState();
    _fetchAssesment();
  }


  Future<void> _fetchAssesment() async {
    print('fetchJournal123');
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    try {
      List<Assessment> assesment = await _assesmentService.fetchAssesment(authProvider.uid);
      setState(() {
        _assesmentScore = assesment;
        _isLoading=false;
      });
    } catch (e) {
      print('Error fetching journals: $e');
      _isLoading=false;
    }
  }
  // Future<void> _deleteAssessment(String id) async {
  //   final authProvider = Provider.of<AuthProvider>(context, listen: false);
  //   try {
  //     await _assesmentService.deleteAssessment(authProvider.uid, id);
  //     setState(() {
  //       _assesmentScore.removeWhere((assessment) => assessment.Assesid == id);
  //     });
  //   } catch (e) {
  //     print('Error deleting assessment: $e');
  //   }
  // }


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
      body: _isLoading
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
            padding: const EdgeInsets.only(top:20.0,right: 10,left:10),
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
                      ),
                    ),
                  );
                },
              ),
          ),
    );
  }

  void _showAssessmentScoreDialog(BuildContext context, Assessment _assesmentScore) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(_assesmentScore.title),
          content: Text('Score: ${_assesmentScore.score}'),
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

