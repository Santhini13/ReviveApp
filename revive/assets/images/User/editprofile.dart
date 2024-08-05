import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:revive/Models/roleUserModal.dart';
import 'package:revive/Services/authprovider.dart';
import 'package:revive/Services/roleUserService.dart';
import 'package:revive/Services/therapistService.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final roleUserService _roleUserService=roleUserService();
  
 Future<void> _editProfile() async{
   String name = _nameController.text;
 roleUser data= roleUser(
  name:name,
 );
final authProvider = Provider.of<AuthProvider>(context, listen: false);
 await _roleUserService.addOrUpdateroleUserInfo(authProvider.uid,data);
 
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight), // Increase the height of the app bar
        child: AppBar(
          title:Text('Edit Profile',style:TextStyle(color:Colors.white),),
          actions: [
            IconButton(
            icon: Icon(Icons.save,color:Colors.white),
             onPressed: _editProfile
             //() {
            //   // Save profile changes
            //    String name = _nameController.text;
            //   String email = _emailController.text;
            //   String phone = _phoneController.text;
            //   // Perform actions with the entered data
            // },
          ),
        ],
          backgroundColor: Colors.transparent, // Transparent background
          automaticallyImplyLeading: false, // Removes the back button
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff881736), Color(0xff281537)],
              ),
            ),))),
      
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20.0),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 20.0),
            // TextField(
            //   controller: _emailController,
            //   decoration: InputDecoration(labelText: 'Email'),
            // ),
            // SizedBox(height: 20.0),
            // TextField(
            //   controller: _phoneController,
            //   decoration: InputDecoration(labelText: 'Phone'),
            //   keyboardType: TextInputType.phone,
            // ),
            // SizedBox(height: 20.0),
           ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff881736),
                minimumSize: Size(60, 50),
              ),
              onPressed: () => _showPasswordChangeDialog(context),
              child: Text('Update Password',style:TextStyle(color:Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
 void _showPasswordChangeDialog(BuildContext context) {
    TextEditingController _oldPasswordController = TextEditingController();
    TextEditingController _newPasswordController = TextEditingController();
    TextEditingController _confirmPasswordController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Change Password'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _oldPasswordController,
                  decoration: InputDecoration(labelText: 'Old Password'),
                  obscureText: true,
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _newPasswordController,
                  decoration: InputDecoration(labelText: 'New Password'),
                  obscureText: true,
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _confirmPasswordController,
                  decoration: InputDecoration(labelText: 'Confirm Password'),
                  obscureText: true,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                // Update password logic
                if (_newPasswordController.text == _confirmPasswordController.text) {
                  // Passwords match, update password
                  // Show snackbar
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Password updated successfully.'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                  Navigator.pop(context); // Close dialog
                } else {
                  // Passwords don't match, show error
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Passwords do not match.'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                }
              },
              child: Text('OK'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close dialog
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
