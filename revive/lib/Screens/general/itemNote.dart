
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:revive/Models/journalModal.dart';
// import 'package:revive/Services/authprovider.dart';
// import 'package:revive/Services/journalServices.dart';

// class AddDiaryEntryScreen extends StatefulWidget {
//   @override
//   _AddDiaryEntryScreenState createState() => _AddDiaryEntryScreenState();
// }

// class _AddDiaryEntryScreenState extends State<AddDiaryEntryScreen> {
//   TextEditingController _titleController = TextEditingController();
//   TextEditingController _descriptionController = TextEditingController();
//   String _selectedMood = 'Neutral'; // Default mood
//   final JournalService _journalService=JournalService();

//   Future<void>_saveJournal()async{
//      Journal journal = Journal(
//       id:'',
//         title: _titleController.text,
//         description: _descriptionController.text,
//         mood: _selectedMood,
//         date:DateTime.now()
//       );

      
//     final authProvider=Provider.of<AuthProvider>(context,listen: false);
//       try{
        
//         await _journalService.registerJournal(journal,authProvider.uid);
//         Navigator.pop(context);

//       }catch(e){
//         print(e);
//       }
//   }
 
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//        appBar: PreferredSize(
//         preferredSize: Size.fromHeight(kToolbarHeight), // Increase the height of the app bar
//         child: AppBar(
//           title: Text('Add Diary Entry',style:TextStyle(color:Colors.white)),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.save,color:Colors.white),
//             onPressed: () {
//               _saveJournal();
//             },
//           ),
//         ],
//           backgroundColor: Colors.transparent, // Transparent background
//           automaticallyImplyLeading: false, // Removes the back button
//           flexibleSpace: Container(
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [Color(0xff881736), Color(0xff281537)],
//               ),
//             ),))),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 10),
//             TextFormField(
//               controller: _titleController,
//               decoration: InputDecoration(
//                 labelText: 'Title',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 10),
//             TextFormField(
//               controller: _descriptionController,
//               maxLines: 3,
//               decoration: InputDecoration(
//                 labelText: 'Description',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 10),
//             DropdownButtonFormField<String>(
//               value: _selectedMood,
//               onChanged: (newValue) {
//                 setState(() {
//                   _selectedMood = newValue!;
//                 });
//               },
//               items: ['Sad', 'Happy', 'Neutral', 'Angry'].map<DropdownMenuItem<String>>((mood) {
//                 return DropdownMenuItem<String>(
//                   value: mood,
//                   child: Text(mood),
//                 );
//               }).toList(),
//               decoration: InputDecoration(
//                 labelText: 'Mood',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             // Add image uploading option if needed
//           ],
//         ),
//       ),
//     );
//   }

// }


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:revive/Models/journalModal.dart';
import 'package:revive/Services/authprovider.dart';
import 'package:revive/Services/journalServices.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddDiaryEntryScreen extends StatefulWidget {
  @override
  _AddDiaryEntryScreenState createState() => _AddDiaryEntryScreenState();
}

class _AddDiaryEntryScreenState extends State<AddDiaryEntryScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String _selectedMood = 'Neutral'; // Default mood
  final JournalService _journalService = JournalService();

  Future<void> _saveJournal() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    if (authProvider.uid == null || authProvider.uid!.isEmpty) {
      print('Error: User ID is null or empty');
      return;
    }

    final String journalId = FirebaseFirestore.instance.collection('journals').doc().id;
    Journal journal = Journal(
      id: journalId,
      title: _titleController.text,
      description: _descriptionController.text,
      mood: _selectedMood,
      date: DateTime.now(),
    );

    try {
      await _journalService.registerJournal(journal, authProvider.uid);
      Navigator.pop(context, journal); // Pass the new journal back to the previous screen
    } catch (e) {
      print('Error saving journal: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight), // Increase the height of the app bar
        child: AppBar(
          title: Text('Add Diary Entry', style: TextStyle(color: Colors.white)),
          actions: [
            IconButton(
              icon: Icon(Icons.save, color: Colors.white),
              onPressed: _saveJournal,
            ),
          ],
          backgroundColor: Colors.transparent, // Transparent background
          automaticallyImplyLeading: false, // Removes the back button
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff881736), Color(0xff281537)],
              ),
            ),
          ),
        ),
      ),
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
              items: ['Sad', 'Happy', 'Neutral', 'Angry']
                  .map<DropdownMenuItem<String>>((mood) {
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
}


