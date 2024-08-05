



// import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:provider/provider.dart';
// import 'package:revive/Models/therapistModal.dart';
// import 'package:revive/Services/authprovider.dart';
// import 'package:revive/Services/therapistService.dart';

// class ThEditProfile extends StatefulWidget {
//   @override
//   _ThEditProfileState createState() => _ThEditProfileState();
// }

// class _ThEditProfileState extends State<ThEditProfile> {
//   final _formKey = GlobalKey<FormState>();
//   TextEditingController _nameController = TextEditingController();
//   TextEditingController _rciController=TextEditingController();
//   TextEditingController _specializationController = TextEditingController();
//   TextEditingController _descriptionController = TextEditingController();
//   TextEditingController _qualificationController = TextEditingController();
//   TextEditingController _experienceController = TextEditingController();
//   List<TextEditingController> _timeSlotControllers = [TextEditingController()];
//   List<TextEditingController> _appointmentTypeControllers = [TextEditingController()];

//   final TherapistService _therapistService = TherapistService();

//    List<String> _timeSlots=[];
//     List<String> _appointmentType=[];

//   Future<void> _editProfile() async {
//     if (_formKey.currentState!.validate()) {
      
//       final authProvider = Provider.of<AuthProvider>(context, listen: false);
//       String name = _nameController.text;
//       String rci=_rciController.text;
//       String specialization = _specializationController.text;
//       String qualification = _qualificationController.text;
//       String experience = _experienceController.text;
//       String description = _descriptionController.text;
//       List<String> timeSlots = _timeSlotControllers
//           .map((controller) => controller.text)
//           .where((text) => text.isNotEmpty)
//           .toList();
//       List<String> appointmentTypes = _appointmentTypeControllers
//           .map((controller) => controller.text)
//           .where((text) => text.isNotEmpty)
//           .toList();

//       Therapist data = Therapist(
//         name: name,
//         rci: rci,
//         id:authProvider.uid.toString(),
//         qualification: qualification,
//         experience: experience,
//         timeSlots: timeSlots,
//         appointmenttypes: appointmentTypes,
//         description: description,
//         specialization: specialization,
//       );

//       await _therapistService.addOrUpdateTherapistInfo(authProvider.uid, data);
//       Navigator.pop(context);
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Profile updated successfully'),backgroundColor: Color(0xff881736),),
//       );
//     }
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

//  Therapist?  therapist;

//   Future<Therapist?> _fetchTherapistInfo(BuildContext context) async {
//     final authProvider = Provider.of<AuthProvider>(context, listen: false);
// final DocumentSnapshot doc=  await FirebaseFirestore.instance.collection('therapist').doc(authProvider.uid).get();
   
//   therapist= Therapist.fromFirestore(doc);
//    print(therapist);
   
//     return therapist;
//   }

//   setData() {
//     if(therapist!=null){
//       _nameController.text=therapist!.name;
//       _rciController.text=therapist!.rci;
//       _descriptionController.text=therapist!.description;
//       _experienceController.text=therapist!.experience;
//       _specializationController.text=therapist!.specialization;
//       _qualificationController.text=therapist!.qualification;
//       _timeSlots.addAll(therapist!.timeSlots);
//       _appointmentType.addAll(therapist!.appointmenttypes);

//     }
//   }


//   @override
//   void initState() {
// _fetchTherapistInfo(context).then((value) => setData());
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(kToolbarHeight),
//         child: AppBar(
//           title: Text('Edit Profile', style: TextStyle(color: Colors.white)),
//           actions: [
//             IconButton(
//               icon: Icon(Icons.save, color: Colors.white),
//               onPressed: _editProfile,
//             ),
//           ],
//           backgroundColor: Colors.transparent,
//           automaticallyImplyLeading: false,
//           flexibleSpace: Container(
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [Color(0xff881736), Color(0xff281537)],
//               ),
//             ),
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(20.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               SizedBox(height: 20.0),
//               TextFormField(
//                 controller: _nameController,
//                 decoration: InputDecoration(labelText: 'Name'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your name';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 20.0),
//                TextFormField(
//                 controller: _rciController,
//                 decoration: InputDecoration(labelText: 'RCI No/Name'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your registered name/RCI number';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 20.0),
//               TextFormField(
//                 controller: _specializationController,
//                 decoration: InputDecoration(labelText: 'Specialization'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your specialization';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 20.0),
//               TextFormField(
//                 controller: _descriptionController,
//                 decoration: InputDecoration(labelText: 'Description'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter a description';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 20.0),
//               TextFormField(
//                 controller: _qualificationController,
//                 decoration: InputDecoration(labelText: 'Qualification'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your qualification';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 20.0),
//               TextFormField(
//                 controller: _experienceController,
//                 decoration: InputDecoration(
//                   labelText: 'Experience',
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your experience';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 20.0),
//               _buildTimeSlots(),

//               SizedBox(height: 20.0),
//               _buildAppointmentTypes(),
//               SizedBox(height: 20.0),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTimeSlots() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text('enter each timeslot else it may be lost',
//         style: TextStyle(fontSize: 10, color:Colors.grey),
//         ),
//         SizedBox(height:5),
//         Text(
//           'Time Slots',
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//         ),

//         Container(
//           height:50,
//           child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount:_timeSlots.length,
//             itemBuilder: (BuildContext context,int index){
          
//               if(_timeSlots.length==0){
//                 return Text("No slots added");
//               }
          
//               else{
          
//                 return Container(
//                   padding: EdgeInsets.symmetric(horizontal: 15),
//                   width: 110,
//                   child: Card(child: Center(child: Text(_timeSlots[index])),),);
//               }
          
//           },),
//         ),
//         SizedBox(height:5),
//         Column(
//           children: _timeSlotControllers.map((controller) {
//             return Row(
//               children: [
//                 Expanded(
//                   child: TextFormField(
//                     controller: controller,
//                     decoration: InputDecoration(labelText: 'Add Time Slot'),
//                     validator: (value) {
//                       if (_timeSlotControllers
//                               .where((c) => c.text.isNotEmpty)
//                               .isEmpty) {
//                         return 'Please add at least one time slot';
//                       }
//                       return null;
//                     },
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
//                 Text('enter each appointment else it may be lost',
//         style: TextStyle(fontSize: 10, color:Colors.grey),
//         ),
//         Text(
//           'Appointment Types',
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//         Text('video, call, chat', style: TextStyle(fontSize: 12)),
//          Container(
//           height:50,
//           child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount:_timeSlots.length,
//             itemBuilder: (BuildContext context,int index){
          
//               if(_timeSlots.length==0){
//                 return Text("No slots added");
//               }
          
//               else{
          
//                 return Container(
//                   padding: EdgeInsets.symmetric(horizontal: 15),
//                   width: 110,
//                   child: Card(child: Center(child: Text(_appointmentType[index])),),);
//               }
          
//           },),
//         ),
//         SizedBox(height: 5),
//         Column(
//           children: _appointmentTypeControllers.map((controller) {
//             return Row(
//               children: [
//                 Expanded(
//                   child: TextFormField(
//                     controller: controller,
//                     decoration: InputDecoration(labelText: 'Add Appointment Type'),
//                     validator: (value) {
//                       if (_appointmentTypeControllers
//                               .where((c) => c.text.isNotEmpty)
//                               .isEmpty) {
//                         return 'Please add at least one appointment type';
//                       }
//                       return null;
//                     },
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

//     void _showPasswordChangeDialog(BuildContext context) {
//     TextEditingController _oldPasswordController = TextEditingController();
//     TextEditingController _newPasswordController = TextEditingController();
//     TextEditingController _confirmPasswordController = TextEditingController();

//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Change Password'),
//           content: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 TextField(
//                   controller: _oldPasswordController,
//                   decoration: InputDecoration(labelText: 'Old Password'),
//                   obscureText: true,
//                 ),
//                 SizedBox(height: 10),
//                 TextField(
//                   controller: _newPasswordController,
//                   decoration: InputDecoration(labelText: 'New Password'),
//                   obscureText: true,
//                 ),
//                 SizedBox(height: 10),
//                 TextField(
//                   controller: _confirmPasswordController,
//                   decoration: InputDecoration(labelText: 'Confirm Password'),
//                   obscureText: true,
//                 ),
//               ],
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 // Update password logic
//                 if (_newPasswordController.text == _confirmPasswordController.text) {
//                   // Passwords match, update password
//                   // Show snackbar
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(
//                       content: Text('Password updated successfully.'),
//                       duration: Duration(seconds: 2),
//                     ),
//                   );
//                   Navigator.pop(context); // Close dialog
//                 } else {
//                   // Passwords don't match, show error
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     SnackBar(
//                       content: Text('Passwords do not match.'),
//                       duration: Duration(seconds: 2),
//                     ),
//                   );
//                 }
//               },
//               child: Text('OK'),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context); // Close dialog
//               },
//               child: Text('Cancel'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }



import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:revive/Models/therapistModal.dart';
import 'package:revive/Services/authprovider.dart';
import 'package:revive/Services/therapistService.dart';

class ThEditProfile extends StatefulWidget {
  @override
  _ThEditProfileState createState() => _ThEditProfileState();
}

class _ThEditProfileState extends State<ThEditProfile> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _rciController = TextEditingController();
  TextEditingController _specializationController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _qualificationController = TextEditingController();
  TextEditingController _experienceController = TextEditingController();
  List<TextEditingController> _timeSlotControllers = [TextEditingController()];
  List<TextEditingController> _appointmentTypeControllers = [TextEditingController()];

  final TherapistService _therapistService = TherapistService();

  List<String> _timeSlots = [];
  List<String> _appointmentTypes = [];

  Future<void> _editProfile() async {
    if (_formKey.currentState!.validate()) {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      String name = _nameController.text;
      String rci = _rciController.text;
      String specialization = _specializationController.text;
      String qualification = _qualificationController.text;
      String experience = _experienceController.text;
      String description = _descriptionController.text;
      List<String> timeSlots = _timeSlotControllers
          .map((controller) => controller.text)
          .where((text) => text.isNotEmpty)
          .toList();
      List<String> appointmentTypes = _appointmentTypeControllers
          .map((controller) => controller.text)
          .where((text) => text.isNotEmpty)
          .toList();

      Therapist data = Therapist(
        name: name,
        rci: rci,
        id: authProvider.uid.toString(),
        qualification: qualification,
        experience: experience,
        timeSlots: timeSlots,
        appointmenttypes: appointmentTypes,
        description: description,
        specialization: specialization,
      );

      await _therapistService.addOrUpdateTherapistInfo(authProvider.uid, data);
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Profile updated successfully'), backgroundColor: Color(0xff881736)),
      );
    }
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

  Therapist? therapist;

  Future<Therapist?> _fetchTherapistInfo(BuildContext context) async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final DocumentSnapshot doc = await FirebaseFirestore.instance.collection('therapist').doc(authProvider.uid).get();

    therapist = Therapist.fromFirestore(doc);
    return therapist;
  }

  void setData() {
    if (therapist != null) {
      _nameController.text = therapist!.name;
      _rciController.text = therapist!.rci;
      _descriptionController.text = therapist!.description;
      _experienceController.text = therapist!.experience;
      _specializationController.text = therapist!.specialization;
      _qualificationController.text = therapist!.qualification;
      _timeSlots.addAll(therapist!.timeSlots);
      _appointmentTypes.addAll(therapist!.appointmenttypes);
    }
  }

  @override
  void initState() {
    _fetchTherapistInfo(context).then((value) => setData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBar(
          title: Text('Edit Profile', style: TextStyle(color: Colors.white)),
          actions: [
            IconButton(
              icon: Icon(Icons.save, color: Colors.white),
              onPressed: _editProfile,
            ),
          ],
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff881736), Color(0xff281537)],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20.0),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                controller: _rciController,
                decoration: InputDecoration(labelText: 'RCI No/Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your registered name/RCI number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                controller: _specializationController,
                decoration: InputDecoration(labelText: 'Specialization'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your specialization';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                controller: _qualificationController,
                decoration: InputDecoration(labelText: 'Qualification'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your qualification';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                controller: _experienceController,
                decoration: InputDecoration(
                  labelText: 'Experience',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your experience';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              _buildTimeSlots(),
              SizedBox(height: 20.0),
              _buildAppointmentTypes(),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimeSlots() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(child: Text('Enter each timeslot else it may be lost', style: TextStyle(fontSize: 12, color: Colors.grey))),
        SizedBox(height: 5),
        Text(
          'Time Slots',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Visibility(
          visible: _timeSlots.isNotEmpty,
          child: Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _timeSlots.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  width: 110,
                  child: Card(child: Center(child: Text(_timeSlots[index]))),
                );
              },
            ),
          ),
        ),
        SizedBox(height: 5),
        Column(
          children: _timeSlotControllers.map((controller) {
            return Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller,
                    decoration: InputDecoration(labelText: 'Add Time Slot'),
                    validator: (value) {
                      if (_timeSlotControllers.where((c) => c.text.isNotEmpty).isEmpty) {
                        return 'Please add at least one time slot';
                      }
                      return null;
                    },
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
        Center(child: Text('Enter each appointment else it may be lost', style: TextStyle(fontSize: 12, color: Colors.grey))),
        SizedBox(height:5),
        Row(
          children: [
            Text(
              'Appointment Types',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(width:5),
            Text('( Video, call, chat )', style: TextStyle(fontSize: 10)),
          ],
        ),
        
        Visibility(
          visible: _appointmentTypes.isNotEmpty,
          child: Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _appointmentTypes.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  width: 110,
                  child: Card(child: Center(child: Text(_appointmentTypes[index]))),
                );
              },
            ),
          ),
        ),
        SizedBox(height: 5),
        Column(
          children: _appointmentTypeControllers.map((controller) {
            return Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller,
                    decoration: InputDecoration(labelText: 'Add Appointment Type'),
                    validator: (value) {
                      if (_appointmentTypeControllers.where((c) => c.text.isNotEmpty).isEmpty) {
                        return 'Please add at least one appointment type';
                      }
                      return null;
                    },
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

