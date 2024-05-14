import 'package:flutter/material.dart';
import 'package:revive/constants/myAppbar.dart';

class ViewFeedbackScreen extends StatefulWidget {
  @override
  _ViewFeedbackScreenState createState() => _ViewFeedbackScreenState();
}

class _ViewFeedbackScreenState extends State<ViewFeedbackScreen> {
  final List<String> feedbacks = [
    'Feedback 1 (Therapist)',
    'Feedback 2 (Therapist)',
    'Feedback 3 (Therapist)',
    'Feedback 1 (App)',
    'Feedback 2 (App)',
    'Feedback 3 (App)',
  ];

  void _deleteFeedback(String feedback) {
    setState(() {
      feedbacks.remove(feedback);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Feedback "$feedback" deleted'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'View Feedback'), 
      body: ListView.builder(
        itemCount: feedbacks.length,
        itemBuilder: (context, index) {
          final feedback = feedbacks[index];
          return ListTile(
            title: Text(feedback),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                _deleteFeedback(feedback);
              },
            ),
          );
        },
      ),
    );
  }
}