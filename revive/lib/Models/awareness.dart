import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AwarenessScreen extends StatefulWidget {
  @override
  _AwarenessScreenState createState() => _AwarenessScreenState();
}

class _AwarenessScreenState extends State<AwarenessScreen> {
  String _selectedInfo = '';
  String _selectedTitle = '';

  void _showInformation(String title, String info) {
    setState(() {
      _selectedTitle = title;
      _selectedInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Awareness'),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
            height: double.infinity,
            width: double.infinity,
            child: _selectedInfo.isNotEmpty
                ? SingleChildScrollView(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          _selectedTitle,
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 12.0),
                        Text(
                          _selectedInfo,
                          style: TextStyle(fontSize: 16.0),
                        ),
                        SizedBox(height: 20.0),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _selectedTitle = '';
                              _selectedInfo = '';
                            });
                          },
                          child: Text('Back'),
                        ),
                      ],
                    ),
                  )
                : SingleChildScrollView(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () => _showInformation(
                              'Stress', 'Stress information goes here.'),
                          child: Container(
                            padding: EdgeInsets.all(12.0),
                            color: Colors.blue,
                            child: Center(
                              child: Text(
                                'Stress',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 12.0),
                        GestureDetector(
                          onTap: () => _showInformation(
                              'Anxiety', 'Anxiety information goes here.'),
                          child: Container(
                            padding: EdgeInsets.all(12.0),
                            color: Colors.green,
                            child: Center(
                              child: Text(
                                'Anxiety',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 12.0),
                        GestureDetector(
                          onTap: () => _showInformation('Depression',
                              'Depression information goes here.'),
                          child: Container(
                            padding: EdgeInsets.all(12.0),
                            color: Colors.orange,
                            child: Center(
                              child: Text(
                                'Depression',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
// class InformationScreen extends StatefulWidget {
//   @override
//   _InformationScreenState createState() => _InformationScreenState();
// }

// class _InformationScreenState extends State<InformationScreen> {
//   String _selectedInfo = '';

//   void _showInformation(String info) {
//     setState(() {
//       _selectedInfo = info;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Information Display'),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             GestureDetector(
//               onTap: () => _showInformation('Stress information'),
//               child: Container(
//                 padding: EdgeInsets.all(12.0),
//                 color: Colors.blue,
//                 child: Center(
//                   child: Text(
//                     'Stress',
//                     style: TextStyle(
//                       fontSize: 20.0,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 12.0),
//             GestureDetector(
//               onTap: () => _showInformation('Anxiety information'),
//               child: Container(
//                 padding: EdgeInsets.all(12.0),
//                 color: Colors.green,
//                 child: Center(
//                   child: Text(
//                     'Anxiety',
//                     style: TextStyle(
//                       fontSize: 20.0,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 12.0),
//             GestureDetector(
//               onTap: () => _showInformation('Depression information'),
//               child: Container(
//                 padding: EdgeInsets.all(12.0),
//                 color: Colors.orange,
//                 child: Center(
//                   child: Text(
//                     'Depression',
//                     style: TextStyle(
//                       fontSize: 20.0,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20.0),
//             _selectedInfo.isNotEmpty
//                 ? Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Text(
//                         'Information:',
//                         style: TextStyle(
//                           fontSize: 24.0,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(height: 12.0),
//                       Text(
//                         _selectedInfo,
//                         style: TextStyle(fontSize: 16.0),
//                       ),
//                     ],
//                   )
//                 : Container(),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class AnxietyInfoScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Anxiety Information'),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               'What is Anxiety?',
//               style: TextStyle(
//                 fontSize: 24.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 12.0),
//             Text(
//               'Anxiety is a normal and often healthy emotion. However, when a person regularly feels disproportionate levels of anxiety, it might become a medical disorder.',
//               style: TextStyle(fontSize: 16.0),
//             ),
//             SizedBox(height: 20.0),
//             Text(
//               'Causes of Anxiety:',
//               style: TextStyle(
//                 fontSize: 24.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 12.0),
//             Text(
//               'Anxiety disorders are caused by a combination of factors, including genetics, brain chemistry, personality, and life events.',
//               style: TextStyle(fontSize: 16.0),
//             ),
//             SizedBox(height: 20.0),
//             Text(
//               'How to Counter Anxiety:',
//               style: TextStyle(
//                 fontSize: 24.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 12.0),
//             Text(
//               '1. Practice relaxation techniques like deep breathing, meditation, or yoga.\n'
//               '2. Exercise regularly.\n'
//               '3. Get enough sleep.\n'
//               '4. Limit caffeine and alcohol intake.\n'
//               '5. Seek professional help if needed.',
//               style: TextStyle(fontSize: 16.0),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
