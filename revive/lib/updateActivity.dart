// import 'package:cloud_firestore/cloud_firestore.dart';

// Future<void> uploadActivities() async {
//   final FirebaseFirestore firestore = FirebaseFirestore.instance;

//   List<Map<String, String>> activities = [
//     {'name': 'Go to bed one hour earlier than usual', 'image': 'assets/images/21-days/Day1.png'},
//     {'name': 'Journal ten things you’re grateful for', 'image': 'assets/images/21-days/Day2.png'},
//     {'name': 'Take a walk outdoors', 'image': 'assets/images/21-days/Day3.png'},
//     {'name': 'Call someone you love', 'image': 'assets/images/21-days/Day4.png'},
//     {'name': 'De-clutter your room or desk', 'image': 'assets/images/21-days/Day5.png'},
//     {'name': 'Take a break from social media', 'image': 'assets/images/21-days/Day6.png'},
//     {'name': 'Make a list of short-term goals', 'image': 'assets/images/21-days/Day7.png'},
//     {'name': 'Make the most epic, creative salad or healthy dish you can think of', 'image': 'assets/images/21-days/Day8.png'},
//     {'name': 'Slow down. Sit and watch the sunset or sunrise', 'image': 'assets/images/21-days/Day9.png'},
//     {'name': 'Get rid of five things you never use', 'image': 'assets/images/21-days/Day10.png'},
//     {'name': 'Enjoy the sun and eat lunch outside', 'image': 'assets/images/21-days/Day11.png'},
//     {'name': 'Unsubscribe from unnecessary emails', 'image': 'assets/images/21-days/Day12.png'},
//     {'name': 'Send an encouraging text to five people', 'image': 'assets/images/21-days/Day13.png'},
//     {'name': 'Wake up thirty minutes earlier to pray or meditate', 'image': 'assets/images/21-days/Day14.png'},
//     {'name': 'Plan a tea or smoothie date with a friend', 'image': 'assets/images/21-days/Day15.png'},
//     {'name': 'Go the entire day without complaining', 'image': 'assets/images/21-days/Day16.png'},
//     {'name': 'Buy yourself flowers', 'image': 'assets/images/21-days/Day17.png'},
//     {'name': 'Make time for a wholesome breakfast', 'image': 'assets/images/21-days/Day18.png'},
//     {'name': 'Do one thing you’ve been putting off', 'image': 'assets/images/21-days/Day19.png'},
//     {'name': 'Don’t overthink. Practice being present', 'image': 'assets/images/21-days/Day20.png'},
//     {'name': 'Say ‘no’ to that extra commitment', 'image': 'assets/images/21-days/Day21.png'},
//   ];

//   for (int i = 0; i < activities.length; i++) {
//     await firestore.collection('activities').doc('activity${i + 1}').set(activities[i]);
//   }

//   print('Activities uploaded successfully.');
// }

// import 'package:cloud_firestore/cloud_firestore.dart';

// Future<void> uploadActivities() async {
//   final FirebaseFirestore firestore = FirebaseFirestore.instance;

//   List<Map<String, dynamic>> activities = [
//     {'name': 'Go to bed one hour earlier than usual', 'image': 'assets/images/21-days/Day1.png', 'completed': false},
//     {'name': 'Journal ten things you’re grateful for', 'image': 'assets/images/21-days/Day2.png', 'completed': false},
//     {'name': 'Take a walk outdoors', 'image': 'assets/images/21-days/Day3.png', 'completed': false},
//     {'name': 'Call someone you love', 'image': 'assets/images/21-days/Day4.png', 'completed': false},
//     {'name': 'De-clutter your room or desk', 'image': 'assets/images/21-days/Day5.png', 'completed': false},
//     {'name': 'Take a break from social media', 'image': 'assets/images/21-days/Day6.png', 'completed': false},
//     {'name': 'Make a list of short-term goals', 'image': 'assets/images/21-days/Day7.png', 'completed': false},
//     {'name': 'Make the most epic, creative salad or healthy dish you can think of', 'image': 'assets/images/21-days/Day8.png', 'completed': false},
//     {'name': 'Slow down. Sit and watch the sunset or sunrise', 'image': 'assets/images/21-days/Day9.png', 'completed': false},
//     {'name': 'Get rid of five things you never use', 'image': 'assets/images/21-days/Day10.png', 'completed': false},
//     {'name': 'Enjoy the sun and eat lunch outside', 'image': 'assets/images/21-days/Day11.png', 'completed': false},
//     {'name': 'Unsubscribe from unnecessary emails', 'image': 'assets/images/21-days/Day12.png', 'completed': false},
//     {'name': 'Send an encouraging text to five people', 'image': 'assets/images/21-days/Day13.png', 'completed': false},
//     {'name': 'Wake up thirty minutes earlier to pray or meditate', 'image': 'assets/images/21-days/Day14.png', 'completed': false},
//     {'name': 'Plan a tea or smoothie date with a friend', 'image': 'assets/images/21-days/Day15.png', 'completed': false},
//     {'name': 'Go the entire day without complaining', 'image': 'assets/images/21-days/Day16.png', 'completed': false},
//     {'name': 'Buy yourself flowers', 'image': 'assets/images/21-days/Day17.png', 'completed': false},
//     {'name': 'Make time for a wholesome breakfast', 'image': 'assets/images/21-days/Day18.png', 'completed': false},
//     {'name': 'Do one thing you’ve been putting off', 'image': 'assets/images/21-days/Day19.png', 'completed': false},
//     {'name': 'Don’t overthink. Practice being present', 'image': 'assets/images/21-days/Day20.png', 'completed': false},
//     {'name': 'Say ‘no’ to that extra commitment', 'image': 'assets/images/21-days/Day21.png', 'completed': false},
//   ];

//   for (int i = 0; i < activities.length; i++) {
//     await firestore.collection('activities').doc('activity${i + 1}').set(activities[i]);
//   }

//   print('Activities uploaded successfully.');
// }

import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> uploadActivities() async {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  List<Map<String, dynamic>> activities = [
    {'name': 'Go to bed one hour earlier than usual', 'image': 'assets/images/21-days/Day1.png', 'completed': false, 'completionTime': null, 'index': 0},
    {'name': 'Journal ten things you’re grateful for', 'image': 'assets/images/21-days/Day2.png', 'completed': false, 'completionTime': null, 'index': 1},
    {'name': 'Take a walk outdoors', 'image': 'assets/images/21-days/Day3.png', 'completed': false, 'completionTime': null, 'index': 2},
    {'name': 'Call someone you love', 'image': 'assets/images/21-days/Day4.png', 'completed': false, 'completionTime': null, 'index': 3},
    {'name': 'De-clutter your room or desk', 'image': 'assets/images/21-days/Day5.png', 'completed': false, 'completionTime': null, 'index': 4},
    {'name': 'Take a break from social media', 'image': 'assets/images/21-days/Day6.png', 'completed': false, 'completionTime': null, 'index': 5},
    {'name': 'Make a list of short-term goals', 'image': 'assets/images/21-days/Day7.png', 'completed': false, 'completionTime': null, 'index': 6},
    {'name': 'Make the most epic, creative salad or healthy dish you can think of', 'image': 'assets/images/21-days/Day8.png', 'completed': false, 'completionTime': null, 'index': 7},
    {'name': 'Slow down. Sit and watch the sunset or sunrise', 'image': 'assets/images/21-days/Day9.png', 'completed': false, 'completionTime': null, 'index': 8},
    {'name': 'Get rid of five things you never use', 'image': 'assets/images/21-days/Day10.png', 'completed': false, 'completionTime': null, 'index': 9},
    {'name': 'Enjoy the sun and eat lunch outside', 'image': 'assets/images/21-days/Day11.png', 'completed': false, 'completionTime': null, 'index': 10},
    {'name': 'Unsubscribe from unnecessary emails', 'image': 'assets/images/21-days/Day12.png', 'completed': false, 'completionTime': null, 'index': 11},
    {'name': 'Send an encouraging text to five people', 'image': 'assets/images/21-days/Day13.png', 'completed': false, 'completionTime': null, 'index': 12},
    {'name': 'Wake up thirty minutes earlier to pray or meditate', 'image': 'assets/images/21-days/Day14.png', 'completed': false, 'completionTime': null, 'index': 13},
    {'name': 'Plan a tea or smoothie date with a friend', 'image': 'assets/images/21-days/Day15.png', 'completed': false, 'completionTime': null, 'index': 14},
    {'name': 'Go the entire day without complaining', 'image': 'assets/images/21-days/Day16.png', 'completed': false, 'completionTime': null, 'index': 15},
    {'name': 'Buy yourself flowers', 'image': 'assets/images/21-days/Day17.png', 'completed': false, 'completionTime': null, 'index': 16},
    {'name': 'Make time for a wholesome breakfast', 'image': 'assets/images/21-days/Day18.png', 'completed': false, 'completionTime': null, 'index': 17},
    {'name': 'Do one thing you’ve been putting off', 'image': 'assets/images/21-days/Day19.png', 'completed': false, 'completionTime': null, 'index': 18},
    {'name': 'Don’t overthink. Practice being present', 'image': 'assets/images/21-days/Day20.png', 'completed': false, 'completionTime': null, 'index': 19},
    {'name': 'Say ‘no’ to that extra commitment', 'image': 'assets/images/21-days/Day21.png', 'completed': false, 'completionTime': null, 'index': 20},
  ];

  for (int i = 0; i < activities.length; i++) { // Start from 0
    await firestore.collection('activities').doc('activity${i + 1}').set(activities[i]);
  }

  print('Activities uploaded successfully.');
}
