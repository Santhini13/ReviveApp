import 'package:flutter/material.dart';
import 'package:revive/Screens/constants/myAppbar.dart';
class SessionNotification {
  final String sessionId;
  final String sessionTitle;
  final DateTime time;

  SessionNotification({
    required this.sessionId,
    required this.sessionTitle,
    required this.time,
  });
}

class NotificationManager {
  static List<SessionNotification> notifications = [];

  static void addNotification(SessionNotification notification) {
    notifications.add(notification);
  }
}

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Notifications',
      ),
      body: ListView.builder(
        itemCount: NotificationManager.notifications.length,
        itemBuilder: (context, index) {
          final notification = NotificationManager.notifications[index];
          return ListTile(
            title: Text(notification.sessionTitle),
            subtitle: Text('Session ID: ${notification.sessionId}'),
            trailing: Text('${notification.time.hour}:${notification.time.minute}'),
          );
        },
      ),
    );
  }
}
void startSession() {
  // Logic to start a new session
  // This could include initializing the session, starting a call, etc.

  // Once the session is started, add a notification
  final notification = SessionNotification(
    sessionId: 'SESSION_ID', // Use appropriate session ID
    sessionTitle: 'Session Title', // Use appropriate session title
    time: DateTime.now(),
  );
  NotificationManager.addNotification(notification);
}

