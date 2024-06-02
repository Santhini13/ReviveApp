import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:revive/Models/UserModal.dart';
import 'package:revive/Screens/User/navbar.dart';
import 'package:revive/Screens/User/editprofile.dart';
import 'package:revive/Services/UserService.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_core/firebase_core.dart';

class userProfile extends StatefulWidget {
   final Users user;
  const userProfile({Key? key, required this.user}) : super(key: key);
  @override
  State<userProfile> createState() => _userProfileState();
}

class _userProfileState extends State<userProfile> {
   File? _image;
  final ImagePicker _picker = ImagePicker();
  bool _isUploading = false;
  String? _profileImageUrl;


   @override
  void initState() {
    super.initState();
    print('Initializing ThProfile state...');
  _fetchUserProfileImage();
  }

  Future<void> _pickImage() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });
      }
    } catch (e) {
      print('Error picking image: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error picking image: $e')),
      );
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

    //    String dummyImageUrl = 'https://via.placeholder.com/150';


    // setState(() {
    //   _profileImageUrl = dummyImageUrl;
    //   print('123');
    // });
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final doc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
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

  int _selectedIndex = 4;

  final FirebaseService _firebaseService = FirebaseService(); 
 // Initialize the FirebaseService
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight), // Increase the height of the app bar
        child: AppBar(
          title: Text(
            widget.user.username,
            style: TextStyle(color: Colors.white),
          ),
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
      body: Padding(
        padding: EdgeInsets.only(top: 10.0, left: 30, right: 30, bottom: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:<Widget> [
//               FutureBuilder(
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
// ),SizedBox(height: 10),
//               _isUploading
//                   ? CircularProgressIndicator()
//                   : ElevatedButton(
//                       onPressed: _uploadImage,
//                       child: Text('Upload Image'),
//                     ),
              SizedBox(height: 10),
              // Text(
              //    widget.user.username,
              //   style: TextStyle(
              //     fontSize: 24,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  // ProfileOption(
                  //   icon: Icons.edit,
                  //   label: 'Edit Profile',
                  //   onPressed: () {
                  //     Navigator.pushNamed(context, '/adhome');
                  //   },
                  // ),
                  ProfileOption(
                    icon: Icons.text_snippet,
                    label: 'My Assessment Report',
                    onPressed: () {
                      Navigator.pushNamed(context, '/reportcard');
                    },
                  ),
                  // ProfileOption(
                  //   icon: Icons.favorite_outline,
                  //   label: 'My Therapist',
                  //   onPressed: () {
                  //     Navigator.pushNamed(context, '/favorite');
                  //   },
                  // ),
                  // ProfileOption(
                  //   icon: Icons.history,
                  //   label: 'Appointment History',
                  //   onPressed: () {
                  //     Navigator.pushNamed(context, '/userhistory');
                  //   },
                  // ),
                  ProfileOption(
                    icon: Icons.article_outlined,
                    label: 'Terms & Conditions',
                    onPressed: () {
                      Navigator.pushNamed(context, '/terms');
                    },
                  ),
                  ProfileOption(
                    icon: Icons.privacy_tip,
                    label: 'Privacy & Policy',
                    onPressed: () {
                      Navigator.pushNamed(context, '/privacy');
                    },
                  ),
                  ProfileOption(
                    icon: Icons.logout,
                    label: 'Log Out',
                    onPressed: () {
                      _showConfirmationDialog(context, 'Log Out',
                          'Are you sure you want to log out?');
                    },
                  ),
                  ProfileOption(
                    icon: Icons.delete,
                    label: 'Delete Account',
                    onPressed: () {
                      _showConfirmationDialog(context, 'Delete Account',
                          'Are you sure you want to delete your account? This action cannot be undone.');
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavBar(
        selectedIndex: _selectedIndex,
        userRole: UserRole.User,
      ),
    );
  }

  void _showConfirmationDialog(
      BuildContext context, String title, String message) {
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
    await _firebaseService.signOut(); // Call the sign-out method from FirebaseService
    Navigator.of(context).pushNamedAndRemoveUntil(
        '/login', (Route<dynamic> route) => false); // Redirect to the login screen
  }

  void _deleteAccount(BuildContext context) async {
    try {
      await _firebaseService.deleteAccount();
       Navigator.popUntil(context, ModalRoute.withName('/login')); // Call the delete account method from FirebaseService
      // Navigator.of(context).pushNamedAndRemoveUntil(
      //     '/login', (Route<dynamic> route) => false); // Redirect to the login screen
    } catch (e) {
      print('Error deleting account: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error deleting account: $e')),
      );
    }
  }
}

class ProfileOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const ProfileOption({
    Key? key,
    required this.icon,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(top: 18.0, right: 8, left: 8),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black, width: 0.1),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Icon(icon, color: Color(0xff881736), size: 20),
                SizedBox(width: 10),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xff881736),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
