import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:revive/Screens/constants/myAppbar.dart';

class ViewFeedbackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        appBar: MyAppBar(title: 'View Therapist'),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('therapist').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No feedback available.'));
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var therapistData = snapshot.data!.docs[index].data() as Map<String, dynamic>;
              return Column(
                children: [
                  ListTile(
                    title: Text(
                      'Therapist: ${therapistData['name']}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    leading: Icon(Icons.person),
                    tileColor: Colors.grey[200],
                    onTap: () {
                      // Add onTap functionality if needed
                    },
                  ),
                  SizedBox(height: 10),
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('therapist')
                        .doc(snapshot.data!.docs[index].id)
                        .collection('feedbacks')
                        .snapshots(),
                    builder: (context, feedbackSnapshot) {
                      if (feedbackSnapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      }
                      if (!feedbackSnapshot.hasData || feedbackSnapshot.data!.docs.isEmpty) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'No feedback',
                            style: TextStyle(color: Colors.grey),
                          ),
                        );
                      }
                      return Column(
                        children: feedbackSnapshot.data!.docs.map((feedbackDoc) {
                          var feedbackData = feedbackDoc.data() as Map<String, dynamic>;
                          return Card(
                            elevation: 2,
                            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            child: ListTile(
                              title: Text(
                                'Feedback: ${feedbackData['feedback']}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Row(
                                children: [
                                  Icon(Icons.star, color: Colors.amber),
                                  SizedBox(width: 5),
                                  Text(
                                    'Rating: ${feedbackData['rating']}',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              tileColor: Colors.grey[100],
                              onTap: () {
                                // Add onTap functionality if needed
                              },
                            ),
                          );
                        }).toList(),
                      );
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
