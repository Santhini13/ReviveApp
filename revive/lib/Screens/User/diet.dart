import 'package:flutter/material.dart';
import 'package:revive/Screens/User/dietchat.dart';

class DietingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dieting Information',style: TextStyle(color: Color(0xff881736)),),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTile('Protein', 'Protein is an essential nutrient that helps build and repair tissues in the body. '
                'It is important for muscle growth, metabolism, and overall health. Good sources of protein include '
                'lean meats, poultry, fish, eggs, dairy products, nuts, and legumes.'),
            _buildSectionTile('Calorie Deficit', 'A calorie deficit occurs when you consume fewer calories than your body burns, '
                'resulting in weight loss. To achieve a calorie deficit, you can reduce your calorie intake through '
                'dietary changes and increase calorie expenditure through physical activity.'),
            _buildSectionTile('Good Health for Mental Health', 'Maintaining good physical health through proper nutrition, exercise, and adequate '
                'sleep can positively impact mental health. Eating a balanced diet rich in fruits, vegetables, whole '
                'grains, lean proteins, and healthy fats can support overall well-being and improve mood.'),
            _buildSectionTile('Intermittent Fasting', 'Intermittent fasting is an eating pattern that alternates between periods of '
                'eating and fasting. It has been shown to have several health benefits, including weight loss, '
                'improved metabolic health, and increased longevity. Common methods of intermittent fasting include '
                'the 16/8 method, where you fast for 16 hours and eat during an 8-hour window, and the 5:2 method, '
                'where you consume a reduced calorie intake for two non-consecutive days per week.'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChatScreen()),
          );
          
          // Open chatbot screen
        },
        child: Icon(Icons.chat,color:Color(0xff881736)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _buildSectionTile(String title, String content) {
    return ExpansionTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20, bottom: 16.0),
          child: Text(
            content,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}