import 'package:flutter/material.dart';
import 'package:revive/Screens/constants/myAppbar.dart';

class FeedbackViewScreen extends StatelessWidget {
  final String feedback;

  FeedbackViewScreen({required this.feedback});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Feedback',
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                feedback,
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Share Your Rating'),
                        content: FeedbackRatingScreen(),
                      );
                    },
                  );
                },
                child: Text('Share Your Rating'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FeedbackRatingScreen extends StatefulWidget {
  @override
  _FeedbackRatingScreenState createState() => _FeedbackRatingScreenState();
}

class _FeedbackRatingScreenState extends State<FeedbackRatingScreen> {
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Rate your experience:',
          style: TextStyle(fontSize: 18.0),
        ),
        SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 1; i <= 5; i++)
              IconButton(
                icon: Icon(
                  i <= _rating ? Icons.star : Icons.star_border,
                  size: 40.0,
                  color: Colors.orange,
                ),
                onPressed: () {
                  setState(() {
                    _rating = i;
                  });
                },
              ),
          ],
        ),
        SizedBox(height: 20.0),
        ElevatedButton(
          onPressed: () {
            // Implement functionality to submit feedback
            Navigator.pop(context, _rating);
          },
          child: Text('Submit'),
        ),
      ],
    );
  }
}
