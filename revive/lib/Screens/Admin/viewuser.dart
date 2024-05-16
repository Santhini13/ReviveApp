// import 'package:flutter/material.dart';
// import 'package:firebase_database/firebase_database.dart';

// class ViewUserScreen extends StatefulWidget {
//   const ViewUserScreen({Key? key}) : super(key: key);

//   @override
//   _ViewUserScreenState createState() => _ViewUserScreenState();
// }

// class _ViewUserScreenState extends State<ViewUserScreen> {
//   final DatabaseReference _userRef =
//       FirebaseDatabase.instance.reference().child('users');

//   late List<Map<dynamic, dynamic>> _users;

//   @override
//   void initState() {
//     super.initState();
//     _fetchUsers();
//   }

//   Future<void> _fetchUsers() async {
//     DataSnapshot dataSnapshot = await _userRef.once();
//     setState(() {
//       _users = List<Map<dynamic, dynamic>>.from(dataSnapshot.value);
//     });
//   }

//   Future<void> _removeUser(String userId) async {
//     await _userRef.child(userId).remove();
//     _fetchUsers();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('View Users'),
//       ),
//       body: _users != null
//           ? ListView.builder(
//               itemCount: _users.length,
//               itemBuilder: (context, index) {
//                 final user = _users[index];
//                 final userId = user.keys.first;
//                 final userName = user.values.first['name'];
//                 return ListTile(
//                   title: Text(userName),
//                   trailing: IconButton(
//                     icon: Icon(Icons.delete),
//                     onPressed: () {
//                       showDialog(
//                         context: context,
//                         builder: (context) {
//                           return AlertDialog(
//                             title: Text('Remove User?'),
//                             content: Text('Are you sure you want to remove $userName?'),
//                             actions: <Widget>[
//                               TextButton(
//                                 onPressed: () => Navigator.of(context).pop(),
//                                 child: Text('Cancel'),
//                               ),
//                               TextButton(
//                                 onPressed: () {
//                                   _removeUser(userId);
//                                   Navigator.of(context).pop();
//                                 },
//                                 child: Text('Remove'),
//                               ),
//                             ],
//                           );
//                         },
//                       );
//                     },
//                   ),
//                 );
//               },
//             )
//           : Center(
//               child: CircularProgressIndicator(),
//             ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:revive/Screens/constants/myAppbar.dart';

class ViewUserScreen extends StatelessWidget {
  const ViewUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'View User'), 
      body: ListView.builder(
        itemCount: 5, // Placeholder for user list
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('User ${index + 1}'), // Placeholder user name
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                // Add logic to remove user
                print('Remove user ${index + 1}');
              },
            ),
          );
        },
      ),
    );
  }
}