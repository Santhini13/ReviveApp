import 'package:flutter/material.dart';
import 'package:revive/Screens/User/dietchat.dart';

class DietingScreen extends StatelessWidget {
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
                                  'assets/icons/care2.png',
                                  width: 150,
                                  height: 150,
                                  color: Colors.white,
                                ),
          ),),
          Padding(
            padding: const EdgeInsets.only(top:200.0),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(top:60.0,left:20,right: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSectionTile('Good Health for Mental Health', 'Maintaining good physical health through proper nutrition, exercise, and adequate '
                          'sleep can positively impact mental health. Eating a balanced diet rich in fruits, vegetables, whole '
                          'grains, lean proteins, and healthy fats can support overall well-being and improve mood.'),
                      _buildSectionTile('Nutrient-Rich Food', 'Consuming a variety of nutrient-rich foods provides essential vitamins, minerals, and antioxidants that support brain function. These include fruits, vegetables, whole grains, lean proteins, and healthy fats like those found in nuts, seeds, and fatty fish. '
                          ),
                      _buildSectionTile('Omega-3 Fatty Acids','Omega-3 fatty acids, particularly EPA and DHA, are essential for brain health and have been linked to reduced symptoms of depression and anxiety.' 
                    'Sources of omega-3s include salmon, mackerel, sardines, flaxseeds, chia seeds, and walnuts'),
                      _buildSectionTile('Calorie Deficit', 'A calorie deficit occurs when you consume fewer calories than your body burns, '
                          'resulting in weight loss. To achieve a calorie deficit, you can reduce your calorie intake through '
                          'dietary changes and increase calorie expenditure through physical activity.'),
                      _buildSectionTile('Mindful Eating', 'Practicing mindful eating involves paying attention to hunger and fullness cues, savoring the flavors and textures of food, and being aware of how different foods make you feel physically and emotionally.' 
                      'This can promote a healthier relationship with food and reduce emotional eating.'),
                      _buildSectionTile('Hydration' ,'Dehydration can impair cognitive function and mood. Drinking an adequate amount of water throughout the day is essential for maintaining mental clarity and concentration. Herbal teas and infused water are also hydrating options.'),
                      _buildSectionTile('Limit Processed Foods and Sugar', 'Highly processed foods, sugary snacks, and beverages can lead to fluctuations in blood sugar levels and may exacerbate mood swings and fatigue. Limiting intake of these items can help stabilize mood and energy levels.'),
                      _buildSectionTile('Intermittent Fasting', 'Intermittent fasting is an eating pattern that alternates between periods of '
                          'eating and fasting. It has been shown to have several health benefits, including weight loss, '
                          'improved metabolic health, and increased longevity. Common methods of intermittent fasting include '
                          'the 16/8 method, where you fast for 16 hours and eat during an 8-hour window, and the 5:2 method, '
                          'where you consume a reduced calorie intake for two non-consecutive days per week.'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
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