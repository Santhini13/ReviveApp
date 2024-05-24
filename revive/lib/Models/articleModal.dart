import 'package:cloud_firestore/cloud_firestore.dart';

class Article {
  String title;
  String content;
  String category;
  DateTime? date;

  Article({
    required this.title,
    required this.content,
    required this.category,
    this.date,
  });

  factory Article.fromMap(Map<String, dynamic> map) {
    return Article(
      title: map['title'],
      content: map['content'],
      category: map['category'],
      date: (map['date'] as Timestamp?)?.toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
      'category': category,
      'date': date,
    };
  }
}
