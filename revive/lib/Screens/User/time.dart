// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class CurrentDateTimeWidget extends StatefulWidget {
//   @override
//   _CurrentDateTimeWidgetState createState() => _CurrentDateTimeWidgetState();
// }

// class _CurrentDateTimeWidgetState extends State<CurrentDateTimeWidget> {
//   String _currentDateTime = '';

//   @override
//   void initState() {
//     super.initState();
//     _updateDateTime();
//   }

//   void _updateDateTime() {
//     setState(() {
//       _currentDateTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text(
//           'Current Date and Time:',
//           style: TextStyle(fontSize: 20),
//         ),
//         SizedBox(height: 10),
//         Text(
//           _currentDateTime,
//           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//         ),
//       ],
//     );
//   }
// }
