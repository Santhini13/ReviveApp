import 'package:flutter/material.dart';
import 'package:revive/Screens/User/exercise2.dart';

class ExerciseListScreen extends StatelessWidget {
  final List<Map<String, dynamic>> exercises = [
    {'name': 'Walking', 'image': 'assets/icons/walking.png'},
    {'name': 'Cycling', 'image': 'assets/icons/cycling.png'},
    {'name': 'Running', 'image': 'assets/icons/runing.png'},
    {'name': 'Meditation', 'image': 'assets/icons/meditation.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(width: double.infinity,
          height: 260,
          color: Color(0xff881736),
          child:  Padding(
            padding: const EdgeInsets.all(50.0),
            child: Image.asset(
                                  'assets/icons/care1.png',
                                  width: 150,
                                  height: 150,
                                  color: Colors.white,
                                ),
          ),),
          Padding(
            padding: const EdgeInsets.only(top:260.0,left: 20,right: 20),
            child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            itemCount: exercises.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ExerciseDetailScreen(
                        exerciseName: exercises[index]['name'],
                        exerciseImage: exercises[index]['image'],
                      ),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 1.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        exercises[index]['image'],
                        height: 100,
                        width: 100,
                      ),
                      SizedBox(height: 10),
                      Text(
                        exercises[index]['name'],
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              );
            },
                    ),
          ),]
      ),
    );
  }
}
