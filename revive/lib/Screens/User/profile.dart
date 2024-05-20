// import 'package:flutter/material.dart';
// import 'package:revive/Screens/User/navbar.dart';
// import 'package:revive/Screens/User/editprofile.dart';
// import 'package:revive/Services/UserService.dart';


// class userProfile extends StatelessWidget {
//   int _selectedIndex = 4;
//   final FirebaseService _firebaseService = FirebaseService();

//   @override
//   Widget build(BuildContext context) {
//      return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(kToolbarHeight), // Increase the height of the app bar
//         child: AppBar(
//           title:Text('My Profile',style:TextStyle(color:Colors.white),),
//           backgroundColor: Colors.transparent, // Transparent background
//           automaticallyImplyLeading: false, // Removes the back button
//           flexibleSpace: Container(
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [Color(0xff881736), Color(0xff281537)],
//               ),
//             ),))),
//       body: Padding(
//         padding: EdgeInsets.only(top: 10.0, left: 30, right: 30, bottom: 20),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               CircleAvatar(
//                 radius: 50,
//                 backgroundImage: AssetImage('assets/images/user.png'),
//               ),
//               SizedBox(height: 10),
//               Text(
//                 'John Doe',
//                 style: TextStyle(
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 20),
//               ListView(
//                 shrinkWrap: true,
//                 physics: NeverScrollableScrollPhysics(),
//                 children: [
//                   ProfileOption(
//                     icon: Icons.edit,
//                     label: 'Edit Profile', 
//                     onPressed: () { 
//                       Navigator.pushNamed(context, '/edituser');
//                      },
//                   ),
//                    ProfileOption(
//                     icon: Icons.text_snippet,
//                     label: 'My Assessment Report ', 
//                     onPressed: () { 
//                       Navigator.pushNamed(context, '/reportcard');
//                      },
//                   ),
//                    ProfileOption(
//                     icon: Icons.favorite_outline,
//                     label: 'My Therapist', 
//                     onPressed: () { 
//                       Navigator.pushNamed(context, '/favorite');
//                      },
//                   ), ProfileOption(
//                     icon: Icons.history,
//                     label: 'Appointment History', 
//                     onPressed: () { 
//                       Navigator.pushNamed(context, '/userhistory');
//                      },
//                   ),
//                   ProfileOption(
//                     icon: Icons.article_outlined,
//                     label: 'Terms & Conditions', 
//                     onPressed: () { 
//                       Navigator.pushNamed(context, '/terms');
//                      },
//                   ),
//                   ProfileOption(
//                     icon: Icons.privacy_tip,
//                     label: 'Privacy & Policy', 
//                     onPressed: () { 
//                       Navigator.pushNamed(context, '/privacy');
//                      },
//                   ),
                 
//                   ProfileOption(
//                     icon: Icons.logout,
//                     label: 'Log Out',
//                     onPressed: () {
//                       _showConfirmationDialog(context, 'Log Out',
//                           'Are you sure you want to log out?');
//                     },
//                   ),
//                   // ProfileOption(
//                   //   icon: Icons.delete,
//                   //   label:'Delete Account',
//                   //   onPressed: () {
//                   //     _showConfirmationDialog(context, 'Delete Account',
//                   //         'Are you sure you want to delete your account?');
//                   //   },
//                   // ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//      bottomNavigationBar: NavBar(selectedIndex: _selectedIndex, userRole: UserRole.User,),
//     );
//   }
// }

// void _showConfirmationDialog(
//     BuildContext context, String title, String message) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text(title),
//         content: Text(message),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             child: Text('Cancel'),
//           ),
//           TextButton(
//             onPressed: () {
//               if (title == 'Log Out') {
//                   _signOut(context);
//                 }
//               // Perform log out or delete account action here
//               Navigator.of(context).pop();
//             },
//             child: Text(title),
//           ),
//         ],
//       );
//     },
//   );
// }
// void _signOut(BuildContext context) async {
//     await _firebaseService.signOut(); // Call the sign-out method from FirebaseService
//     Navigator.of(context).pushNamedAndRemoveUntil(
//         '/login', (Route<dynamic> route) => false); // Redirect to the login screen
//   }
// class ProfileOption extends StatelessWidget {
//   final IconData icon;
//   final String label;
//   final VoidCallback onPressed;
  

//   const ProfileOption({
//     Key? key,
//     required this.icon,
//     required this.label,
//     required this.onPressed,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//        onTap: onPressed,
//       child: Padding(
//         padding: const EdgeInsets.only(top:18.0,right: 8,left: 8),
//         child: Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             border: Border.all(color: Colors.black,width: 0.1)
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Row(
//               children: [
//                 Icon(icon, color: Color(0xff881736),size: 20),
//                 SizedBox(width: 10),
//                 Text(
//                   label,
//                   style: TextStyle(fontSize: 18, color:  Color(0xff881736),),
//                   textAlign: TextAlign.center,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:revive/Screens/User/navbar.dart';
import 'package:revive/Screens/User/editprofile.dart';
import 'package:revive/Services/UserService.dart';

class userProfile extends StatelessWidget {
  int _selectedIndex = 4;
  final FirebaseService _firebaseService = FirebaseService(); // Initialize the FirebaseService

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight), // Increase the height of the app bar
        child: AppBar(
          title: Text(
            'My Profile',
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
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/user.png'),
              ),
              SizedBox(height: 10),
              Text(
                'John Doe',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  ProfileOption(
                    icon: Icons.edit,
                    label: 'Edit Profile',
                    onPressed: () {
                      Navigator.pushNamed(context, '/edituser');
                    },
                  ),
                  ProfileOption(
                    icon: Icons.text_snippet,
                    label: 'My Assessment Report',
                    onPressed: () {
                      Navigator.pushNamed(context, '/reportcard');
                    },
                  ),
                  ProfileOption(
                    icon: Icons.favorite_outline,
                    label: 'My Therapist',
                    onPressed: () {
                      Navigator.pushNamed(context, '/favorite');
                    },
                  ),
                  ProfileOption(
                    icon: Icons.history,
                    label: 'Appointment History',
                    onPressed: () {
                      Navigator.pushNamed(context, '/userhistory');
                    },
                  ),
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
