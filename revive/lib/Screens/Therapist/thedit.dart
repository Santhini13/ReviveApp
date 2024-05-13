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
  TextEditingController _qualificationController = TextEditingController();
  TextEditingController _experienceController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  List<TextEditingController> _timeSlotControllers = [TextEditingController()];
  List<TextEditingController> _appointmentTypeControllers = [TextEditingController()];
  XFile? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = pickedFile;
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
      appBar: AppBar(
        title: Text('Edit Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              // Save profile changes
              String name = _nameController.text;
              String email = _emailController.text;
              String qualification = _qualificationController.text;
              String experience = _experienceController.text;
              String password = _passwordController.text;
              List<String> timeSlots = _timeSlotControllers.map((controller) => controller.text).toList();
              List<String> appointmentTypes = _appointmentTypeControllers.map((controller) => controller.text).toList();
              // Perform actions with the entered data
            },
          ),
        ],
      ),
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
                    : AssetImage('assets/placeholder.jpg') as ImageProvider,
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
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Update Password'),
              obscureText: true,
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
        SizedBox(height: 10),
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
}
