import 'package:flutter/material.dart';

class MoodTracker extends StatefulWidget {
  @override
  _MoodTrackerState createState() => _MoodTrackerState();
}

class _MoodTrackerState extends State<MoodTracker> {
  String _selectedMood = '😐'; // Default mood emoji

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _selectedMood = '😢'; // Sad
              });
            },
            child: Text(
              '😢',
              style: TextStyle(fontSize: 30),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _selectedMood = '😐'; // Neutral
              });
            },
            child: Text(
              '😐',
              style: TextStyle(fontSize: 30),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _selectedMood = '😊'; // Happy
              });
            },
            child: Text(
              '😊',
              style: TextStyle(fontSize: 30),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _selectedMood = '😡'; // Angry
              });
            },
            child: Text(
              '😡',
              style: TextStyle(fontSize: 30),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _selectedMood = '😭'; // Crying
              });
            },
            child: Text(
              '😭',
              style: TextStyle(fontSize: 30),
            ),
          ),
        ],
      ),
    );
  }
}
