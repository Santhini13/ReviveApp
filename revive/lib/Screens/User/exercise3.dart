import 'dart:async';

import 'package:flutter/material.dart';

class TimerAlertDialog extends StatefulWidget {
  @override
  _TimerAlertDialogState createState() => _TimerAlertDialogState();
}

class _TimerAlertDialogState extends State<TimerAlertDialog> {
  late Timer _timer;
  int _secondsPassed = 0;
  bool _timerRunning = false;

  @override
  void initState() {
    super.initState();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        _secondsPassed++;
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
    });
  }

  void _done() {
    Navigator.of(context).pop(); // Close the dialog
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Exercise Timer'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(_formatTime(_secondsPassed)),
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
        ],
      ),
    );
  }

  String _formatTime(int seconds) {
    int hours = seconds ~/ 3600;
    int minutes = (seconds % 3600) ~/ 60;
    int remainingSeconds = seconds % 60;

    String hoursStr = (hours < 10) ? '0$hours' : '$hours';
    String minutesStr = (minutes < 10) ? '0$minutes' : '$minutes';
    String secondsStr = (remainingSeconds < 10) ? '0$remainingSeconds' : '$remainingSeconds';

    return '$hoursStr:$minutesStr:$secondsStr';
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}