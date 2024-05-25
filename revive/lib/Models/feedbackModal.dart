// feedback_model.dart
class FeedbackModel {
  final double rating;
  final String feedbackMessage;

  FeedbackModel({
    required this.rating,
    required this.feedbackMessage,
  });

  Map<String, dynamic> toJson() {
    return {
      'rating': rating,
      'feedbackMessage': feedbackMessage,
    };
  }

  factory FeedbackModel.fromJson(Map<String, dynamic> json) {
    return FeedbackModel(
      rating: json['rating'],
      feedbackMessage: json['feedbackMessage'],
    );
  }
}
