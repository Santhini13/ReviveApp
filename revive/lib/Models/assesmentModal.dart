class Assessment {
  String title;
  int score;
  DateTime date;
  String? id;


  Assessment({
    required this.title,
    required this.score,
     required this.date, 
  });

  factory Assessment.fromJson(Map<String, dynamic> json) {
    return Assessment(
      title: json['title'],
      score: json['score'],
      date: json['date'],  
     
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'score': score,
      'date':date
    };
  }
}