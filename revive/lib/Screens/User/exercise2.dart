// import 'package:flutter/material.dart';

// class ExerciseDetailScreen extends StatefulWidget {
//   final String exerciseName;
//   final String exerciseImage;

//   ExerciseDetailScreen({required this.exerciseName, required this.exerciseImage});

//   @override
//   _ExerciseDetailScreenState createState() => _ExerciseDetailScreenState();
// }

// class _ExerciseDetailScreenState extends State<ExerciseDetailScreen> {
//   List<String> days = [];
//   int activeIndex = -1;
//   List<bool> completedDays = [];
//   bool showListOnly = false;

//   @override
//   void initState() {
//     super.initState();
//     days = List.generate(7, (index) => 'Day ${index + 1}');
//     completedDays = List.generate(7, (index) => false);
//   }

//   void activateDay(int index) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Day ${index + 1}'),
//           content: SizedBox(
//             width: 400,
//             height: 200,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text('Content of Day ${index + 1}'),
//                 ElevatedButton(
//                   onPressed: () {
//                     setState(() {
//                       completedDays[index] = true;
//                       if (index < days.length - 1) {
//                         activeIndex = index + 1;
//                       } else {
//                         activeIndex = -1;
//                       }
//                     });
//                     Navigator.of(context).pop();
//                   },
//                   child: Text('Done'),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             width: double.infinity,
//             height: 200,
//             color: Color(0xff881736),
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 20.0, left: 40),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       widget.exerciseName,
//                       style: TextStyle(fontSize: 36, color: Colors.white),
//                     ),
//                     SizedBox(height: 20),
//                     Image.asset(
//                       widget.exerciseImage,
//                       height: 150,
//                       width: 150,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Center(
//             child: Padding(
//               padding: const EdgeInsets.only(top: 200.0,left:20,right: 20 ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: <Widget>[
//                   SizedBox(height: 20.0),
//                   if (!showListOnly)...[
//                     ElevatedButton(
//                       onPressed: () {
//                         setState(() {
//                           activeIndex = 0;
//                           showListOnly = true;
//                         });
//                       },
//                       style: ElevatedButton.styleFrom(
//                         padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
//                         backgroundColor: Color(0xff881736), // Change the color here
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10.0),
//                         ),
//                       ),
//                       child: Text('Start',style: TextStyle(color: Colors.white),),
//                     ),
//                   ],
//                   SizedBox(height: 20.0),
//                   if (showListOnly) ...[
//                     Expanded(
//                       child: ListView.builder(
//                         itemCount: days.length,
//                         itemBuilder: (context, index) {
//                           return GestureDetector(
//                             onTap: () {
//                               if (completedDays[index]) return;
//                               setState(() {
//                                 activeIndex = index;
//                               });
//                               activateDay(index);
//                             },
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 border: Border.all(color: Color(0xff281537),
//                                 width: 2),
//                                 borderRadius: BorderRadius.circular(10.0),
//                                 color: activeIndex == index ? Colors.blue : null,                        
//                               ),
//                               margin: EdgeInsets.symmetric(vertical: 10.0),
//                               child: ListTile(
//                                 title: Text(days[index]),
//                                 trailing: completedDays[index]
//                                     ? Icon(Icons.check)
//                                     : null,
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                   ]
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'dart:async';

class ExerciseDetailScreen extends StatefulWidget {
  final String exerciseName;
  final String exerciseImage;

  ExerciseDetailScreen({required this.exerciseName, required this.exerciseImage});

  @override
  _ExerciseDetailScreenState createState() => _ExerciseDetailScreenState();
}

class _ExerciseDetailScreenState extends State<ExerciseDetailScreen> {
  List<String> days = [];
  int activeIndex = -1;
  List<bool> completedDays = [];
  bool showListOnly = false;

  @override
  void initState() {
    super.initState();
    days = List.generate(7, (index) => 'Day ${index + 1}');
    completedDays = List.generate(7, (index) => false);
  }

  void activateDay(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return TimerAlertDialog(
          onDone: () {
            setState(() {
              completedDays[index] = true;
              if (index < days.length - 1) {
                activeIndex = index + 1;
              } else {
                activeIndex = -1;
              }
            });
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            color: Color(0xff881736),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.exerciseName,
                      style: TextStyle(fontSize: 36, color: Colors.white),
                    ),
                    SizedBox(height: 20),
                    Image.asset(
                      widget.exerciseImage,
                      height: 150,
                      width: 150,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 200.0,left:20,right: 20 ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 20.0),
                  if (!showListOnly)...[
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          activeIndex = 0;
                          showListOnly = true;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 15.0),
                        backgroundColor: Color(0xff881736), // Change the color here
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Text('Start',style: TextStyle(color: Colors.white),),
                    ),
                  ],
                  SizedBox(height: 20.0),
                  if (showListOnly) ...[
                    Expanded(
                      child: ListView.builder(
                        itemCount: days.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              if (completedDays[index]) return;
                              setState(() {
                                activeIndex = index;
                              });
                              activateDay(index);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xff281537),
                                width: 2),
                                borderRadius: BorderRadius.circular(10.0),
                                color: activeIndex == index ? Colors.blue : null,                        
                              ),
                              margin: EdgeInsets.symmetric(vertical: 10.0),
                              child: ListTile(
                                title: Text(days[index]),
                                trailing: completedDays[index]
                                    ? Icon(Icons.check)
                                    : null,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ]
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TimerAlertDialog extends StatefulWidget {
  final Function() onDone;

  TimerAlertDialog({required this.onDone});

  @override
  _TimerAlertDialogState createState() => _TimerAlertDialogState();
}

class _TimerAlertDialogState extends State<TimerAlertDialog> {
  late Timer _timer;
  int _secondsLeft = 30;
  bool _timerRunning = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

 void _startTimer() {
    setState(() {
      _timerRunning = true;
    });
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        _secondsLeft--;
      });
    });
  }

  void _pauseTimer() {
    _timer.cancel();
    setState(() {
      _timerRunning = false;
    });
  }

  void _stopTimer() {
    _timer.cancel();
    setState(() {
      _timerRunning = false;
      _secondsLeft = 30; // Reset timer
    });
  }

  void _done() {
    widget.onDone(); // Close the dialog
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Exercise Timer'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('$_secondsLeft seconds left'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: _timerRunning ? _pauseTimer : _startTimer,
                child: Text(_timerRunning ? 'Pause' : 'Start'),
              ),
              ElevatedButton(
                onPressed: _stopTimer,
                child: Text('Stop'),
              ),
            ],
          ),
          if (_secondsLeft == 0)
            ElevatedButton(
              onPressed: _done,
              child: Text('Done'),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
