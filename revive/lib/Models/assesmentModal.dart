class Assessment {
  String title;
  int score;
  DateTime date;
  String? id;


  Assessment({
    required this.title,
    required this.score,
     required this.date, 
     this.id
  });

  factory Assessment.fromJson(Map<String, dynamic> json) {
    return Assessment(
      title: json['title'],
      score: json['score'],
      date: json['date'],  
      id:json['id']
     
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'score': score,
      'date':date,
      'id':id
    };
  }
}