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
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:revive/Models/feedbackModal.dart';
import 'package:revive/Screens/constants/myAppbar.dart';
import 'package:revive/Services/feedbackservices.dart';


class FeedbackForm extends StatefulWidget {
  @override
  _FeedbackFormState createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  double _rating = 0.0;
  TextEditingController _feedbackController = TextEditingController();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final FeedbackService _feedbackService = FeedbackService();

  void _submitFeedback() {
    double rating = _rating;
    String feedbackMessage = _feedbackController.text;

    FeedbackModel feedback = FeedbackModel(
      rating: rating,
      feedbackMessage: feedbackMessage,
    );

    _feedbackService.submitFeedback(feedback);
    // _scaffoldKey.currentState?.showSnackBar(const SnackBar(
    //   content: Text('Feedback submitted successfully!'),
    // ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: MyAppBar(
        title: 'Feedback Form',
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _feedbackController,
              decoration: InputDecoration(labelText: 'Feedback Message'),
            ),
            SizedBox(height: 20.0),
            RatingBar.builder(
              initialRating: _rating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 40.0,
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                setState(() {
                  _rating = rating;
                });
              },
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _submitFeedback,
              child: Text('Submit Feedback'),
            ),
          ],
        ),
      ),
    );
  }
}

