import 'package:cloud_firestore/cloud_firestore.dart';

class ChallengeDay {
  final String id;
  final String name;
  final String image;
  final bool isCompleted;
  final DateTime lastCompletionTime;

  ChallengeDay({
    required this.id,
    required this.name,
    required this.image,
    required this.isCompleted,
    required this.lastCompletionTime,
  });

  factory ChallengeDay.fromMap(Map<String, dynamic> data, String id) {
    return ChallengeDay(
      id: id,
      name: data['name'],
      image: data['image'],
      isCompleted: data['isCompleted'],
      lastCompletionTime: (data['lastCompletionTime'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'isCompleted': isCompleted,
      'lastCompletionTime': lastCompletionTime,
    };
  }
}