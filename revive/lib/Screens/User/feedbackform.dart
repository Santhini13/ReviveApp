
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:revive/Models/therapistModal.dart';

class FeedbackFormScreen extends StatefulWidget {
  final Therapist? therapist;

  FeedbackFormScreen({required this.therapist});

  @override
  _FeedbackFormScreenState createState() => _FeedbackFormScreenState();
}

class _FeedbackFormScreenState extends State<FeedbackFormScreen> {
  final TextEditingController _feedbackController = TextEditingController();
  double _rating = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(widget.therapist!.name, style: TextStyle(color: Colors.white)),
        ),
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff881736), Color(0xff281537)],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            TextFormField(
              controller: _feedbackController,
              maxLines: 5,
              decoration: InputDecoration(
                labelText: 'Your Feedback',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  'Rating:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 10),
                StarRating(
                  rating: _rating,
                  onRatingChanged: (newValue) {
                    setState(() {
                      _rating = newValue;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: _submitFeedback,
                child: Text('Submit', style: TextStyle(color: Color(0xff881736))),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submitFeedback() {
    String feedback = _feedbackController.text.trim();
    if (feedback.isNotEmpty) {
      FirebaseFirestore.instance.collection('therapist').doc(widget.therapist!.id).collection('feedbacks').add({
        'feedback': feedback,
        'rating': _rating,
        'timestamp': DateTime.now(),
      }).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Thank you for the feedback'),
            backgroundColor:Color(0xff881736)
          ),
        );
        Navigator.pop(context); // Optionally, navigate back to the previous screen
      }).catchError((error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error submitting feedback: $error'),
          ),
        );
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please provide your feedback.'),
        ),
      );
    }
  }

  @override
  void dispose() {
    _feedbackController.dispose();
    super.dispose();
  }
}

class StarRating extends StatelessWidget {
  final double rating;
  final void Function(double)? onRatingChanged;
  final double starSize;

  const StarRating({
    required this.rating,
    this.onRatingChanged,
    this.starSize = 40.0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        IconData iconData;
        Color color;
        if (index >= rating) {
          iconData = Icons.star_border;
          color = Colors.grey;
        } else if (index + 1 <= rating) {
          iconData = Icons.star;
          color = const Color.fromARGB(255, 255, 233, 31);
        } else {
          iconData = Icons.star;
          color = Theme.of(context).primaryColor;
        }

        return IconButton(
          icon: Icon(iconData),
          iconSize: starSize,
          color: color,
          onPressed: onRatingChanged != null ? () => onRatingChanged!(index + 1.0) : null,
        );
      }),
    );
  }
}

