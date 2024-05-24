import 'package:flutter/material.dart';
import 'package:revive/Models/feedbackModal.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:revive/Services/feedbackservices.dart';
import 'package:uuid/uuid.dart';

class FeedbackForm extends StatefulWidget {
  final String therapistId;

  FeedbackForm({required this.therapistId});

  @override
  _FeedbackFormState createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  final _formKey = GlobalKey<FormState>();
  final FeedbackService _feedbackService = FeedbackService();
  final TextEditingController _feedbackController = TextEditingController();
  bool _isLoading = false;

  Future<void> _submitFeedback() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      User? user = FirebaseAuth.instance.currentUser;
      String feedbackId = Uuid().v4();

     Feedbacks feedback = Feedbacks(
        id: feedbackId,
        userId: user!.uid,
        therapistId: widget.therapistId,
        feedbackText: _feedbackController.text,
        date: DateTime.now(),
      );

      try {
        await _feedbackService.addFeedback(feedback);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Feedback submitted successfully')));
        Navigator.pop(context);
      } catch (e) {
        print('Error submitting feedback: $e');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error submitting feedback')));
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Submit Feedback'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _feedbackController,
                      decoration: InputDecoration(labelText: 'Feedback'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your feedback';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _submitFeedback,
                      child: Text('Submit'),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
