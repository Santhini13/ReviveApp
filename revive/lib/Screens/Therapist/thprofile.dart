
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'dart:io';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:provider/provider.dart';
// import 'package:revive/Models/feedbackModal.dart';
// import 'package:revive/Models/therapistModal.dart';
// import 'package:revive/Screens/Therapist/thfeedback.dart';

// class ThProfile extends StatefulWidget {
//   @override
//   State<ThProfile> createState() => _ThProfileState();
// }

// class _ThProfileState extends State<ThProfile> {
//   File? _image;
//   final ImagePicker _picker = ImagePicker();
//   bool _isUploading = false;
//   String? _profileImageUrl;
//   Therapist? therapist;


//    @override
//   void initState() {
//     super.initState();
//     print('Initializing ThProfile state...');
//   _fetchUserProfileImage();
//   _fetchTherapistDetails();
//   }
// Future<void> _fetchTherapistDetails() async {
//     try {
//       final user = FirebaseAuth.instance.currentUser;
//       if (user != null) {
//         final therapistInfo = await fetchTherapistInfo(user.uid);
//         setState(() {
//           therapist = therapistInfo;
//         });
//       }
//     } catch (e) {
//       print('Error fetching therapist details: $e');
//     }
//   }

//   Future<Therapist?> fetchTherapistInfo(String? uid) async {
//     try {
//       final DocumentSnapshot doc = await FirebaseFirestore.instance.collection('users').doc(uid).get();
//       if (doc.exists) {
//         final DocumentSnapshot doc2 = await FirebaseFirestore.instance.collection('therapist').doc(uid).get();
//         return Therapist.fromMap(doc2.data()!);
//       } else {
//         return null;
//       }
//     } catch (e) {
//       print('Error fetching therapist info: $e');
//       throw e;
//     }
//   }
//   Future<void> _pickImage() async {
//     try {
//       final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
//       if (pickedFile != null) {
//         setState(() {
//           _image = File(pickedFile.path);
//         });
//       }
//     } catch (e) {
//       print('Error picking image: $e');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error picking image: $e')),
//       );
//     }
//   }

//   Future<void> _uploadImage() async {
//     if (_image == null) return;

//     setState(() {
//       _isUploading = true;
//     });

//     try {
//       final user = FirebaseAuth.instance.currentUser;
//       if (user != null) {
//         final storageRef = FirebaseStorage.instance
//             .ref()
//             .child('uploads')
//             .child(user.uid)
//             .child('profile.jpg');

//         await storageRef.putFile(_image!);
//         final downloadUrl = await storageRef.getDownloadURL();

//         setState(() {
//           _profileImageUrl = downloadUrl;
//           _image = null;
//         });

//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Uploaded Image URL: $downloadUrl')),
//         );
//       } else {
//         print('No user is signed in.');
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('No user is signed in.')),
//         );
//       }
//     } catch (e) {
//       print('Error uploading image: $e');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error uploading image: $e')),
//       );
//     } finally {
//       setState(() {
//         _isUploading = false;
//       });
//     }
//   }

 

//   Future<void> _fetchUserProfileImage() async {
//     try {

//     //    String dummyImageUrl = 'https://via.placeholder.com/150';


//     // setState(() {
//     //   _profileImageUrl = dummyImageUrl;
//     //   print('123');
//     // });
//       final user = FirebaseAuth.instance.currentUser;
//       if (user != null) {
//         final doc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
//         setState(() {
//           _profileImageUrl = doc.data()?['profileImageUrl'];
         
//         });
//       }
//     } catch (e) {
//       print('Error fetching profile image: $e');
//     }
//   }
//   Future<ImageProvider<Object>?> _getImage() async {
//   if (_image != null) {
//     return FileImage(_image!);
//   } else if (_profileImageUrl != null) {
//     return NetworkImage(_profileImageUrl!);
//   } else {
//     return null; // Return null if no image is available
//   }
// }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: SingleChildScrollView(
//           child: Column(
//             children: <Widget>[
//              FutureBuilder(
//   future: _getImage(),
//   builder: (BuildContext context, AsyncSnapshot<ImageProvider<Object>?> snapshot) {
//     if (snapshot.connectionState == ConnectionState.waiting) {
//       return CircularProgressIndicator();
//     } else if (snapshot.hasError) {
//       return Text('Error loading image');
//     } else {
//       return Stack(
//         children: <Widget>[
//           CircleAvatar(
//             radius: 80,
//             backgroundColor: Colors.grey[300],
//             backgroundImage: snapshot.data, // Use snapshot.data directly
//             child: _image == null && _profileImageUrl == null
//                 ? GestureDetector(
//                     onTap: _pickImage,
//                     child: Icon(
//                       Icons.add_a_photo,
//                       size: 40,
//                       color: Colors.white,
//                     ),
//                   )
//                 : null,
//           ),
//           if (_image != null || _profileImageUrl != null) // Only show edit icon if image is present
//   Positioned(
//     bottom: 0,
//     right: 0,
//     child: PopupMenuButton<String>(
//       itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
//         PopupMenuItem<String>(
//           value: 'add',
//           child: ListTile(
//             leading: Icon(Icons.add_a_photo),
//             title: Text('Add Image'),
//           ),
//         ),
//         PopupMenuItem<String>(
//           value: 'remove',
//           child: ListTile(
//             leading: Icon(Icons.delete),
//             title: Text('Remove Image'),
//           ),
//         ),
//       ],
//       onSelected: (String action) {
//         if (action == 'add') {
//           _pickImage();
//         } else if (action == 'remove') {
//          setState(() {
//     _image = null; // Clear the local image file
//     _profileImageUrl = null; // Clear the profile image URL
//   });
//         }
//       },
//       child: CircleAvatar(
//         backgroundColor: Colors.blue,
//         radius: 25,
//         child: Icon(
//           Icons.edit,
//           color: Colors.white,
//         ),
//       ),
//     ),
//   ),

//         ],
//       );
//     }
//   },
// ),


//               SizedBox(height: 20),
//               _isUploading
//                   ? CircularProgressIndicator()
//                   : ElevatedButton(
//                       onPressed: _uploadImage,
//                       child: Text('Upload Image'),
//                     ),
//               SizedBox(height: 20),
//               ProfileTile(
//                 title: 'Add Profile',
//                 onTap: () {
//                   Navigator.pushNamed(context, '/thedit');
//                 },
//                 icon: Icons.edit,
//               ),
//               ProfileTile(
//                 title: 'View Profile',
//                 onTap: () {
//                  Navigator.pushNamed(context, '/therapistProfile');
//                 },
//                 icon: Icons.view_agenda_outlined,
//               ),
//               ProfileTile(
//                 title: 'Add Video',
//                 onTap: () {
//                   Navigator.pushNamed(context, '/uploadVideo');
//                 },
//                 icon: Icons.video_chat,
//               ),
//               ProfileTile(
//                 title: 'Add Article',
//                 onTap: () {
//                   Navigator.pushNamed(context, '/tharticle');
//                 },
//                 icon: Icons.article,
//               ),
//               ProfileTile(
//                 title: 'Feedback',
//                 icon: Icons.star_border_outlined,
//                 onTap: () {
//                  Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => FeedbackListScreen(therapist:widget.therapist!)),
//                   );
//                 },
//               ),
//               ProfileTile(
//                 icon: Icons.article_outlined,
//                 title: 'Terms & Conditions',
//                 onTap: () {
//                   Navigator.pushNamed(context, '/terms');
//                 },
//               ),
//               ProfileTile(
//                 icon: Icons.privacy_tip,
//                 title: 'Privacy & Policy',
//                 onTap: () {
//                   Navigator.pushNamed(context, '/privacy');
//                 },
//               ),
//               ProfileTile(
//                 icon: Icons.logout,
//                 title: 'Log Out',
//                 onTap: () {
//                   _showConfirmationDialog(
//                       context, 'Log Out', 'Are you sure you want to log out?');
//                 },
//               ),
//               ProfileTile(
//                 icon: Icons.delete,
//                 title: 'Delete Account',
//                 onTap: () {
//                   _showConfirmationDialog(context, 'Delete Account',
//                       'Are you sure you want to delete your account? This action cannot be undone.');
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void _showConfirmationDialog(
//       BuildContext context, String title, String message) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text(title),
//           content: Text(message),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//                 if (title == 'Log Out') {
//                   _signOut(context);
//                 } else if (title == 'Delete Account') {
//                   _deleteAccount(context);
//                 }
//               },
//               child: Text(title),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _signOut(BuildContext context) async {
//     await FirebaseAuth.instance.signOut();
//     Navigator.of(context).pushNamedAndRemoveUntil(
//         '/login', (Route<dynamic> route) => false);
//   }

//   void _deleteAccount(BuildContext context) async {
//     try {
//       final user = FirebaseAuth.instance.currentUser;
//       if (user != null) {
//         await user.delete();
//         Navigator.of(context).pushNamedAndRemoveUntil(
//             '/login', (Route<dynamic> route) => false);
//       }
//     } catch (e) {
//       print('Error deleting account: $e');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error deleting account: $e')),
//       );
//     }
//   }

// void _showFeedbackModalSheet(BuildContext context) async {
//   final user = FirebaseAuth.instance.currentUser;
//   if (user == null) {
//     print('No user signed in.');
//     return;
//   }

//   try {
//     final feedbacksSnapshot = await FirebaseFirestore.instance
//         .collection('feedbacks')
//         .where('therapistId', isEqualTo: user.uid)
//         .orderBy('timestamp', descending: true)
//         .get();

//     final List<FeedbackData> feedbacks = feedbacksSnapshot.docs.map((doc) {
//       return FeedbackData.fromMap(doc.data());
//     }).toList();

//     showModalBottomSheet(
//       context: context,
//       builder: (BuildContext context) {
//         return Container(
//           padding: EdgeInsets.all(20.0),
//           height: 400.0,
//           child: ListView.builder(
//             itemCount: feedbacks.length,
//             itemBuilder: (BuildContext context, int index) {
//               final feedback = feedbacks[index];
//               return ListTile(
//                 title: Row(
//                   children: [
//                     Icon(
//                       Icons.star,
//                       color: Colors.amber,
//                     ),
//                     SizedBox(width: 5),
//                     Text(feedback.rating.toString()),
//                   ],
//                 ),
//                 subtitle: Text(feedback.feedback),
//               );
//             },
//           ),
//         );
//       },
//     );
//   } catch (e) {
//     print('Error fetching feedbacks: $e');
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Error fetching feedbacks: $e')),
//     );
//   }
// }

//   // void _showFeedbackModalSheet(BuildContext context) {
//   //   showModalBottomSheet(
//   //     context: context,
//   //     builder: (BuildContext context) {
//   //       final List<Feedback> feedbacks = [
//   //         Feedback(message: 'Great service!', rating: 4.5),
//   //         Feedback(message: 'Very satisfied with the session.', rating: 5.0),
//   //         Feedback(message: 'Could be better.', rating: 3.0),
//   //       ];
//   //       return Container(
//   //         padding: EdgeInsets.all(20.0),
//   //         height: 400.0,
//   //         child: ListView.builder(
//   //           itemCount: feedbacks.length,
//   //           itemBuilder: (BuildContext context, int index) {
//   //             final feedback = feedbacks[index];
//   //             return ListTile(
//   //               title: Row(
//   //                 children: [
//   //                   Icon(
//   //                     Icons.star,
//   //                     color: Colors.amber,
//   //                   ),
//   //                   SizedBox(width: 5),
//   //                   Text(feedback.rating.toString()),
//   //                 ],
//   //               ),
//   //               subtitle: Text(feedback.message),
//   //             );
//   //           },
//   //         ),
//   //       );
//   //     },
//   //   );
//   // }
// }

// class ProfileTile extends StatelessWidget {
//   final String title;
//   final IconData icon;
//   final VoidCallback onTap;

//   const ProfileTile(
//       {required this.title, required this.onTap, required this.icon});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         decoration:
//             BoxDecoration(border: Border.all(color: Colors.black, width: 0.2)),
//         child: ListTile(
//           title: Text(
//             title,
//             style: TextStyle(
//               color: Color(0xff881736),
//             ),
//           ),
//           leading: Icon(
//             icon,
//             size: 18,
//             color: Color(0xff881736),
//           ),
//           onTap: onTap,
//         ),
//       ),
//     );
//   }
// }


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:revive/Models/feedbackModal.dart';
import 'package:revive/Models/therapistModal.dart';
import 'package:revive/Screens/Therapist/thfeedback.dart';

class ThProfile extends StatefulWidget {
  @override
  State<ThProfile> createState() => _ThProfileState();
}

class _ThProfileState extends State<ThProfile> {
  File? _image;
  bool _isUploading = false;
  String? _profileImageUrl;
  Therapist? therapist;

  @override
  void initState() {
    super.initState();
    print('Initializing ThProfile state...');
    _fetchUserProfileImage();
    _fetchTherapistDetails();
  }

  Future<void> _fetchTherapistDetails() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final therapistInfo = await fetchTherapistInfo(user.uid);
        setState(() {
          therapist = therapistInfo;
        });
      }
    } catch (e) {
      print('Error fetching therapist details: $e');
    }
  }

  Future<Therapist?> fetchTherapistInfo(String? uid) async {
    try {
      final DocumentSnapshot doc =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      if (doc.exists) {
        final DocumentSnapshot doc2 =
            await FirebaseFirestore.instance.collection('therapist').doc(uid).get();
        return Therapist.fromFirestore(doc2);
      } else {
        return null;
      }
    } catch (e) {
      print('Error fetching therapist info: $e');
      throw e;
    }
  }


  Future<void> _uploadImage() async {
    if (_image == null) return;

    setState(() {
      _isUploading = true;
    });

    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final storageRef = FirebaseStorage.instance
            .ref()
            .child('uploads')
            .child(user.uid)
            .child('profile.jpg');

        await storageRef.putFile(_image!);
        final downloadUrl = await storageRef.getDownloadURL();

        setState(() {
          _profileImageUrl = downloadUrl;
          _image = null;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Uploaded Image URL: $downloadUrl')),
        );
      } else {
        print('No user is signed in.');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('No user is signed in.')),
        );
      }
    } catch (e) {
      print('Error uploading image: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error uploading image: $e')),
      );
    } finally {
      setState(() {
        _isUploading = false;
      });
    }
  }

  Future<void> _fetchUserProfileImage() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final doc =
            await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
        setState(() {
          _profileImageUrl = doc.data()?['profileImageUrl'];
        });
      }
    } catch (e) {
      print('Error fetching profile image: $e');
    }
  }

  Future<ImageProvider<Object>?> _getImage() async {
    if (_image != null) {
      return FileImage(_image!);
    } else if (_profileImageUrl != null) {
      return NetworkImage(_profileImageUrl!);
    } else {
      return null; // Return null if no image is available
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              // FutureBuilder(
              //   future: _getImage(),
              //   builder: (BuildContext context, AsyncSnapshot<ImageProvider<Object>?> snapshot) {
              //     if (snapshot.connectionState == ConnectionState.waiting) {
              //       return CircularProgressIndicator();
              //     } else if (snapshot.hasError) {
              //       return Text('Error loading image');
              //     } else {
              //       return Stack(
              //         children: <Widget>[
              //           CircleAvatar(
              //             radius: 80,
              //             backgroundColor: Colors.grey[300],
              //             backgroundImage: snapshot.data, // Use snapshot.data directly
              //             child: _image == null && _profileImageUrl == null
              //                 ? GestureDetector(
              //                     onTap: _pickImage,
              //                     child: Icon(
              //                       Icons.add_a_photo,
              //                       size: 40,
              //                       color: Colors.white,
              //                     ),
              //                   )
              //                 : null,
              //           ),
              //           if (_image != null || _profileImageUrl != null)
              //             // Only show edit icon if image is present
              //             Positioned(
              //               bottom: 0,
              //               right: 0,
              //               child: PopupMenuButton<String>(
              //                 itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              //                   PopupMenuItem<String>(
              //                     value: 'add',
              //                     child: ListTile(
              //                       leading: Icon(Icons.add_a_photo),
              //                       title: Text('Add Image'),
              //                     ),
              //                   ),
              //                   PopupMenuItem<String>(
              //                     value: 'remove',
              //                     child: ListTile(
              //                       leading: Icon(Icons.delete),
              //                       title: Text('Remove Image'),
              //                     ),
              //                   ),
              //                 ],
              //                 onSelected: (String action) {
              //                   if (action == 'add') {
              //                     _pickImage();
              //                   } else if (action == 'remove') {
              //                     setState(() {
              //                       _image = null; // Clear the local image file
              //                       _profileImageUrl = null; // Clear the profile image URL
              //                     });
              //                   }
              //                 },
              //                 child: CircleAvatar(
              //                   backgroundColor: Colors.blue,
              //                   radius: 25,
              //                   child: Icon(
              //                     Icons.edit,
              //                     color: Colors.white,
              //                   ),
              //                 ),
              //               ),
              //             ),
              //         ],
              //       );
              //     }
              //   },
              // ),
              // SizedBox(height: 20),
              // _isUploading
              //     ? CircularProgressIndicator()
              //     : ElevatedButton(
              //         onPressed: _uploadImage,
              //         child: Text('Upload Image'),
              //       ),
              // SizedBox(height: 20),
              ProfileTile(
                title: 'Add Profile',
                onTap: () {
                  Navigator.pushNamed(context, '/thedit');
                },
                icon: Icons.edit,
              ),
              ProfileTile(
                title: 'View Profile',
                onTap: () {
                  Navigator.pushNamed(context, '/therapistProfile');
                },
                icon: Icons.view_agenda_outlined,
              ),
              ProfileTile(
                title: 'Add Video',
                                onTap: () {
                  Navigator.pushNamed(context, '/uploadVideo');
                },
                icon: Icons.video_chat,
              ),
              ProfileTile(
                title: 'Add Article',
                onTap: () {
                  Navigator.pushNamed(context, '/tharticle');
                },
                icon: Icons.article,
              ),
              ProfileTile(
                title: 'Feedback',
                icon: Icons.star_border_outlined,
                onTap: () {
                  if (therapist != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FeedbackListScreen(therapist: therapist!)),
                    );
                  } else {
                     ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('No feedbacks Yet'),
          backgroundColor:  Color(0xff881736),
        ),
      );
                    print('Therapist data is null.');
                  }
                },
              ),
              ProfileTile(
                icon: Icons.article_outlined,
                title: 'Terms & Conditions',
                onTap: () {
                  Navigator.pushNamed(context, '/terms');
                },
              ),
              ProfileTile(
                icon: Icons.privacy_tip,
                title: 'Privacy & Policy',
                onTap: () {
                  Navigator.pushNamed(context, '/privacy');
                },
              ),
              ProfileTile(
                icon: Icons.logout,
                title: 'Log Out',
                onTap: () {
                  _showConfirmationDialog(
                    context,
                    'Log Out',
                    'Are you sure you want to log out?',
                  );
                },
              ),
              ProfileTile(
                icon: Icons.delete,
                title: 'Delete Account',
                onTap: () {
                  _showConfirmationDialog(
                    context,
                    'Delete Account',
                    'Are you sure you want to delete your account? This action cannot be undone.',
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                if (title == 'Log Out') {
                  _signOut(context);
                } else if (title == 'Delete Account') {
                  _deleteAccount(context);
                }
              },
              child: Text(title),
            ),
          ],
        );
      },
    );
  }

  void _signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
  }

  void _deleteAccount(BuildContext context) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await user.delete();
        Navigator.of(context).pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
      }
    } catch (e) {
      print('Error deleting account: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error deleting account: $e')),
      );
    }
  }
}

class ProfileTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const ProfileTile({required this.title, required this.onTap, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 0.2)),
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(
              color: Color(0xff881736),
            ),
          ),
          leading: Icon(
            icon,
            size: 18,
            color: Color(0xff881736),
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}



// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'dart:io';
// import 'package:image_picker/image_picker.dart';
// import 'package:revive/Models/therapistModal.dart';
// import 'package:revive/Screens/Therapist/thfeedback.dart';

// class ThProfile extends StatefulWidget {
//   @override
//   State<ThProfile> createState() => _ThProfileState();
// }

// class _ThProfileState extends State<ThProfile> {
//   final ImagePicker _picker = ImagePicker();
//   String? _profileImageUrl;
//   Therapist? therapist;

//   @override
//   void initState() {
//     super.initState();
//     print('Initializing ThProfile state...');
//     _fetchUserProfileImage();
//     _fetchTherapistDetails();
//   }

//   Future<void> _fetchTherapistDetails() async {
//     try {
//       final user = FirebaseAuth.instance.currentUser;
//       if (user != null) {
//         final therapistInfo = await fetchTherapistInfo(user.uid);
//         setState(() {
//           therapist = therapistInfo;
//         });
//       }
//     } catch (e) {
//       print('Error fetching therapist details: $e');
//     }
//   }

//   Future<Therapist?> fetchTherapistInfo(String? uid) async {
//     try {
//       final DocumentSnapshot doc =
//           await FirebaseFirestore.instance.collection('users').doc(uid).get();
//       if (doc.exists) {
//         final DocumentSnapshot doc2 =
//             await FirebaseFirestore.instance.collection('therapist').doc(uid).get();
//         return Therapist.fromFirestore(doc2);
//       } else {
//         return null;
//       }
//     } catch (e) {
//       print('Error fetching therapist info: $e');
//       throw e;
//     }
//   }

//   Future<void> _fetchUserProfileImage() async {
//     try {
//       final user = FirebaseAuth.instance.currentUser;
//       if (user != null) {
//         final doc =
//             await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
//         setState(() {
//           _profileImageUrl = doc.data()?['profileImageUrl'];
//         });
//       }
//     } catch (e) {
//       print('Error fetching profile image: $e');
//     }
//   }

//   Future<ImageProvider<Object>?> _getImage() async {
//     if (_profileImageUrl != null) {
//       return NetworkImage(_profileImageUrl!);
//     } else {
//       return null; // Return null if no image is available
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: SingleChildScrollView(
//           child: Column(
//             children: <Widget>[
//               FutureBuilder(
//                 future: _getImage(),
//                 builder: (BuildContext context, AsyncSnapshot<ImageProvider<Object>?> snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return CircularProgressIndicator();
//                   } else if (snapshot.hasError) {
//                     return Text('Error loading image');
//                   } else {
//                     return CircleAvatar(
//                       radius: 80,
//                       backgroundColor: Colors.grey[300],
//                       backgroundImage: snapshot.data, // Use snapshot.data directly
//                     );
//                   }
//                 },
//               ),
//               SizedBox(height: 20),
//               ProfileTile(
//                 title: 'Add Profile',
//                 onTap: () {
//                   Navigator.pushNamed(context, '/thedit');
//                 },
//                 icon: Icons.edit,
//               ),
//               // Add other ProfileTile widgets here
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ProfileTile extends StatelessWidget {
//   final String title;
//   final IconData icon;
//   final VoidCallback onTap;

//   const ProfileTile({required this.title, required this.onTap, required this.icon});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 0.2)),
//         child: ListTile(
//           title: Text(
//             title,
//             style: TextStyle(
//               color: Color(0xff881736),
//             ),
//           ),
//           leading: Icon(
//             icon,
//             size: 18,
//             color: Color(0xff881736),
//           ),
//           onTap: onTap,
//         ),
//       ),
//     );
//   }
// }
