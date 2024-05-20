class Journal {

  String title;
  String description;
  String mood;
  DateTime date;


  Journal({

    required this.title,
    required this.description,
    required this.mood, 
    required this.date, 
     
  });

  factory Journal.fromJson(Map<String, dynamic> json) {
    return Journal(
      title: json['title'],
      description: json['description'],
      mood: json['mood'], 
      date: json['date'],
     
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'mood': mood,
      'date':date
    };
  }
}