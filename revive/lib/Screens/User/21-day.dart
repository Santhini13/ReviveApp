

// // import 'package:flutter/material.dart';
// // import 'package:shared_preferences/shared_preferences.dart';

// // class ChallengeScreen extends StatefulWidget {
// //   @override
// //   _ChallengeScreenState createState() => _ChallengeScreenState();
// // }

// // class _ChallengeScreenState extends State<ChallengeScreen> {
// //   List<Map<String, dynamic>> _activities = [
// //     {'name': 'Go to bed one hour earlier than usual', 'image': 'assets/images/21-days/Day1.png'},
// //     {'name': 'Journal ten things you’re grateful for', 'image': 'assets/images/21-days/Day2.png'},
// //     {'name': 'Take a walk outdoors', 'image': 'assets/images/21-days/Day3.png'},
// //     {'name': 'Call someone you love', 'image': 'assets/images/21-days/Day4.png'},
// //     {'name': 'De-clutter your room or desk', 'image': 'assets/images/21-days/Day5.png'},
// //     {'name': 'Take a break from social media', 'image': 'assets/images/21-days/Day6.png'},
// //     {'name': 'Make a list of short-term goals', 'image': 'assets/images/21-days/Day7.png'},
// //     {'name': 'Make the most epic, creative salad or healthy dish you can think of', 'image': 'assets/images/21-days/Day8.png'},
// //     {'name': 'Slow down. Sit and watch the sunset or sunrise', 'image': 'assets/images/21-days/Day9.png'},
// //     {'name': 'Get rid of five things you never use', 'image': 'assets/images/21-days/Day10.png'},
// //     {'name': 'Enjoy the sun and eat lunch outside', 'image': 'assets/images/21-days/Day11.png'},
// //     {'name': 'Unsubscribe from unnecessary emails', 'image': 'assets/images/21-days/Day12.png'},
// //     {'name': 'Send an encouraging text to five people', 'image': 'assets/images/21-days/Day13.png'},
// //     {'name': 'Wake up thirty minutes earlier to pray or meditate', 'image': 'assets/images/21-days/Day14.png'},
// //     {'name': 'Plan a tea or smoothie date with a friend', 'image': 'assets/images/21-days/Day15.png'},
// //     {'name': 'Go the entire day without complaining', 'image': 'assets/images/21-days/Day16.png'},
// //     {'name': 'Buy yourself flowers', 'image': 'assets/images/21-days/Day17.png'},
// //     {'name': 'Make time for a wholesome breakfast', 'image': 'assets/images/21-days/Day18.png'},
// //     {'name': 'Do one thing you’ve been putting off', 'image': 'assets/images/21-days/Day19.png'},
// //     {'name': 'Don’t overthink. Practice being present', 'image': 'assets/images/21-days/Day20.png'},
// //     {'name': 'Say ‘no’ to that extra commitment', 'image': 'assets/images/21-days/Day21.png'},
// //   ];

// //   List<bool> _isDayCompleted = List.generate(21, (index) => false);
// //   List<DateTime> _lastCompletionTimes = List.generate(21, (index) => DateTime.fromMillisecondsSinceEpoch(0));

// //   @override
// //   void initState() {
// //     super.initState();
// //     _loadCompletionStatus();
// //   }

// //   Future<void> _loadCompletionStatus() async {
// //     SharedPreferences prefs = await SharedPreferences.getInstance();
// //     for (int i = 0; i < 21; i++) {
// //       _isDayCompleted[i] = prefs.getBool('day_$i') ?? false;
// //       _lastCompletionTimes[i] = DateTime.tryParse(prefs.getString('day_${i}_time') ?? '') ?? DateTime.fromMillisecondsSinceEpoch(0);
// //     }
// //     setState(() {});
// //   }

// //   Future<void> _markDayAsCompleted(int index) async {
// //     SharedPreferences prefs = await SharedPreferences.getInstance();
// //     setState(() {
// //       _isDayCompleted[index] = true;
// //       _lastCompletionTimes[index] = DateTime.now();
// //     });
// //     await prefs.setBool('day_$index', true);
// //     await prefs.setString('day_${index}_time', DateTime.now().toIso8601String());
// //   }

// //   bool _canOpenActivity(int index) {
// //     DateTime now = DateTime.now();
// //     return !_isDayCompleted[index] && now.difference(_lastCompletionTimes[index]).inHours>= 24;
// //   }
// //   Future<void> _clearSharedPreferences() async {
// //     SharedPreferences prefs = await SharedPreferences.getInstance();
// //     await prefs.clear();
// //     setState(() {
// //       _isDayCompleted = List.generate(21, (index) => false);
// //       _lastCompletionTimes = List.generate(21, (index) => DateTime.fromMillisecondsSinceEpoch(0));
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: PreferredSize(
// //         preferredSize: Size.fromHeight(kToolbarHeight), // Increase the height of the app bar
// //         child: AppBar(
// //           title: Text('21-Day Challenge', style: TextStyle(color: Colors.white)),
// //           backgroundColor: Colors.transparent, // Transparent background
// //           automaticallyImplyLeading: false, // Removes the back button
// //           flexibleSpace: Container(
// //             decoration: BoxDecoration(
// //               gradient: LinearGradient(
// //                 colors: [Color(0xff881736), Color(0xff281537)],
// //               ),
// //             ),
// //           ),
// //           actions: [
// //             IconButton(
// //               icon: Icon(Icons.refresh, color: Colors.white),
// //               onPressed: _clearSharedPreferences,
// //             ),
// //           ],
// //         ),
// //       ),
// //       body: Stack(
// //         children: [
// //           Container(
// //             width: double.infinity,
// //             height: 200,
// //             decoration: BoxDecoration(
// //               gradient: LinearGradient(
// //                 colors: [Color(0xff881736), Color(0xff281537)],
// //               ),
// //             ),
// //             child: Padding(
// //               padding: const EdgeInsets.all(8.0),
// //               child: Row(
// //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                 children: [
// //                   Text(
// //                     'Do It for 21-Days\n Find A New You',
// //                     style: TextStyle(fontSize: 20, color: Colors.white),
// //                   ),
// //                   Image.asset(
// //                     'assets/icons/goals.png',
// //                     width: 150,
// //                     height: 150,
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //           Container(
// //             decoration: BoxDecoration(
// //                 color: Colors.white,
// //                 borderRadius: BorderRadius.only(
// //                     topLeft: Radius.circular(10),
// //                     topRight: Radius.circular(10))),
// //             height: double.infinity,
// //             width: double.infinity,
// //             child: Padding(
// //               padding: const EdgeInsets.only(left: 10.0, right: 10, bottom: 20),
// //               child: GridView.builder(
// //                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// //                   crossAxisCount: 3,
// //                 ),
// //                 itemCount: 21,
// //                 itemBuilder: (BuildContext context, int index) {
// //                   return GestureDetector(
// //                     onTap: () {
// //                       if (_isDayCompleted[index]) {
// //                         ScaffoldMessenger.of(context).showSnackBar(
// //                           SnackBar(
// //                             content: Text('This activity is already completed.'),
// //                           ),
// //                         );
// //                       } else if (_canOpenActivity(index)) {
// //                         showDialog(
// //                           context: context,
// //                           builder: (BuildContext context) {
// //                             return AlertDialog(
// //                               content: Container(
// //                                 height: 300,
// //                                 width: 200,
// //                                 child: Column(
// //                                   mainAxisAlignment: MainAxisAlignment.center,
// //                                   crossAxisAlignment: CrossAxisAlignment.center,
// //                                   children: [
// //                                     Text(_activities[index]['name']),
// //                                     SizedBox(height: 10),
// //                                     Image.asset(
// //                                       _activities[index]['image'],
// //                                       height: 100,
// //                                       width: 100,
// //                                     ),
// //                                     SizedBox(height: 15),
// //                                     ElevatedButton(
// //                                       onPressed: () {
// //                                         _markDayAsCompleted(index);
// //                                         Navigator.of(context).pop();
// //                                       },
// //                                       child: Text('Done'),
// //                                     ),
// //                                   ],
// //                                 ),
// //                               ),
// //                             );
// //                           },
// //                         );
// //                       } else {
// //                         ScaffoldMessenger.of(context).showSnackBar(
// //                           SnackBar(
// //                             content: Text('You need to wait 24 hours before accessing this activity again.'),
// //                           ),
// //                         );
// //                       }
// //                     },
// //                     child: Container(
// //                       margin: EdgeInsets.all(5),
// //                       decoration: BoxDecoration(
// //                         color: _isDayCompleted[index]
// //                             ? Color(0xff881736).withOpacity(0.5)
// //                             : Color(0xff281537).withOpacity(0.5),
// //                         border: Border.all(
// //                           color: _isDayCompleted[index]
// //                               ? Color(0xff881736)
// //                               : Color(0xff281537),
// //                           width: 2,
// //                         ),
// //                       ),
// //                       child: Stack(
// //                         children: [
// //                           Center(
// //                             child: Text('Day ${index + 1}', style: TextStyle(color: Colors.white)),
// //                           ),
// //                           Positioned(
// //                             right: 5,
// //                             top: 5,
// //                             child: Icon(
// //                               _isDayCompleted[index] ? Icons.lock_open : Icons.lock,
// //                               color: Colors.white,
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                   );
// //                 },
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }



// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:revive/Models/activityModal.dart';
// import 'package:revive/Services/activityService.dart';
// import 'package:revive/Services/authprovider.dart';

// class ChallengeScreen extends StatefulWidget {
//   @override
//   _ChallengeScreenState createState() => _ChallengeScreenState();
// }

// class _ChallengeScreenState extends State<ChallengeScreen> {
//   final ActivityService _activityService = ActivityService();
//   List<Activity> _activities = [];

//   @override
//   void initState() {
//     super.initState();
//     _loadActivities();
//   }

//   Future<void> _loadActivities() async {
//     try {
//       final authProvider = Provider.of<AuthProvider>(context, listen: false);
//       String uid = authProvider.uid!;
//       List<Activity> activities = await _activityService.getActivities();
//       setState(() {
//         _activities = activities;
//       });
//     } catch (e) {
//       print('Error loading activities: $e');
//     }
//   }

//   Future<void> _markDayAsCompleted(int index) async {
//     try {
//       final authProvider = Provider.of<AuthProvider>(context, listen: false);
//       String uid = authProvider.uid!;
//       await _activityService.markActivityAsCompleted(uid, index);
//       setState(() {
//         _activities[index].completed = true;
//         _activities[index].completionTime = DateTime.now();
//       });
//     } catch (e) {
//       print('Error marking day as completed: $e');
//     }
//   }

//   bool _canOpenActivity(int index) {
//     return !_activities[index].completed;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(kToolbarHeight),
//         child: AppBar(
//           title: Text('21-Day Challenge', style: TextStyle(color: Colors.white)),
//           backgroundColor: Colors.transparent,
//           automaticallyImplyLeading: false,
//           flexibleSpace: Container(
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [Color(0xff881736), Color(0xff281537)],
//               ),
//             ),
//           ),
//         ),
//       ),
//       body: Stack(
//         children: [
//           Container(
//             width: double.infinity,
//             height: 200,
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [Color(0xff881736), Color(0xff281537)],
//               ),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Text(
//                     'Do It for 21-Days\n Find A New You',
//                     style: TextStyle(fontSize: 20, color: Colors.white),
//                   ),
//                   Image.asset(
//                     'assets/icons/goals.png',
//                     width: 150,
//                     height: 150,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Container(
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(10),
//                 topRight: Radius.circular(10),
//               ),
//             ),
//             height: double.infinity,
//             width: double.infinity,
//             child: Padding(
//               padding: const EdgeInsets.only(left: 10.0, right: 10, bottom: 20),
//               child: GridView.builder(
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 3,
//                 ),
//                 itemCount: _activities.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return GestureDetector(
//                     onTap: () {
//                       if (!_canOpenActivity(index)) {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             content: Text('You cannot access this activity again.'),
//                           ),
//                         );
//                       } else {
//                         showDialog(
//                           context: context,
//                           builder: (BuildContext context) {
//                             return AlertDialog(
//                               content: Container(
//                                 height: 300,
//                                 width: 200,
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   children: [
//                                     Text(_activities[index].name),
//                                     SizedBox(height: 10),
//                                     Image.asset(
//                                       _activities[index].image,
//                                       height: 100,
//                                       width: 100,
//                                     ),
//                                     SizedBox(height: 15),
//                                     ElevatedButton(
//                                       onPressed: () {
//                                         _markDayAsCompleted(index);
//                                         Navigator.of(context).pop();
//                                       },
//                                       child: Text('Done'),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             );
//                           },
//                         );
//                       }
//                     },
//                     child: Container(
//                       margin: EdgeInsets.all(5),
//                       decoration: BoxDecoration(
//                         color: _activities[index].completed
//                             ? Color(0xff881736).withOpacity(0.5)
//                             : Color(0xff281537).withOpacity(0.5),
//                         border: Border.all(
//                           color: _activities[index].completed
//                               ? Color(0xff881736)
//                               : Color(0xff281537),
//                           width: 2,
//                         ),
//                       ),
//                       child: Stack(
//                         children: [
//                           Center(
//                             child: Text('Day ${index + 1}', style: TextStyle(color: Colors.white)),
//                           ),
//                           Positioned(
//                             right: 5,
//                             top: 5,
//                             child: Icon(
//                               _activities[index].completed ? Icons.lock : Icons.lock_open,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:revive/Models/activityModal.dart';
// import 'package:revive/Services/activityService.dart';
// import 'package:revive/Services/authprovider.dart';

// class ChallengeScreen extends StatefulWidget {
//   @override
//   _ChallengeScreenState createState() => _ChallengeScreenState();
// }

// class _ChallengeScreenState extends State<ChallengeScreen> {
//   final ActivityService _activityService = ActivityService();
//   late Future<List<Activity>> futureActivities;

//   @override
//   void initState() {
//     super.initState();
//     _loadActivities();
//   }

//   void _loadActivities() {
//     final authProvider = Provider.of<AuthProvider>(context, listen: false);
//     String uid = authProvider.uid!;
//     futureActivities = _activityService.getMergedActivities(uid);
//   }

//   Future<void> _markDayAsCompleted(int index) async {
//     try {
//       final authProvider = Provider.of<AuthProvider>(context, listen: false);
//       String uid = authProvider.uid!;
//       await _activityService.markActivityAsCompleted(uid, index);
//       setState(() {
//         _loadActivities();  // Reload activities to refresh the UI
//       });
//     } catch (e) {
//       print('Error marking day as completed: $e');
//     }
//   }

//   bool _canOpenActivity(Activity activity) {
//     return !activity.completed;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(kToolbarHeight),
//         child: AppBar(
//           title: Text('21-Day Challenge', style: TextStyle(color: Colors.white)),
//           backgroundColor: Colors.transparent,
//           automaticallyImplyLeading: false,
//           flexibleSpace: Container(
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [Color(0xff881736), Color(0xff281537)],
//               ),
//             ),
//           ),
//         ),
//       ),
//       body: Stack(
//         children: [
//           Container(
//             width: double.infinity,
//             height: 200,
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [Color(0xff881736), Color(0xff281537)],
//               ),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Text(
//                     'Do It for 21-Days\n Find A New You',
//                     style: TextStyle(fontSize: 20, color: Colors.white),
//                   ),
//                   Image.asset(
//                     'assets/icons/goals.png',
//                     width: 150,
//                     height: 150,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Container(
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(10),
//                 topRight: Radius.circular(10),
//               ),
//             ),
//             height: double.infinity,
//             width: double.infinity,
//             child: Padding(
//               padding: const EdgeInsets.only(left: 10.0, right: 10, bottom: 20),
//               child: FutureBuilder<List<Activity>>(
//                 future: futureActivities,
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return Center(child: CircularProgressIndicator());
//                   } else if (snapshot.hasError) {
//                     return Center(child: Text('Error: ${snapshot.error}'));
//                   } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                     return Center(child: Text('No activities found'));
//                   } else {
//                     List<Activity> activities = snapshot.data!;
//                     return GridView.builder(
//                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 3,
//                       ),
//                       itemCount: activities.length,
//                       itemBuilder: (BuildContext context, int index) {
//                         return GestureDetector(
//                           onTap: () {
//                             if (!_canOpenActivity(activities[index])) {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 SnackBar(
//                                   content: Text('You cannot access this activity again.'),
//                                 ),
//                               );
//                             } else {
//                               showDialog(
//                                 context: context,
//                                 builder: (BuildContext context) {
//                                   return AlertDialog(
//                                     content: Container(
//                                       height: 300,
//                                       width: 200,
//                                       child: Column(
//                                         mainAxisAlignment: MainAxisAlignment.center,
//                                         crossAxisAlignment: CrossAxisAlignment.center,
//                                         children: [
//                                           Text(activities[index].name),
//                                           SizedBox(height: 10),
//                                           Image.asset(
//                                             activities[index].image,
//                                             height: 100,
//                                             width: 100,
//                                           ),
//                                           SizedBox(height: 15),
//                                           ElevatedButton(
//                                             onPressed: () {
//                                               _markDayAsCompleted(index);
//                                               Navigator.of(context).pop();
//                                             },
//                                             child: Text('Done'),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   );
//                                 },
//                               );
//                             }
//                           },
//                           child: Container(
//                             margin: EdgeInsets.all(5),
//                             decoration: BoxDecoration(
//                               color: activities[index].completed
//                                   ? Color(0xff881736).withOpacity(0.5)
//                                   : Color(0xff281537).withOpacity(0.5),
//                               border: Border.all(
//                                 color: activities[index].completed
//                                     ? Color(0xff881736)
//                                     : Color(0xff281537),
//                                 width: 2,
//                               ),
//                             ),
//                             child: Stack(
//                               children: [
//                                 Center(
//                                   child: Text('Day ${index + 1}', style: TextStyle(color: Colors.white)),
//                                 ),
//                                 Positioned(
//                                   right: 5,
//                                   top: 5,
//                                   child: Icon(
//                                     activities[index].completed ? Icons.lock : Icons.lock_open,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                     );
//                   }
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:revive/Models/activityModal.dart';
import 'package:revive/Services/activityService.dart';
import 'package:revive/Services/authprovider.dart';

class ChallengeScreen extends StatefulWidget {
  @override
  _ChallengeScreenState createState() => _ChallengeScreenState();
}

class _ChallengeScreenState extends State<ChallengeScreen> {
  final ActivityService _activityService = ActivityService();
  late Future<List<Activity>> futureActivities;

  @override
  void initState() {
    super.initState();
    _loadActivities();
  }

  void _loadActivities() {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    String uid = authProvider.uid!;
    setState(() {
      futureActivities = _activityService.getMergedActivities(uid);
    });
  }

  // Future<void> _markDayAsCompleted(String activityId) async {
  //   try {
  //     final authProvider = Provider.of<AuthProvider>(context, listen: false);
  //     String uid = authProvider.uid!;
  //     await _activityService.markActivityAsCompleted(uid, activityId);
  //     _loadActivities();  // Reload activities to refresh the UI
  //   } catch (e) {
  //     print('Error marking day as completed: $e');
  //   }
  // }


  Future<void> _markDayAsCompleted(String activityId) async {
  try {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    String uid = authProvider.uid!;
    await _activityService.markActivityAsCompleted(uid, activityId);
    
    // Reload activities to refresh the UI
    _loadActivities();  
    
    // Check if 21 items are marked as completed
    final activities = await futureActivities;
    final completedCount = activities.where((activity) => activity.completed).length;
    
    if (completedCount >= 21) {
      // If 21 items are marked as completed, unmark everything and clear all activities
      await _activityService.unmarkAllActivities(uid);
      await _activityService.clearAllActivities(uid);
      
      // Show success message or navigate to another screen
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Congratulations! You have completed the challenge.')),
      );
    }
  } catch (e) {
    print('Error marking day as completed: $e');
  }
}


  bool _canOpenActivity(Activity activity) {
    return !activity.completed;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBar(
          title: Text('21-Day Challenge', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff881736), Color(0xff281537)],
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff881736), Color(0xff281537)],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Do It for 21-Days\n Find A New You',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  Image.asset(
                    'assets/icons/goals.png',
                    width: 150,
                    height: 150,
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            height: double.infinity,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10, bottom: 20),
              child: FutureBuilder<List<Activity>>(
                future: futureActivities,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No activities found'));
                  } else {
                    List<Activity> activities = snapshot.data!;
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      itemCount: activities.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            if (!_canOpenActivity(activities[index])) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('You cannot access this activity again.'),
                                  backgroundColor: Color(0xff881736),
                                ),
                              );
                            } else {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    content: Container(
                                      height: 300,
                                      width: 200,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text(activities[index].name),
                                          SizedBox(height: 10),
                                          Image.asset(
                                            activities[index].image,
                                            height: 100,
                                            width: 100,
                                          ),
                                          SizedBox(height: 15),
                                          ElevatedButton(
                                            onPressed: () {
                                              _markDayAsCompleted(activities[index].id);
                                              Navigator.of(context).pop();
                                            },
                                            child: Text('Done'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            }
                          },
                          child: Container(
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: activities[index].completed
                                  ? Color(0xff881736).withOpacity(0.5)
                                  : Color(0xff281537).withOpacity(0.5),
                              border: Border.all(
                                color: activities[index].completed
                                    ? Color(0xff881736)
                                    : Color(0xff281537),
                                width: 2,
                              ),
                            ),
                            child: Stack(
                              children: [
                                Center(
                                  child: Text('Day ${index + 1}', style: TextStyle(color: Colors.white)),
                                ),
                                Positioned(
                                  right: 5,
                                  top: 5,
                                  child: Icon(
                                    activities[index].completed ? Icons.lock : Icons.lock_open,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
