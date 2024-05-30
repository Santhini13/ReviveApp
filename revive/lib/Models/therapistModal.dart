// import 'package:cloud_firestore/cloud_firestore.dart';

// class Therapist {
//   final String name;
//   final String description;
//   final String qualification;
//   final String experience;
//   final List<String> timeSlots;
//   final List<String> appointmenttypes;

//   Therapist({
//     required this.name,
//     required this.description,
//     required this.qualification,
//     required this.experience,
//     required this.timeSlots, 
//     required this.appointmenttypes,
//   });

//   // Factory method to create a Therapist object from Firestore DocumentSnapshot
//   factory Therapist.fromFirestore(DocumentSnapshot doc) {
//     Map data = doc.data() as Map;
//     return Therapist(
//       name: data['name']??'',
//       description: data['description'] ?? '',
//       qualification: data['qualification'] ?? '',
//       experience: data['experience'] ?? 0,
//       timeSlots: List<String>.from(data['timeSlots'] ?? []), 
//       appointmenttypes: data['appointmenttypes'] ?? '', 
//     );
//   }

//   // Method to convert a Therapist object to a map for Firestore
//   Map<String, dynamic> toMap() {
//     return {
//       'name':name,
//       'description': description,
//       'qualification': qualification,
//       'experience': experience,
//       'timeSlots': timeSlots,
//     };
//   }
// }


import 'package:cloud_firestore/cloud_firestore.dart';

class Therapist {
  final String id;
  final String name;
  final String rci;
  final String specialization;
  final String description;
  final String qualification;
  final String experience;
  final List<String> timeSlots;
  final List<String> appointmenttypes;

  Therapist({
    required this.id,
    required this.name,
    required this.rci,
    required this.specialization,
    required this.description,
    required this.qualification,
    required this.experience,
    required this.timeSlots,
    required this.appointmenttypes,
  });

  // Factory method to create a Therapist object from Firestore DocumentSnapshot
  factory Therapist.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Therapist(
      id:data['id']??'',
      name: data['name'] ?? '',
      rci: data['rci']??'',
      specialization: data['specialization'] ?? '',
      description: data['description'] ?? '',
      qualification: data['qualification'] ?? '',
      experience: data['experience'] ?? '',
      timeSlots: List<String>.from(data['timeSlots'] ?? []),
      appointmenttypes: List<String>.from(data['appointmenttypes'] ?? []),
    );
  }

  get profileImageUrl => null;

  // Method to convert a Therapist object to a map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'id':id,
      'rci':rci,
      'name': name,
      'specialization':specialization,
      'description': description,
      'qualification': qualification,
      'experience': experience,
      'timeSlots': timeSlots,
      'appointmenttypes': appointmenttypes,
    };
  }
}

