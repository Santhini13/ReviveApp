import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:revive/Screens/User/navbar.dart';
import 'package:revive/Screens/User/therapistpage.dart';

class TherapistListScreen extends StatefulWidget {
  @override
  State<TherapistListScreen> createState() => _TherapistListScreenState();
}

class _TherapistListScreenState extends State<TherapistListScreen> {
  int _selectedIndex=1;

  final List<Map<String, String>> therapists = [
    {
      'photo': 'assets/images/doc2.jpg',
      'name': 'Dr. John Doe',
      'qualification': 'Psychologist',
      'specification': 'Anxiety, Depression',
      'description': 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    },
    {
      'photo': 'assets/images/doc1.jpg',
      'name': 'Dr. Jane Smith',
      'qualification': 'Counselor',
      'specification': 'Stress Management',
      'description':
          'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    },
     {
      'photo': 'assets/images/doc1.jpg',
      'name': 'Dr. Ann Smith',
      'qualification': 'Counselor',
      'specification': 'Stress Management',
      'description':
          'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    },
    // Add more therapist details as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Find Your Therapist'),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                  context: context,
                  delegate: TherapistSearchDelegate(therapists: therapists));
            },
            icon: Icon(Icons.search),
          ),
          PopupMenuButton(
            onSelected: (value) {
              // Handle filter
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry>[
                PopupMenuItem(
                  value: 'option1',
                  child: Text('Filter Option 1'),
                ),
                PopupMenuItem(
                  value: 'option2',
                  child: Text('Filter Option 2'),
                ),
                // Add more filter options as needed
              ];
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: therapists.length,
        itemBuilder: (BuildContext context, int index) {
          final therapist = therapists[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      TherapistDetailScreen(therapist: therapist),
                ),
              );
            },
            child: Card(
              margin: EdgeInsets.all(16.0),
              //shadowColor: Color(0xff281537).withOpacity(0.2),
              color: Color(0xff881736),
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Container(
                      child: Image.asset(
                        therapist['photo']!,
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
                            therapist['name']!,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            therapist['qualification']!,
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                          Text(
                            therapist['specification']!,
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              // Handle booking
                            },
                            child: Text('Book Now'),
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
      bottomNavigationBar: navBar(selectedIndex: _selectedIndex),
    );
  }
}

class TherapistSearchDelegate extends SearchDelegate {
  final List<Map<String, dynamic>> therapists;

  TherapistSearchDelegate({required this.therapists});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(icon: Icon(Icons.clear), onPressed: () => query = '')];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back), onPressed: () => close(context, null));
  }

  @override
  Widget buildResults(BuildContext context) {
    // Implement search results
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? therapists
        : therapists
            .where((therapist) =>
                therapist['name'].toLowerCase().contains(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestionList[index]['name']),
          onTap: () {
            // Handle suggestion selection
          },
        );
      },
    );
  }
}
