import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:revive/Models/journalModal.dart';
import 'package:revive/Screens/general/itemNote.dart';
import 'package:revive/Services/authprovider.dart';
import 'package:revive/Services/journalServices.dart';

class DiaryEntriesScreen extends StatefulWidget {
  @override
  _DiaryEntriesScreenState createState() => _DiaryEntriesScreenState();
}

class _DiaryEntriesScreenState extends State<DiaryEntriesScreen> {
  final JournalService _journalService = JournalService();
  List<Journal> _diaryEntries = [];

  @override
  void initState() {
    super.initState();
    _fetchJournal();
  }

  Future<void> _fetchJournal() async {
    print('fetchJournal123');
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    try {
      List<Journal> journals = await _journalService.fetchJournals(authProvider.uid);
      setState(() {
        _diaryEntries = journals;
      });
    } catch (e) {
      print('Error fetching journals: $e');
    }
  }

  Future<void> _confirmDelete(int index) async {
  try {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    

    setState(() {
      _diaryEntries.removeAt(index);
    });

    Navigator.pop(context); // Pop the delete confirmation dialog
  } catch (e) {
    print('Error deleting entry: $e');
    // Handle error
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    'Write Up Your Daily\n Thoughts',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  Image.asset(
                    'assets/icons/diary.png',
                    width: 150,
                    height: 150,
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: _diaryEntries.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.book, size: 100),
                      SizedBox(height: 20),
                      Text('Start writing your diary entries!'),
                    ],
                  )
                : Padding(
                    padding: const EdgeInsets.only(left: 5, right: 1, top: 200),
                    child: ListView.builder(
                      itemCount: _diaryEntries.length,
                      itemBuilder: (context, index) {
                        Journal entry = _diaryEntries[index];
                        String formattedDate = _getFormattedDate(entry.date);
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: ListTile(
                            title: Text(entry.title),
                            leading: Container(
                              width: 50,
                              decoration: BoxDecoration(
                                color: Color(0xff881736),
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Column(
                                children: [
                                  Text(formattedDate, style: TextStyle(color: Colors.white)),
                                  Text('${entry.date.day}', style: TextStyle(color: Colors.white, fontSize: 14)),
                                  Text('${entry.date.year}', style: TextStyle(color: Colors.white)),
                                ],
                              ),
                            ),
                            trailing: IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                _deleteEntry(index);
                              },
                            ),
                            onTap: () {
                              _showFullEntry(context, entry);
                            },
                          ),
                        );
                      },
                    ),
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Journal? newEntry = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddDiaryEntryScreen()),
          );
          if (newEntry != null) {
            setState(() {
              _diaryEntries.add(newEntry);
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }

  String _getFormattedDate(DateTime dateTime) {
    return DateFormat(' MMMM ').format(dateTime);
  }

  void _deleteEntry(int index) {
    setState(() {
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
                  setState(() {
                    _confirmDelete(index);
                    
                  });
                  Navigator.pop(context); // Pop the delete confirmation dialog
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    });
  }

  void _showFullEntry(BuildContext context, Journal entry) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          width: double.infinity,
          height: 500,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  entry.title,
                  style: TextStyle(color: Color(0xff881736), fontWeight: FontWeight.bold, fontSize: 30),
                ),
                SizedBox(height: 10),
                Text('Date: ${entry.date.day}/${entry.date.month}/${entry.date.year}'),
                SizedBox(height: 5),
                Text('Mood: ${entry.mood}'),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    child: Text(entry.description),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
