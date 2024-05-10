import 'package:flutter/material.dart';
import 'package:revive/Screens/User/navbar.dart';
import 'package:revive/Screens/User/profileoption.dart';


class userProfile extends StatelessWidget {
  int _selectedIndex = 4;

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
            color: Color(0xff881736),
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
                    onPressed: () {  },
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
                    label:'Delete Account',
                    onPressed: () {
                      _showConfirmationDialog(context, 'Delete Account',
                          'Are you sure you want to delete your account?');
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: navBar(selectedIndex: _selectedIndex),
    );
  }
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

// void _showAppointmentDetails(BuildContext context, List<Map<String, String>> upcomingAppointments, List<Map<String, String>> pastAppointments) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text('My Appointments'),
//         contentPadding: EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 0.0),
//         content: Container(
//           width: double.maxFinite,
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 if (upcomingAppointments.isNotEmpty) ...[
//                   Text(
//                     'Upcoming Appointments:',
//                     style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
//                   ),
//                   SizedBox(height: 10),
//                   ListView.builder(
//                     shrinkWrap: true,
//                     physics: NeverScrollableScrollPhysics(),
//                     itemCount: upcomingAppointments.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       final appointment = upcomingAppointments[index];
//                       return Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text('Doctor: ${appointment['doctor']}', style: TextStyle(fontSize: 18)),
//                           Text('Date: ${appointment['date']}', style: TextStyle(fontSize: 18)),
//                           Text('Time: ${appointment['time']}', style: TextStyle(fontSize: 18)),
//                           SizedBox(height: 20),
//                         ],
//                       );
//                     },
//                   ),
//                 ],
//                 if (pastAppointments.isNotEmpty) ...[
//                   Text(
//                     'Past Appointments:',
//                     style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
//                   ),
//                   SizedBox(height: 10),
//                   ListView.builder(
//                     shrinkWrap: true,
//                     physics: NeverScrollableScrollPhysics(),
//                     itemCount: pastAppointments.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       final appointment = pastAppointments[index];
//                       return Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text('Doctor: ${appointment['doctor']}', style: TextStyle(fontSize: 18)),
//                           Text('Date: ${appointment['date']}', style: TextStyle(fontSize: 18)),
//                           Text('Time: ${appointment['time']}', style: TextStyle(fontSize: 18)),
//                           SizedBox(height: 20),
//                         ],
//                       );
//                     },
//                   ),
//                 ],
//               ],
//             ),
//           ),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             child: Text('OK'),
//           ),
//         ],
//       );
//     },
//   );
// }
//     return Scaffold(
//       appBar: AppBar(
//           title: Text(
//         'Profile',
//         style: TextStyle(
//           color: Color(0xff881736),
//         ),
//       )),
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
//               GridView.count(
//                 physics: NeverScrollableScrollPhysics(),
//                 crossAxisCount: 2,
//                 crossAxisSpacing: 35,
//                 mainAxisSpacing: 35,
//                 shrinkWrap: true,
//                 children: [
//                   ProfileOption(
//                     icon: Icons.edit,
//                     label: 'Edit Profile',
//                     onPressed: () {},
//                   ),
//                   ProfileOption(
//                     icon: Icons.mood,
//                     label: 'Mood Tracker',
//                     onPressed: () {},
//                   ),
//                   ProfileOption(
//                     icon: Icons.timeline,
//                     label: 'Progress',
//                     onPressed: () {},
//                   ),
//                   ProfileOption(
//                     icon: Icons.calendar_today,
//                     label: 'My Appointments',
//                     onPressed: () {
//                       List<Map<String, String>> upcomingAppointments = [
//                         {'doctor': 'Dr. Smith', 'date': '2024-09-20', 'time': '10:00 AM'},
//                         {'doctor': 'Dr. Johnson', 'date': '2024-09-25', 'time': '11:00 AM'},
//                         // {'doctor': 'Dr. Smith', 'date': '2024-09-20', 'time': '10:00 AM'},
//                         // {'doctor': 'Dr. Johnson', 'date': '2024-09-25', 'time': '11:00 AM'},
//                         //  {'doctor': 'Dr. Smith', 'date': '2024-09-20', 'time': '10:00 AM'},
//                         // {'doctor': 'Dr. Johnson', 'date': '2024-09-25', 'time': '11:00 AM'},
//                         // {'doctor': 'Dr. Smith', 'date': '2024-09-20', 'time': '10:00 AM'},
//                         // {'doctor': 'Dr. Johnson', 'date': '2024-09-25', 'time': '11:00 AM'},
//                       ];

//                       List<Map<String, String>> pastAppointments = [
//                         {'doctor': 'Dr. Brown', 'date': '2024-08-15', 'time': '2:00 PM'},
//                         // {'doctor': 'Dr. Brown', 'date': '2024-08-15', 'time': '2:00 PM'},
//                         // {'doctor': 'Dr. Brown', 'date': '2024-08-15', 'time': '2:00 PM'},
//                         // {'doctor': 'Dr. Brown', 'date': '2024-08-15', 'time': '2:00 PM'},
//                       ];

//                       _showAppointmentDetails(context, upcomingAppointments, pastAppointments);
//                     },
//                   ),
//                   ProfileOption(
//                     icon: Icons.privacy_tip,
//                     label: 'Privacy Policy',
//                     onPressed: () {
//                       Navigator.pushNamed(context, '/privacy');
//                     },
//                   ),
//                   ProfileOption(
//                     icon: Icons.article_outlined,
//                     label: 'Terms & Conditions',
//                     onPressed: () {
//                       Navigator.pushNamed(context, '/terms');
//                     },
//                   ),
//                   ProfileOption(
//                     icon: Icons.logout,
//                     label: 'Log Out',
//                     onPressed: () {
//                       _showConfirmationDialog(context, 'Log Out',
//                           'Are you sure you want to log out?');
//                     },
//                   ),
//                   ProfileOption(
//                     icon: Icons.delete,
//                     label: 'Delete Account',
//                     onPressed: () {
//                       _showConfirmationDialog(context, 'Delete Account',
//                           'Are you sure you want to delete your account?');
//                     },
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: navBar(selectedIndex: _selectedIndex),
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

// void _showAppointmentDetails(BuildContext context, List<Map<String, String>> upcomingAppointments, List<Map<String, String>> pastAppointments) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text('My Appointments'),
//         contentPadding: EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 0.0),
//         content: Container(
//           width: double.maxFinite,
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 if (upcomingAppointments.isNotEmpty) ...[
//                   Text(
//                     'Upcoming Appointments:',
//                     style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
//                   ),
//                   SizedBox(height: 10),
//                   ListView.builder(
//                     shrinkWrap: true,
//                     physics: NeverScrollableScrollPhysics(),
//                     itemCount: upcomingAppointments.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       final appointment = upcomingAppointments[index];
//                       return Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text('Doctor: ${appointment['doctor']}', style: TextStyle(fontSize: 18)),
//                           Text('Date: ${appointment['date']}', style: TextStyle(fontSize: 18)),
//                           Text('Time: ${appointment['time']}', style: TextStyle(fontSize: 18)),
//                           SizedBox(height: 20),
//                         ],
//                       );
//                     },
//                   ),
//                 ],
//                 if (pastAppointments.isNotEmpty) ...[
//                   Text(
//                     'Past Appointments:',
//                     style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
//                   ),
//                   SizedBox(height: 10),
//                   ListView.builder(
//                     shrinkWrap: true,
//                     physics: NeverScrollableScrollPhysics(),
//                     itemCount: pastAppointments.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       final appointment = pastAppointments[index];
//                       return Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text('Doctor: ${appointment['doctor']}', style: TextStyle(fontSize: 18)),
//                           Text('Date: ${appointment['date']}', style: TextStyle(fontSize: 18)),
//                           Text('Time: ${appointment['time']}', style: TextStyle(fontSize: 18)),
//                           SizedBox(height: 20),
//                         ],
//                       );
//                     },
//                   ),
//                 ],
//               ],
//             ),
//           ),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             child: Text('OK'),
//           ),
//         ],
//       );
//     },
//   );
// }



