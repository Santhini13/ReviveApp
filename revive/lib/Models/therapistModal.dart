import 'package:cloud_firestore/cloud_firestore.dart';

class Therapist {
  final String id;
  final String description;
  final String qualification;
  final int experience;
  final List<String> timeSlots;

  Therapist({
    required this.id,
    required this.description,
    required this.qualification,
    required this.experience,
    required this.timeSlots,
  });

  // Factory method to create a Therapist object from Firestore DocumentSnapshot
  factory Therapist.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map;
    return Therapist(
      id: doc.id,
      description: data['description'] ?? '',
      qualification: data['qualification'] ?? '',
      experience: data['experience'] ?? 0,
      timeSlots: List<String>.from(data['timeSlots'] ?? []),
    );
  }

  // Method to convert a Therapist object to a map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'description': description,
      'qualification': qualification,
      'experience': experience,
      'timeSlots': timeSlots,
    };
  }
}
