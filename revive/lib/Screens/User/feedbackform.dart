// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:revive/Screens/constants/myAppbar.dart';

// class FeedbackForm extends StatefulWidget {
//   @override
//   _FeedbackFormState createState() => _FeedbackFormState();
// }

// class _FeedbackFormState extends State<FeedbackForm> {
//   double _rating = 0.0;
//   TextEditingController _feedbackController = TextEditingController();
//   GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

//   void _submitFeedback() {
//     double rating = _rating;
//     String feedbackMessage = _feedbackController.text;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       appBar: MyAppBar(
//         title: 'Feedback Form',
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextField(
//               controller: _feedbackController,
//               decoration: InputDecoration(labelText: 'Feedback Message'),
//             ),
//             SizedBox(height: 20.0),
//             RatingBar.builder(
//               initialRating: _rating,
//               minRating: 1,
//               direction: Axis.horizontal,
//               allowHalfRating: true,
//               itemCount: 5,
//               itemSize: 40.0,
//               itemBuilder: (context, _) => Icon(
//                 Icons.star,
//                 color: Colors.amber,
//               ),
//               onRatingUpdate: (rating) {
//                 setState(() {
//                   _rating = rating;
//                 });
//               },
//             ),
//             SizedBox(height: 20.0),
            
//             ElevatedButton(
//               onPressed: _submitFeedback,
//               child: Text('Submit Feedback'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// feedback_form.dart


// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:revive/Models/feedbackModal.dart';
// import 'package:revive/Screens/constants/myAppbar.dart';
// import 'package:revive/Services/feedbackservices.dart';


// class FeedbackForm extends StatefulWidget {
//   @override
//   _FeedbackFormState createState() => _FeedbackFormState();
// }

// class _FeedbackFormState extends State<FeedbackForm> {
//   double _rating = 0.0;
//   TextEditingController _feedbackController = TextEditingController();
//   GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

//   final FeedbackService _feedbackService = FeedbackService();

//   void _submitFeedback() {
//     double rating = _rating;
//     String feedbackMessage = _feedbackController.text;

//     FeedbackModel feedback = FeedbackModel(
//       rating: rating,
//       feedbackMessage: feedbackMessage, id: '',
//     );

//     _feedbackService.submitFeedback(feedback);
//     // _scaffoldKey.currentState?.showSnackBar(const SnackBar(
//     //   content: Text('Feedback submitted successfully!'),
//     // ));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       appBar: MyAppBar(
//         title: 'Feedback Form',
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextField(
//               controller: _feedbackController,
//               decoration: InputDecoration(labelText: 'Feedback Message'),
//             ),
//             SizedBox(height: 20.0),
//             RatingBar.builder(
//               initialRating: _rating,
//               minRating: 1,
//               direction: Axis.horizontal,
//               allowHalfRating: true,
//               itemCount: 5,
//               itemSize: 40.0,
//               itemBuilder: (context, _) => Icon(
//                 Icons.star,
//                 color: Colors.amber,
//               ),
//               onRatingUpdate: (rating) {
//                 setState(() {
//                   _rating = rating;
//                 });
//               },
//             ),
//             SizedBox(height: 20.0),
//             ElevatedButton(
//               onPressed: _submitFeedback,
//               child: Text('Submit Feedback'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }




// feedback_form.dart
// feedback_form.dart

// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:provider/provider.dart';
// import 'package:revive/Models/feedbackModal.dart';
// import 'package:revive/Screens/constants/myAppbar.dart';
// import 'package:revive/Services/authprovider.dart';
// import 'package:revive/Services/feedbackservices.dart';
// import 'package:revive/Services/therapistService.dart';
// import 'package:uuid/uuid.dart';


// class FeedbackForm extends StatefulWidget {
//   @override
//   _FeedbackFormState createState() => _FeedbackFormState();
// }

// class _FeedbackFormState extends State<FeedbackForm> {
//   double _rating = 0.0;
//   TextEditingController _feedbackController = TextEditingController();
//   final RatingService _ratingService = RatingService();

//   Future<void> _submitFeedback() async {
//     final authProvider = Provider.of<AuthProvider>(context, listen: false);
//     String currentUserUid = authProvider.uid!;
//     String therapistUid = 'actualTherapistUid'; // Replace with the actual therapist UID

//     try {
//       // Generate a unique ID for the rating
//       var uuid = Uuid();
//       Rating rating = Rating(
//         id: uuid.v4(),
//         feedbackMessage: _feedbackController.text,
//         rating: _rating,
//       );

//       // Register the feedback using the fetched therapist UID
//       await _ratingService.registerFeedback(currentUserUid, rating, therapistUid);
//       Navigator.pop(context);
//       print('Feedback submitted successfully');
//     } catch (e) {
//       print('Error saving feedback: $e');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Error saving feedback: $e'),
//           backgroundColor: Colors.red,
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: MyAppBar(
//         title: 'Feedback Form',
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextField(
//               controller: _feedbackController,
//               decoration: InputDecoration(labelText: 'Feedback Message'),
//             ),
//             SizedBox(height: 20.0),
//             RatingBar.builder(
//               initialRating: _rating,
//               minRating: 1,
//               direction: Axis.horizontal,
//               allowHalfRating: true,
//               itemCount: 5,
//               itemSize: 40.0,
//               itemBuilder: (context, _) => Icon(
//                 Icons.star,
//                 color: Colors.amber,
//               ),
//               onRatingUpdate: (rating) {
//                 setState(() {
//                   _rating = rating;
//                 });
//               },
//             ),
//             SizedBox(height: 20.0),
//             ElevatedButton(
//               onPressed: _submitFeedback,
//               child: Text('Submit Feedback'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }





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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback Form'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Therapist: ${widget.therapist!.name}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
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
            ElevatedButton(
              onPressed: () {
                _submitFeedback();
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

 
void _submitFeedback() {
  String feedback = _feedbackController.text.trim();
  if (feedback.isNotEmpty) {
    FirebaseFirestore.instance.collection('feedbacks').add({
      'therapistName': widget.therapist!.name,
      'feedback': feedback,
      'timestamp': DateTime.now(),
    }).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Feedback submitted successfully!'),
        ),
      );
      Navigator.pop(context); // Optionally, you can navigate back to the previous screen
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


// class FeedbackForm extends StatefulWidget {
//   @override
//   _FeedbackFormState createState() => _FeedbackFormState();
// }

// class _FeedbackFormState extends State<FeedbackForm> {
//   double _rating = 0.0;
//   TextEditingController _feedbackController = TextEditingController();
//   //GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//    final RatingService _ratingService = RatingService();
//    final TherapistService _therapistService = TherapistService();


//  Future<void> _submitFeedback() async {
   
//   final authProvider=Provider.of<AuthProvider>(context,listen: false);
//  String user=authProvider.uid!; // Placeholder for actual therapist UID

//     try {
//       // Fetch the actual therapist UID dynamically
//       Rating rating = Rating(
//         feedbackMessage: _feedbackController.text,
//         rating: _rating,
//       );
//       await _ratingService.registerFeedback(user,rating,id);
//       Navigator.pop(context);
//       print('--------------');
//     } catch (e) {
//       print('Error saving article: $e');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Error saving article: $e'),
//           backgroundColor: Colors.red,
//         ),
//       );
//     }
//  }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       //key: _scaffoldKey,
//       appBar: MyAppBar(
//         title: 'Feedback Form',
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             TextField(
//               controller: _feedbackController,
//               decoration: InputDecoration(labelText: 'Feedback Message'),

//             ),
//             SizedBox(height: 20.0),
//             RatingBar.builder(
//               initialRating: _rating,
//               minRating: 1,
//               direction: Axis.horizontal,
//               allowHalfRating: true,
//               itemCount: 5,
//               itemSize: 40.0,
//               itemBuilder: (context, _) => Icon(
//                 Icons.star,
//                 color: Colors.amber,
//               ),
//               onRatingUpdate: (rating) {
//                 setState(() {
//                   _rating = rating;
//                 });
//               },
//             ),
//             SizedBox(height: 20.0),
//             ElevatedButton(
//               onPressed: _submitFeedback,
//               child: Text('Submit Feedback'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }