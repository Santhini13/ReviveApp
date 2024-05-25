// feedback_service.dart
import 'package:revive/Models/feedbackModal.dart';


class FeedbackService {
  final List<FeedbackModel> _feedbacks = [];

  void submitFeedback(FeedbackModel feedback) {
    _feedbacks.add(feedback);
  }

  List<FeedbackModel> getFeedbacks() {
    return _feedbacks;
  }
}
