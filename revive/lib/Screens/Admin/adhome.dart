
import 'package:flutter/material.dart';
import 'package:revive/Models/UserModal.dart';
import 'package:revive/Services/UserService.dart';

class AdHome extends StatefulWidget {
  @override
  _AdHomeState createState() => _AdHomeState();
}

class _AdHomeState extends State<AdHome> {
  String _selectedOption = '';
  final FirebaseService _firebaseService = FirebaseService();
  late final Users user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: Text('Admin', style: TextStyle(color: Colors.white)),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff881736), Color(0xff281537)],
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.settings,color: Colors.white,),
            onPressed: () {
              _showSettingsDialog(context);
            },
          ),
        ],
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20),
              _buildOptionTile('Users', '/viewuser'),
              SizedBox(height: 10),
              _buildOptionTile('Therapists', '/adtherapist'),
              SizedBox(height: 10),
              _buildOptionTile('Activities', ''),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionTile(String option, String route) {
    return ExpansionTile(
      title: Text(
        option,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Color(0xff881736),
      collapsedBackgroundColor: Color(0xff881736),
      childrenPadding: EdgeInsets.only(left: 20, bottom: 10),
      children: [
         if (option == 'Users')
          ListTile(
            title: Text(
              'View Users',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/viewuser');
            },
          ),
        if (option == 'Therapists')
          ListTile(
            title: Text(
              'View Therapist',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/adtherapist');
            },
          ),
        if (option == 'Activities') ...[
          ListTile(
            title: Text(
              'View Videos',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/advideo');
            },
          ),
          ListTile(
            title: Text(
              'View Articles',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/adarticle');
            },
          ),
          ListTile(
            title: Text(
              'View Feedback',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/adfeedback');
            },
          ),
        ],
      ],
    );
  }

  void _showSettingsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Settings'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: Icon(Icons.add),
                title: Text('Add Admin'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/addAdmin');
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout'),
                onTap: () {
                  Navigator.pop(context);
                  _showConfirmationDialog(context, 'Log Out',
                      'Are you sure you want to log out?');
                },
              ),
            ],
          ),
        );
      },
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
                _signOut(context);
              },
              child: Text(title),
            ),
          ],
        );
      },
    );
  }

  void _signOut(BuildContext context) async {
    await _firebaseService.signOut();
    Navigator.of(context).pushNamedAndRemoveUntil(
        '/login', (Route<dynamic> route) => false);
  }

  void _showChangePasswordDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Change Password'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Old Password'),
                obscureText: true,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'New Password'),
                obscureText: true,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Confirm Password'),
                obscureText: true,
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _performPasswordChange(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _performPasswordChange(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Password changed successfully!'),
    ));
  }
}
