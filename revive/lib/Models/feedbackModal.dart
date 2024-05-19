class FeedbackModal {
  String id;
  String userId;
  String therapistId;
  String comments;
  int rating;
  DateTime feedbackDate;

  FeedbackModal({
    required this.id,
    required this.userId,
    required this.therapistId,
    required this.comments,
    required this.rating,
    required this.feedbackDate,
  });
}