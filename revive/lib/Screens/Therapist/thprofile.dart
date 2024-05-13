import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:revive/Screens/Therapist/thnavbar.dart';

class ThProfile extends StatelessWidget {
  int _selectedIndex=3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left side: Image
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/doc1.jpg'), // Placeholder image
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  // Right side: Qualifications and Experience
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dr. Emily Smith',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Licensed Clinical Psychologist',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                        // Sections
                        
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              ProfileTile(
                          title: 'Edit Profile',
                          onTap: () {
                            // Show modal screen for editing profile
                            Navigator.pushNamed(context, '/thedit');
                          }, 
                          icon: Icons.edit,
                        ),
                        ProfileTile(
                          title: 'View Profile',
                          onTap: () {
                            // Show modal screen for adding certification
                            showBottomSheet(context, 'Add Certification');
                          }, icon: Icons.view_agenda_outlined,
                        ),
                        ProfileTile(
                          title: 'Add Certification',
                          onTap: () {
                            // Show modal screen for adding certification
                            showBottomSheet(context, 'Add Certification');
                          }, icon: Icons.add,
                        ),
                        ProfileTile(
                          title: 'Add Video',
                          onTap: () {
                            // Show modal screen for adding video
                            showBottomSheet(context, 'Add Video');
                          }, icon: Icons.video_chat,
                        ),
                        ProfileTile(
                          title: 'Add Article',
                          onTap: () {
                            // Show modal screen for adding article
                            Navigator.pushNamed(context, '/tharticle');
                          }, icon: Icons.article,
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
                        _showConfirmationDialog(context, 'Log Out',
                            'Are you sure you want to log out?');
                      },
                    ),
                    ProfileTile(
                      icon: Icons.delete,
                      title:'Delete Account',
                      onTap: () {
                        _showConfirmationDialog(context, 'Delete Account',
                            'Are you sure you want to delete your account?');
                      },
                    ),
          
                        // ProfileTile(
                        //   title: 'View Appointment Schedules',
                        //   //Icon: Icon(Icons.calendar_month),
                        //   onTap: () {
                        //     // Show modal screen for viewing appointment schedules
                        //     showBottomSheet(context, 'View Appointment Schedules');
                        //   }, icon: Icons.calendar_month,
                        // ),
                        // ProfileTile(
                        //   title: 'Settings',
                        //   onTap: () {
                        //     // Show modal screen for settings
                        //     showBottomSheet(context, 'Settings');
                        //   }, icon: Icons.settings,
                        // ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: thnavBar(selectedIndex: _selectedIndex,),
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
              // Perform log out or delete account action here
              Navigator.of(context).pop();
            },
            child: Text(title),
          ),
        ],
      );
    },
  );
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

  const ProfileTile({required this.title, required this.onTap, required this.icon
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black,width: 0.2)
        ),
        child: ListTile(
          title: Text(title,style: TextStyle(color: Color(0xff881736),),),
          leading:Icon(icon,size: 18,color: Color(0xff881736),),
          onTap: onTap,
        ),
      ),
    );
  }
}