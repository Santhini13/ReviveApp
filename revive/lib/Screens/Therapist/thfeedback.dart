// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:revive/Models/therapistModal.dart';

// class FeedbackListScreen extends StatelessWidget {
//   final Therapist therapist;

//   FeedbackListScreen({required this.therapist});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('${therapist.name} - Feedbacks', style: TextStyle(color: Colors.white)),
//         flexibleSpace: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Color(0xff881736), Color(0xff281537)],
//             ),
//           ),
//         ),
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance
//             .collection('therapist')
//             .doc(therapist.id)
//             .collection('feedbacks')
//             .snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//             return Center(child: Text('No feedbacks available'));
//           } else {
//             final feedbackDocs = snapshot.data!.docs;
//             return ListView.builder(
//               itemCount: feedbackDocs.length,
//               itemBuilder: (context, index) {
//                 final feedbackData = feedbackDocs[index].data() as Map<String, dynamic>;
//                 return ListTile(
//                   title: Text(feedbackData['feedback'] ?? 'No Feedback'),
//                   subtitle: Text('Rating: ${feedbackData['rating']?.toStringAsFixed(1) ?? 'No Rating'}'),
//                   // trailing: Text(
//                   //   (feedbackData['timestamp'] as Timestamp).toDate().toString(),
//                   // ),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:revive/Models/therapistModal.dart';

class FeedbackListScreen extends StatelessWidget {
  final Therapist therapist;

  FeedbackListScreen({required this.therapist});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Feedbacks', style: TextStyle(color: Colors.white)),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff881736), Color(0xff281537)],
            ),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('therapist')
            .doc(therapist.id)
            .collection('feedbacks')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No feedbacks available'));
          } else {
            final feedbackDocs = snapshot.data!.docs;
            return ListView.builder(
              itemCount: feedbackDocs.length,
              itemBuilder: (context, index) {
                final feedbackData = feedbackDocs[index].data() as Map<String, dynamic>;
                final rating = feedbackData['rating'] ?? 0.0;

                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Card(
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            feedbackData['feedback'] ?? 'No Feedback',
                            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Text(
                                'Rating: ',
                                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                              ),
                              StarRating(
                                rating: rating,
                                starSize: 20.0,
                              ),
                              SizedBox(width: 5),
                              Text(
                                rating.toStringAsFixed(1),
                                style: TextStyle(fontSize: 14.0),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

class StarRating extends StatelessWidget {
  final double rating;
  final double starSize;

  const StarRating({
    required this.rating,
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

        return Icon(
           iconData,
          size: starSize,
          color: color,
        );
      }),
    );
  }
}
