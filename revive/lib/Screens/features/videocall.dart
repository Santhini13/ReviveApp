







// import 'package:flutter/material.dart';

// class VideoCallScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             color: Colors.black,
//             child: Center(
//               child: Text(
//                 'Remote Video',
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           ),
//           Positioned(
//             bottom: 0,
//             left: 0,
//             right: 0,
//             child: Container(
//               color: Colors.black,
//               height: 200,
//               child: Center(
//                 child: Text(
//                   'Local Video',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             top: 40,
//             left: 20,
//             child: CircleAvatar(
//               radius: 25,
//               backgroundImage: AssetImage('assets/user_avatar.png'),
//             ),
//           ),
//           Positioned(
//             top: 40,
//             right: 20,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 Text(
//                   '00:00:00',
//                   style: TextStyle(color: Colors.white),
//                 ),
//                 SizedBox(height: 5),
//                 Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     IconButton(
//                       onPressed: () {
//                         // Toggle mute logic
//                       },
//                       icon: Icon(Icons.mic_off, color: Colors.white),
//                     ),
//                     IconButton(
//                       onPressed: () {
//                         // Toggle video logic
//                       },
//                       icon: Icon(Icons.videocam_off, color: Colors.white),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           Positioned(
//             top: 100,
//             left: 20,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'John Doe',
//                   style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 5),
//                 Text(
//                   'Calling...',
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ],
//             ),
//           ),
//           Positioned(
//             bottom: 20,
//             left: 20,
//             child: FloatingActionButton(
//               onPressed: () {
//                 // End call logic
//               },
//               backgroundColor: Colors.red,
//               child: Icon(Icons.call_end),
//             ),
//           ),
//           Positioned(
//             bottom: 20,
//             right: 20,
//             child: FloatingActionButton(
//               onPressed: () {
//                 // Switch camera logic
//               },
//               backgroundColor: Colors.white,
//               child: Icon(Icons.switch_camera),
//             ),
//           ),
//           Positioned(
//             bottom: 100,
//             right: 20,
//             child: FloatingActionButton(
//               onPressed: () {
//                 // Speaker toggle logic
//               },
//               backgroundColor: Colors.white,
//               child: Icon(Icons.volume_up),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }



