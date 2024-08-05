// class Journal {
// String id;
//   String title;
//   String description;
//   String mood;
//   DateTime date;


//   Journal({
//  required this.id,
//     required this.title,
//     required this.description,
//     required this.mood, 
//     required this.date, 
     
//   });

//   factory Journal.fromJson(Map<String, dynamic> json,String id) {
//     return Journal(
//       id:id,
//       title: json['title'],
//       description: json['description'],
//       mood: json['mood'], 
//       date: json['date'],
     
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id':id,
//       'title': title,
//       'description': description,
//       'mood': mood,
//       'date':date
//     };
//   }
// }


import 'package:cloud_firestore/cloud_firestore.dart';

class Journal {
  String id;
  String title;
  String description;
  String mood;
  DateTime date;

  Journal({
    required this.id,
    required this.title,
    required this.description,
    required this.mood,
    required this.date,
  });

  factory Journal.fromJson(Map<String, dynamic> json, String id) {
    return Journal(
      id: id,
      title: json['title'],
      description: json['description'],
      mood: json['mood'],
      date: (json['date'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'mood': mood,
      'date': date,
    };
  }
}
