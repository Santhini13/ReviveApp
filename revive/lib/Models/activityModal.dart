// // import 'package:cloud_firestore/cloud_firestore.dart';

// // class Activity {
// //   final String name;
// //   final String image;
// //   bool completed; // New field to track completion status

// //   Activity({
// //     required this.name,
// //     required this.image,
// //     this.completed = false, // Default value for completion status
// //   });

// //   factory Activity.fromFirestore(DocumentSnapshot doc) {
// //     final data = doc.data() as Map<String, dynamic>;
// //     return Activity(
// //       name: data['name'] ?? '',
// //       image: data['image'] ?? '',
// //       completed: data['completed'] ?? false,
// //     );
// //   }

// //   Map<String, dynamic> toJson() {
// //     return {
// //       'name': name,
// //       'image': image,
// //       'completed': completed,
// //     };
// //   }
// // }


// import 'package:cloud_firestore/cloud_firestore.dart';

// class Activity {
//   final String name;
//   final String image;
//   bool completed;
//   DateTime completionTime;

//   Activity({
//     required this.name,
//     required this.image,
//     this.completed = false,
//     DateTime? completionTime,
//   }) : completionTime = completionTime ?? DateTime.fromMillisecondsSinceEpoch(0);

//   factory Activity.fromFirestore(DocumentSnapshot doc) {
//     final data = doc.data() as Map<String, dynamic>;
//     return Activity(
//       name: data['name'] ?? '',
//       image: data['image'] ?? '',
//       completed: data['completed'] ?? false,
//       completionTime: (data['completion_time'] as Timestamp?)?.toDate() ?? DateTime.fromMillisecondsSinceEpoch(0),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'name': name,
//       'image': image,
//       'completed': completed,
//       'completion_time': completionTime,
//     };
//   }
// }


import 'package:cloud_firestore/cloud_firestore.dart';

class Activity {
  String id;
  String name;
  String image;
  bool completed;
  DateTime? completionTime;
  int index;

  Activity({
    required this.id,
    required this.name,
    required this.image,
    this.completed = false,
    this.completionTime,
    required this.index,
  });

  factory Activity.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return Activity(
      id: doc.id!,
      name: data['name'] ?? '',
      image: data['image'] ?? '',
      completed: data['completed'] ?? false,
      completionTime: data['completionTime'] != null
          ? (data['completionTime'] as Timestamp).toDate()
          : null,
      index: int.parse(doc.id.replaceFirst('activity', '')) - 1,
    );
  }
}
