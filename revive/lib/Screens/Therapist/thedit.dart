// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class ThEditProfile extends StatefulWidget {
//   @override
//   _ThEditProfileState createState() => _ThEditProfileState();
// }

// class _ThEditProfileState extends State<ThEditProfile> {
//   TextEditingController _nameController = TextEditingController();
//   TextEditingController _emailController = TextEditingController();
//   TextEditingController _qualificationController = TextEditingController();
//   TextEditingController _experienceController = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();
//   List<TextEditingController> _timeSlotControllers = [TextEditingController()];
//   List<TextEditingController> _appointmentTypeControllers = [TextEditingController()];
//   XFile? _image;

//   Future<void> _pickImage() async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//     setState(() {
//       _image = pickedFile;
//     });
//   }

//   void _addTimeSlotField() {
//     setState(() {
//       _timeSlotControllers.add(TextEditingController());
//     });
//   }

//   void _addAppointmentTypeField() {
//     setState(() {
//       _appointmentTypeControllers.add(TextEditingController());
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Edit Profile'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.save),
//             onPressed: () {
//               // Save profile changes
//               String name = _nameController.text;
//               String email = _emailController.text;
//               String qualification = _qualificationController.text;
//               String experience = _experienceController.text;
//               String password = _passwordController.text;
//               List<String> timeSlots = _timeSlotControllers.map((controller) => controller.text).toList();
//               List<String> appointmentTypes = _appointmentTypeControllers.map((controller) => controller.text).toList();
//               // Perform actions with the entered data
//             },
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             GestureDetector(
//               onTap: _pickImage,
//               child: CircleAvatar(
//                 radius: 50.0,
//                 backgroundImage: _image != null
//                     ? FileImage(File(_image!.path))
//                     : AssetImage('assets/placeholder.jpg') as ImageProvider,
//                 child: _image == null ? Icon(Icons.add_a_photo) : null,
//               ),
//             ),
//             SizedBox(height: 20.0),
//             TextField(
//               controller: _nameController,
//               decoration: InputDecoration(labelText: 'Name'),
//             ),
//             SizedBox(height: 20.0),
//             TextField(
//               controller: _emailController,
//               decoration: InputDecoration(labelText: 'Email'),
//             ),
//             SizedBox(height: 20.0),
//             TextField(
//               controller: _qualificationController,
//               decoration: InputDecoration(labelText: 'Qualification'),
//             ),
//             SizedBox(height: 20.0),
//             TextField(
//               controller: _experienceController,
//               decoration: InputDecoration(labelText: 'Experience'),
//             ),
//             SizedBox(height: 20.0),
//             _buildTimeSlots(),
//             SizedBox(height: 20.0),
//             _buildAppointmentTypes(),
//             SizedBox(height: 20.0),
//             TextField(
//               controller: _passwordController,
//               decoration: InputDecoration(labelText: 'Update Password'),
//               obscureText: true,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildTimeSlots() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'Time Slots',
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//         SizedBox(height: 10),
//         Column(
//           children: _timeSlotControllers.map((controller) {
//             return Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: controller,
//                     decoration: InputDecoration(labelText: 'Add Time Slot'),
//                   ),
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.add),
//                   onPressed: _addTimeSlotField,
//                 ),
//               ],
//             );
//           }).toList(),
//         ),
//       ],
//     );
//   }

//   Widget _buildAppointmentTypes() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'Appointment Types',
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//         SizedBox(height: 10),
//         Column(
//           children: _appointmentTypeControllers.map((controller) {
//             return Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: controller,
//                     decoration: InputDecoration(labelText: 'Add Appointment Type'),
//                   ),
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.add),
//                   onPressed: _addAppointmentTypeField,
//                 ),
//               ],
//             );
//           }).toList(),
//         ),
//       ],
//     );
//   }
// }
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ThEditProfile extends StatefulWidget {
  @override
  _ThEditProfileState createState() => _ThEditProfileState();
}

class _ThEditProfileState extends State<ThEditProfile> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _descriptionController =TextEditingController();
  TextEditingController _qualificationController = TextEditingController();
  TextEditingController _experienceController = TextEditingController();
  TextEditingController _oldPasswordController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  List<TextEditingController> _timeSlotControllers = [TextEditingController()];
  List<TextEditingController> _appointmentTypeControllers = [TextEditingController()];
  XFile? _image;
  XFile? _certificate;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = pickedFile;
    });
  }

  Future<void> _pickCertificate() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery, maxWidth: 300, maxHeight: 300);
    setState(() {
      _certificate = pickedFile;
    });
  }

  void _addTimeSlotField() {
    setState(() {
      _timeSlotControllers.add(TextEditingController());
    });
  }

  void _addAppointmentTypeField() {
    setState(() {
      _appointmentTypeControllers.add(TextEditingController());
    });
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
            onPressed: () {
              // Save profile changes
              String name = _nameController.text;
              String email = _emailController.text;
              String qualification = _qualificationController.text;
              String experience = _experienceController.text;
              List<String> timeSlots = _timeSlotControllers.map((controller) => controller.text).toList();
              List<String> appointmentTypes = _appointmentTypeControllers.map((controller) => controller.text).toList();
              // Perform actions with the entered data
            },
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
            SizedBox(height: 20.0),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _qualificationController,
              decoration: InputDecoration(labelText: 'Qualification'),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _experienceController,
              decoration: InputDecoration(labelText: 'Experience'),
            ),
            SizedBox(height: 20.0),
            _buildTimeSlots(),
            SizedBox(height: 20.0),
            _buildAppointmentTypes(),
            SizedBox(height: 20.0),
            _certificate != null
                ? Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Certificate.pdf',
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.cancel),
                          onPressed: () {
                            setState(() {
                              _certificate = null;
                            });
                          },
                        ),
                      ],
                    ),
                  )
                : ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff881736),
                minimumSize: Size(60, 50),
              ),
                    onPressed: _pickCertificate,
                    child: Text('Upload Certificate (PDF)',style:TextStyle(color:Colors.white)),
                  ),
                  SizedBox(height: 20.0),
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

  Widget _buildTimeSlots() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Time Slots',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Column(
          children: _timeSlotControllers.map((controller) {
            return Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(labelText: 'Add Time Slot'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: _addTimeSlotField,
                ),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildAppointmentTypes() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Appointment Types',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text('video,call,chat',style:TextStyle(fontSize:12)),
        SizedBox(height: 5),
        Column(
          children: _appointmentTypeControllers.map((controller) {
            return Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(labelText: 'Add Appointment Type'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: _addAppointmentTypeField,
                ),
              ],
            );
          }).toList(),
        ),
      ],
    );
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
}
