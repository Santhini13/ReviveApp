
import 'package:flutter/material.dart';
import 'package:revive/Services/UserService.dart';
import 'dart:io';
class ThProfile extends StatefulWidget {
  //  final Users user;
  // const ThProfile({Key? key, required this.user}) : super(key: key);
  @override
  State<ThProfile> createState() => _ThProfileState();
}



class _ThProfileState extends State<ThProfile> {
  final FirebaseService _firebaseService = FirebaseService();
  File? _image;
  final ImagePicker _picker = ImagePicker();

   Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = pickedFile;
    });
  }

    @override
 void initState(){
    super.initState();
  }

  @override   
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView( 
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left side: Image
                  GestureDetector(
              onTap: _pickImage,
              child: CircleAvatar(
                radius: 50.0,
                backgroundImage: _image != null
                    ? FileImage(File(_image!.path))
                    : AssetImage('assets/images/user.png') as ImageProvider,
                child: _image == null ? Icon(Icons.add_a_photo) : null,
              ),
            ),
                  SizedBox(width: 20),
                  // Right side: Qualifications and Experience
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'helo',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Licensed Clinical Psychologist',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ProfileTile(
                title: 'Edit Profile',
                onTap: () {
                  Navigator.pushNamed(context, '/thedit');
                },
                icon: Icons.edit,
              ),
              ProfileTile(
                title: 'View Profile',
                onTap: () {
                  Navigator.pushNamed(context, '/thedit');
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
                  _showFeedbackModalSheet(context);
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
                      context, 'Log Out', 'Are you sure you want to log out?');
                },
              ),
              ProfileTile(
                icon: Icons.delete,
                title: 'Delete Account',
                onTap: () {
                  _showConfirmationDialog(context, 'Delete Account',
                      'Are you sure you want to delete your account? This action cannot be undone.');
                },
              ),
            ],
          ),
        ),
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
                Navigator.of(context).pop(); // Just dismiss the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog first
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
      await _firebaseService.deleteAccount(); // Call the delete account method from FirebaseService
      Navigator.of(context).pushNamedAndRemoveUntil(
          '/login', (Route<dynamic> route) => false); // Redirect to the login screen
    } catch (e) {
      print('Error deleting account: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error deleting account: $e')),
      );
    }
  }

  void showBottomSheet(BuildContext context, String title) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'Modal content goes here.',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Close'),
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

class ProfileTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const ProfileTile(
      {required this.title, required this.onTap, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration:
            BoxDecoration(border: Border.all(color: Colors.black, width: 0.2)),
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

void _showFeedbackModalSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      final List<Feedback> feedbacks = [
        Feedback(message: 'Great service!', rating: 4.5),
        Feedback(message: 'Very satisfied with the session.', rating: 5.0),
        Feedback(message: 'Could be better.', rating: 3.0),
      ];
      return Container(
        padding: EdgeInsets.all(20.0),
        height: 400.0,
        child: ListView.builder(
          itemCount: feedbacks.length,
          itemBuilder: (BuildContext context, int index) {
            final feedback = feedbacks[index];
            return ListTile(
              title: Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  SizedBox(width: 5),
                  Text(feedback.rating.toString()),
                ],
              ),
              subtitle: Text(feedback.message),
            );
          },
        ),
      );
    },
  );
}

class Feedback {
  final String message;
  final double rating;

  Feedback({
    required this.message,
    required this.rating,
  });
}
