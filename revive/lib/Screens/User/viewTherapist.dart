import 'package:flutter/material.dart';
import 'package:revive/Screens/User/therapistpage.dart';

class Therapist {
  final String name;
  final String photo;
  final String qualification;
  final String specialization;
  final String experience;
  final String description;
  final List<String> timeSlots;
  final List<String> appointmentTypes;

  Therapist({
    required this.name,
    required this.photo,
    required this.qualification,
    required this.specialization,
    required this.experience,
    required this.description,
    required this.timeSlots,
    required this.appointmentTypes
  });
}

class TherapistListScreen extends StatefulWidget {
  @override
  State<TherapistListScreen> createState() => _TherapistListScreenState();
}

class _TherapistListScreenState extends State<TherapistListScreen> {
  late List<Therapist> filteredTherapists;
  final TextEditingController _searchController = TextEditingController();
  final List<Therapist> therapists = [
    Therapist(
      name: 'Dr. John Doe',
      photo: 'assets/images/doc2.jpg',
      qualification: 'Psychologist',
      specialization: 'Anxiety, Depression',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      experience: '4 years',
      timeSlots: ['10:00 AM', '11:00 AM', '02:00 PM'],
      appointmentTypes: ['Chat', 'Call', 'Video'],
    ),
    Therapist(
      name: 'Dr. Jane Smith',
      photo: 'assets/images/doc1.jpg',
      qualification: 'Counselor',
      specialization: 'Stress Management',
      description:'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      experience: '3 years',
      timeSlots: ['01:00 PM', '03:00 PM', '05:00 PM','08:00 PM'],
      appointmentTypes: ['Chat', 'Video'],
    ),
    // Add more therapist details as needed
  ];
void initState() {
    super.initState();
    filteredTherapists = therapists; // Initialize with all therapists
  }

  void _filterTherapists(String query) {
    setState(() {
      filteredTherapists = therapists.where((therapist) {
        final nameLower = therapist.name.toLowerCase();
        final queryLower = query.toLowerCase();
        return nameLower.contains(queryLower);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight), // Increase the height of the app bar
        child: AppBar(
          title:Text('Find Your Therapist',style:TextStyle(color:Colors.white),),
           actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: TherapistSearchDelegate(
                  therapists: therapists,
                  filterTherapists: _filterTherapists,
                ),
              );
            },
            icon: Icon(Icons.search,color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Filter by'),
                      content: Text('Add your filter options here'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Close'),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: Icon(Icons.filter_list_sharp,color:Colors.white),
            ),
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
      body: ListView.builder(
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
                    appointmentTypes: therapist.appointmentTypes,
                    timeSlots: therapist.timeSlots,
                  ),
                ),
              );
            },
            child: Card(
              margin: EdgeInsets.all(16.0),
             // color: Color(0xff881736),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Container(
                      child: Image.asset(
                        therapist.photo,
                        width: 150,
                        height: 130,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 10),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0, left: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            therapist.name,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff881736),
                            ),
                          ),
                          Text(
                            therapist.qualification,
                            style: TextStyle(fontSize: 14, color: Color(0xff881736)),
                          ),
                          Text(
                            therapist.specialization,
                            style: TextStyle(fontSize: 14, color: Color(0xff881736)),
                          ),
                          Text(
                            therapist.experience,
                            style: TextStyle(fontSize: 14, color: Color(0xff881736)),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
class TherapistSearchDelegate extends SearchDelegate {
  final List<Therapist> therapists;
  final Function(String) filterTherapists;

  TherapistSearchDelegate({
    required this.therapists,
    required this.filterTherapists,
  });

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
          filterTherapists(query);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Implement search results
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView.builder(
      itemCount: therapists.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(therapists[index].name),
          onTap: () {
            // Handle suggestion selection
            close(context, null);
          },
        );
      },
    );
  }
}