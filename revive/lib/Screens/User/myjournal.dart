import 'package:flutter/material.dart';
import 'package:revive/Models/itemNote.dart';

class DiaryEntriesListScreen extends StatefulWidget {
  final List<DiaryEntry> diaryEntries;

  DiaryEntriesListScreen({required this.diaryEntries});

  @override
  _DiaryEntriesListScreenState createState() => _DiaryEntriesListScreenState();
}

class _DiaryEntriesListScreenState extends State<DiaryEntriesListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diary Entries'),
      ),
      body: ListView.builder(
        itemCount: widget.diaryEntries.length,
        itemBuilder: (context, index) {
          DiaryEntry entry = widget.diaryEntries[index];
          return ListTile(
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(entry.title),
                Text('${entry.dateTime.day}/${entry.dateTime.month}/${entry.dateTime.year}'),
                SizedBox(height: 5),
                Text(entry.mood),
              ],
            ),
            title: Text(entry.title),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                // Show delete confirmation dialog
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Delete Entry'),
                      content: Text('Are you sure you want to delete this entry?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            // Delete the entry and update the list
                            setState(() {
                              widget.diaryEntries.removeAt(index);
                            });
                            Navigator.pop(context);
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
