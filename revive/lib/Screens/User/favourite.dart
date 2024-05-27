import 'package:flutter/material.dart';
import 'package:revive/Screens/constants/myAppbar.dart';

class MyFavoritesScreen extends StatelessWidget {
  final List<Therapist> favoriteTherapists = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: MyAppBar(title:'My Favourites'),
      body: favoriteTherapists.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite_border,
                    size: 100,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Nothing to show',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: favoriteTherapists.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    title: Text(
                      favoriteTherapists[index].name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(favoriteTherapists[index].specialty),
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Text(
                        favoriteTherapists[index].name[0],
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      // Handle tapping on a therapist
                    },
                  ),
                );
              },
            ),
    );
  }
}

class Therapist {
  final String name;
  final String specialty;

  Therapist({
    required this.name,
    required this.specialty,
  });
}
