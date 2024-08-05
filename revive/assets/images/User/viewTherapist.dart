// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:revive/Screens/User/therapistpage.dart';
// import 'package:revive/Services/therapistService.dart';
// import 'package:revive/Models/therapistModal.dart';

// class TherapistListScreen extends StatefulWidget {
//   @override
//   State<TherapistListScreen> createState() => _TherapistListScreenState();
// }

// class _TherapistListScreenState extends State<TherapistListScreen> {
//   late List<Therapist> filteredTherapists;
//   final TextEditingController _searchController = TextEditingController();
//   final TherapistService _therapistService=TherapistService();

//   late List<Therapist> therapists ;

// Future<List<Therapist>> _fetchTherapists() async {
//     try {
//       final QuerySnapshot<Map<String, dynamic>> therapistList = await _therapistService.fetchallTherapistinfo();
//       List<Therapist> therapists = therapistList.docs.map((doc) {
//         return Therapist.fromFirestore(doc);
//       }).toList();
//       setState(() {

//         therapists=therapists;
//        // filteredTherapists=therapists;
//       });

//       return therapists;
//     } catch (e) {
//       print('Error fetching therapists: $e');
//       throw e;
//     }
//   }
// void initState() {
//     super.initState();
//    _fetchTherapists();
//    // Initialize with all therapists
//   }

//   // void _filterTherapists(String query) {
//   //   setState(() {
//   //     filteredTherapists = therapists.where((therapist) {
//   //       final nameLower = therapist.name.toLowerCase();
//   //       final queryLower = query.toLowerCase();
//   //       return nameLower.contains(queryLower);
//   //     }) as Future<List<Therapist>>.toList();
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(kToolbarHeight), // Increase the height of the app bar
//         child: AppBar(
//           title:Text('Find Your Therapist',style:TextStyle(color:Colors.white),),
//            actions: [
//           // IconButton(
//           //   onPressed: () {
//           //     showSearch(
//           //       context: context,
//           //       delegate: TherapistSearchDelegate(
//           //         therapists: therapists,
//           //         filterTherapists: _filterTherapists,
//           //       ),
//           //     );
//           //   },
//           //   icon: Icon(Icons.search,color: Colors.white),
//           // ),
//           Padding(
//             padding: const EdgeInsets.only(right: 10.0),
//             child: IconButton(
//               onPressed: () {
//                 showDialog(
//                   context: context,
//                   builder: (BuildContext context) {
//                     return AlertDialog(
//                       title: Text('Filter by'),
//                       content: Text('Add your filter options here'),
//                       actions: [
//                         TextButton(
//                           onPressed: () {
//                             Navigator.of(context).pop();
//                           },
//                           child: Text('Close'),
//                         ),
//                       ],
//                     );
//                   },
//                 );
//               },
//               icon: Icon(Icons.filter_list_sharp,color:Colors.white),
//             ),
//           ),

//         ],
//           backgroundColor: Colors.transparent, // Transparent background
//           automaticallyImplyLeading: false, // Removes the back button
//           flexibleSpace: Container(
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [Color(0xff881736), Color(0xff281537)],
//               ),
//             ),))),
//       body: ListView.builder(
//         itemCount: therapists.length,
//         itemBuilder: (BuildContext context, int index) {
//           final therapist = therapists[index];
//           return GestureDetector(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => TherapistDetailScreen(
//                     therapist: therapist,
//                     appointmentTypes: therapist.appointmenttypes,
//                     timeSlots: therapist.timeSlots,
//                   ),
//                 ),
//               );
//             },
//             child: Container(
//               margin: EdgeInsets.all(16.0),
//               decoration: BoxDecoration(
//                 border: Border.all(),
//                 borderRadius: BorderRadius.circular(20)
//               ),
//              // color: Color(0xff881736),
//               child: Padding(
//                 padding: EdgeInsets.all(10.0),
//                 child: Row(
//                   children: [
//                     // Container(
//                     //   child: Image.asset(
//                     //     therapist.photo,
//                     //     width: 150,
//                     //     height: 130,
//                     //     fit: BoxFit.cover,
//                     //   ),
//                     // ),
//                     SizedBox(width: 10),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 30),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             therapist.name,
//                             style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                               color: Color(0xff881736),
//                             ),
//                           ),
//                           Text(
//                             therapist.qualification,
//                             style: TextStyle(fontSize: 14, color: Color(0xff881736)),
//                           ),
//                           // Text(
//                           //   therapist.specialization,
//                           //   style: TextStyle(fontSize: 14, color: Color(0xff881736)),
//                           // ),
//                           Text(
//                             therapist.experience,
//                             style: TextStyle(fontSize: 14, color: Color(0xff881736)),
//                           ),
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
// class TherapistSearchDelegate extends SearchDelegate {
//   final List<Therapist> therapists;
//   final Function(String) filterTherapists;

//   TherapistSearchDelegate({
//     required this.therapists,
//     required this.filterTherapists,
//   });

//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [
//       IconButton(
//         icon: Icon(Icons.clear),
//         onPressed: () {
//           query = '';
//           filterTherapists(query);
//         },
//       ),
//     ];
//   }

//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//       icon: Icon(Icons.arrow_back),
//       onPressed: () => close(context, null),
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     // Implement search results
//     return Container();
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     return ListView.builder(
//       itemCount: therapists.length,
//       itemBuilder: (context, index) {
//         return ListTile(
//           title: Text(therapists[index].name),
//           onTap: () {
//             // Handle suggestion selection
//             close(context, null);
//           },
//         );
//       },
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:revive/Screens/User/therapistpage.dart';
import 'package:revive/Services/therapistService.dart';
import 'package:revive/Models/therapistModal.dart';

class TherapistListScreen extends StatefulWidget {
  @override
  State<TherapistListScreen> createState() => _TherapistListScreenState();
}

class _TherapistListScreenState extends State<TherapistListScreen> {
  late Future<List<Therapist>> futureTherapists;
  final TherapistService _therapistService = TherapistService();

  @override
  void initState() {
    super.initState();
    futureTherapists = _fetchTherapists(); // Initialize with all therapists
  }

  Future<List<Therapist>> _fetchTherapists() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> therapistList =
          await _therapistService.fetchallTherapistinfo();
      List<Therapist> therapists = therapistList.docs.map((doc) {
        return Therapist.fromFirestore(doc);
      }).toList();
      return therapists;
    } catch (e) {
      print('Error fetching therapists: $e');
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
            kToolbarHeight), // Increase the height of the app bar
        child: AppBar(
          title: Text('Find Your Therapist',
              style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.transparent, // Transparent background
          automaticallyImplyLeading: false, // Removes the back button
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff881736), Color(0xff281537)],
              ),
            ),
          ),
        ),
      ),
      body: FutureBuilder<List<Therapist>>(
        future: futureTherapists,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No therapists found'));
          } else {
            List<Therapist> therapists = snapshot.data!;
            return ListView.builder(
              itemCount: therapists.length,
              itemBuilder: (BuildContext context, int index) {
                final therapist = therapists[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TherapistDetailScreen(
                          therapist: therapist,
                          appointmentTypes: therapist.appointmenttypes,
                          timeSlots: therapist.timeSlots,
                        ),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 5,
                    margin:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 50,
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
                          SizedBox(width: 16.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  therapist.name,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff881736),
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  therapist.qualification,
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey[600]),
                                ),
                                SizedBox(height: 4.0),
                                Text(
                                  therapist.specialization,
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey[600]),
                                ),
                                SizedBox(height: 4.0),
                                Text(
                                  therapist.experience,
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey[600]),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
