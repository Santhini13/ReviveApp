
import 'package:flutter/material.dart';

class AddDiaryEntryScreen extends StatefulWidget {
  @override
  _AddDiaryEntryScreenState createState() => _AddDiaryEntryScreenState();
}

class _AddDiaryEntryScreenState extends State<AddDiaryEntryScreen> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  String _selectedMood = 'Neutral'; // Default mood

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight), // Increase the height of the app bar
        child: AppBar(
          title: Text('Add Diary Entry',style:TextStyle(color:Colors.white)),
        actions: [
          IconButton(
            icon: Icon(Icons.save,color:Colors.white),
            onPressed: () {
              _saveDiaryEntry(context);
            },
          ),
        ],
          backgroundColor: Colors.transparent, // Transparent background
          automaticallyImplyLeading: false, // Removes the back button
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff881736), Color(0xff281537)],
              ),
            ),))),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _descriptionController,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: _selectedMood,
              onChanged: (newValue) {
                setState(() {
                  _selectedMood = newValue!;
                });
              },
              items: ['Sad', 'Happy', 'Neutral', 'Angry'].map<DropdownMenuItem<String>>((mood) {
                return DropdownMenuItem<String>(
                  value: mood,
                  child: Text(mood),
                );
              }).toList(),
              decoration: InputDecoration(
                labelText: 'Mood',
                border: OutlineInputBorder(),
              ),
            ),
            // Add image uploading option if needed
          ],
        ),
      ),
    );
  }

  void _saveDiaryEntry(BuildContext context) {
    String title = _titleController.text.trim();
    String description = _descriptionController.text.trim();
    String mood = _selectedMood;
    DateTime dateTime = DateTime.now(); // Current date and time

    // Validate and save the diary entry
    if (title.isNotEmpty && description.isNotEmpty) {
      // Save the diary entry
      // You can save it to a list or a database
      DiaryEntry diaryEntry = DiaryEntry(
        title: title,
        description: description,
        mood: mood,
        dateTime: dateTime,
      );

      // Navigate back to the diary entries screen and pass the new entry
      Navigator.pop(context, diaryEntry);
    } else {
      // Show an error message if any field is empty
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please fill all fields.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}

class DiaryEntry {
  final String title;
  final String description;
  final String mood;
  final DateTime dateTime;

  DiaryEntry({
    required this.title,
    required this.description,
    required this.mood,
    required this.dateTime,
  });
}