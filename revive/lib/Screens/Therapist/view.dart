// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:revive/Models/therapistModal.dart';
// import 'package:revive/Services/authprovider.dart';
// import 'package:revive/Services/therapistService.dart';

// class TherapistProfileScreen extends StatelessWidget {
//   final TherapistService _therapistService = TherapistService();

//   Future<Therapist?> _fetchTherapistInfo(BuildContext context) async {
//     final authProvider = Provider.of<AuthProvider>(context, listen: false);
//     return await _therapistService.fetchTherapistInfo(authProvider.uid);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Profile',style:TextStyle(color:Colors.white)),
//         flexibleSpace: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Color(0xff881736), Color(0xff281537)],
//             ),
//           ),
//         ),
//       ),
//       body: FutureBuilder<Therapist?>(
//         future: _fetchTherapistInfo(context),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data == null) {
//             return Center(child: Text('No data found'));
//           }

//           Therapist therapist = snapshot.data!;
//           return SingleChildScrollView(
//             padding: EdgeInsets.all(20.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 SizedBox(height: 20.0),
//                 Text(
//                   'Name: ${therapist.name}',
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 10.0),
//                 Text(
//                   'Specialization: ${therapist.specialization}',
//                   style: TextStyle(fontSize: 16),
//                 ),
//                 SizedBox(height: 10.0),
//                 Text(
//                   'Description: ${therapist.description}',
//                   style: TextStyle(fontSize: 16),
//                 ),
//                 SizedBox(height: 10.0),
//                 Text(
//                   'Qualification: ${therapist.qualification}',
//                   style: TextStyle(fontSize: 16),
//                 ),
//                 SizedBox(height: 10.0),
//                 Text(
//                   'Experience: ${therapist.experience}',
//                   style: TextStyle(fontSize: 16),
//                 ),
//                 SizedBox(height: 10.0),
//                 if (therapist.timeSlots != null && therapist.timeSlots!.isNotEmpty)
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Time Slots:',
//                         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                       ),
//                       ...therapist.timeSlots!.map((slot) => Text(slot)).toList(),
//                     ],
//                   ),
//                 SizedBox(height: 10.0),
//                 if (therapist.appointmenttypes != null && therapist.appointmenttypes!.isNotEmpty)
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Appointment Types:',
//                         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                       ),
//                       ...therapist.appointmenttypes!.map((type) => Text(type)).toList(),
//                     ],
//                   ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:revive/Models/therapistModal.dart';
// import 'package:revive/Services/authprovider.dart';
// import 'package:revive/Services/therapistService.dart';

// class TherapistProfileScreen extends StatelessWidget {
//   final TherapistService _therapistService = TherapistService();

//   Future<Therapist?> _fetchTherapistInfo(BuildContext context) async {
//     final authProvider = Provider.of<AuthProvider>(context, listen: false);
//     return await _therapistService.fetchTherapistInfo(authProvider.uid);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Profile', style: TextStyle(color: Colors.white)),
//         flexibleSpace: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Color(0xff881736), Color(0xff281537)],
//             ),
//           ),
//         ),
//       ),
//       body: FutureBuilder<Therapist?>(
//         future: _fetchTherapistInfo(context),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData || snapshot.data == null) {
//             return Center(child: Text('No data found'));
//           }

//           Therapist therapist = snapshot.data!;
//           return SingleChildScrollView(
//             padding: EdgeInsets.all(20.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 SizedBox(height: 20.0),
//                 // Placeholder for profile image
//                 Center(
//                   child: CircleAvatar(
//                     radius: 50,
//                     backgroundColor: Color(0xff881736),
//                     child: Icon(
//                       Icons.person,
//                       size: 50,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 20.0),
//                 Card(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   elevation: 4,
//                   margin: EdgeInsets.symmetric(vertical: 10),
//                   child: ListTile(
//                     leading: Icon(Icons.person, color: Color(0xff281537)),
//                     title: Text(
//                       'Name',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     subtitle: Text(therapist.name),
//                   ),
//                 ),
//                 Card(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   elevation: 4,
//                   margin: EdgeInsets.symmetric(vertical: 10),
//                   child: ListTile(
//                     leading: Icon(Icons.medical_services, color: Color(0xff281537)),
//                     title: Text(
//                       'Specialization',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     subtitle: Text(therapist.specialization),
//                   ),
//                 ),
//                 Card(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   elevation: 4,
//                   margin: EdgeInsets.symmetric(vertical: 10),
//                   child: ListTile(
//                     leading: Icon(Icons.description, color: Color(0xff281537)),
//                     title: Text(
//                       'Description',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     subtitle: Text(therapist.description),
//                   ),
//                 ),
//                 Card(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   elevation: 4,
//                   margin: EdgeInsets.symmetric(vertical: 10),
//                   child: ListTile(
//                     leading: Icon(Icons.school, color: Color(0xff281537)),
//                     title: Text(
//                       'Qualification',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     subtitle: Text(therapist.qualification),
//                   ),
//                 ),
//                 Card(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   elevation: 4,
//                   margin: EdgeInsets.symmetric(vertical: 10),
//                   child: ListTile(
//                     leading: Icon(Icons.work, color: Color(0xff281537)),
//                     title: Text(
//                       'Experience',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                     subtitle: Text(therapist.experience),
//                   ),
//                 ),
//                 if (therapist.timeSlots != null && therapist.timeSlots!.isNotEmpty)
//                   Card(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                     elevation: 4,
//                     margin: EdgeInsets.symmetric(vertical: 10),
//                     child: ListTile(
//                       leading: Icon(Icons.schedule, color: Color(0xff281537)),
//                       title: Text(
//                         'Time Slots',
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       subtitle: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: therapist.timeSlots!.map((slot) => Text(slot)).toList(),
//                       ),
//                     ),
//                   ),
//                 if (therapist.appointmenttypes != null && therapist.appointmenttypes!.isNotEmpty)
//                   Card(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                     ),
//                     elevation: 4,
//                     margin: EdgeInsets.symmetric(vertical: 10),
//                     child: ListTile(
//                       leading: Icon(Icons.event_available, color: Color(0xff281537)),
//                       title: Text(
//                         'Appointment Types',
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       subtitle: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: therapist.appointmenttypes!.map((type) => Text(type)).toList(),
//                       ),
//                     ),
//                   ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:revive/Models/therapistModal.dart';
import 'package:revive/Services/authprovider.dart';
import 'package:revive/Services/therapistService.dart';

class TherapistProfileScreen extends StatelessWidget {
  final TherapistService _therapistService = TherapistService();

  Future<Therapist?> _fetchTherapistInfo(BuildContext context) async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    return await _therapistService.fetchTherapistInfo(authProvider.uid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile', style: TextStyle(color: Colors.white)),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff881736), Color(0xff281537)],
            ),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: FutureBuilder<Therapist?>(
        future: _fetchTherapistInfo(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text('No data found'));
          }

          Therapist therapist = snapshot.data!;
          return SingleChildScrollView(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child:  CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors
                                .grey[300], // Background color of the avatar
                            child: Text(
                              therapist.name.substring(
                                  0, 1), // Get the first letter of the name
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff881736), // Color of the text
                              ),
                            ),
                          ),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Personal Information',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff281537),
                  ),
                ),
                Divider(color: Colors.grey),
                _buildProfileItem(Icons.person, 'Name', therapist.name),
                _buildProfileItem(Icons.medical_services, 'Specialization', therapist.specialization),
                _buildProfileItem(Icons.school, 'Qualification', therapist.qualification),
                _buildProfileItem(Icons.work, 'Experience', therapist.experience),
                SizedBox(height: 20.0),
                Text(
                  'Description',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff281537),
                  ),
                ),
                Divider(color: Colors.grey),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 4,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      therapist.description,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                if (therapist.timeSlots != null && therapist.timeSlots!.isNotEmpty) ...[
                  SizedBox(height: 20.0),
                  Text(
                    'Time Slots',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff281537),
                    ),
                  ),
                  Divider(color: Colors.grey),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: therapist.timeSlots!.map((slot) => Text(slot)).toList(),
                    ),
                  ),
                ],
                if (therapist.appointmenttypes != null && therapist.appointmenttypes!.isNotEmpty) ...[
                  SizedBox(height: 20.0),
                  Text(
                    'Appointment Types',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff281537),
                    ),
                  ),
                  Divider(color: Colors.grey),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: therapist.appointmenttypes!.map((type) => Text(type)).toList(),
                    ),
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildProfileItem(IconData icon, String title, String subtitle) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: Color(0xff281537)),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color(0xff281537),
        ),
      ),
      subtitle: Text(subtitle),
    );
  }
}
