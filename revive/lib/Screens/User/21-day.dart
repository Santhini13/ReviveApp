import 'package:flutter/material.dart';

class ChallengeScreen extends StatefulWidget {
  @override
  _ChallengeScreenState createState() => _ChallengeScreenState();
}

class _ChallengeScreenState extends State<ChallengeScreen> {
  List<Map<String, dynamic>> _activities = [
  {'name': 'Go to bed one hour earlier than usual', 'image': 'assets/images/21-days/Day1.png'},
  {'name': 'Journal ten things you’re grateful for', 'image': 'assets/images/21-days/Day2.png'},
  {'name': 'Take a walk outdoors', 'image': 'assets/images/21-days/Day3.png'},
  {'name': 'Call someone you love', 'image': 'assets/images/21-days/Day4.png'},
  {'name': 'De-clutter your room or desk', 'image': 'asassets/images/21-days/Day5.png'},
   {'name': 'Take a break from social media', 'image': 'assets/images/21-days/Day6.png'},
  {'name': 'Make a list of short-term goals', 'image':'assets/images/21-days/Day7.png'},
  {'name': 'Make the most epic, creative salad or healthy dish you can think of', 'image': 'assets/images/21-days/Day8.png'},
  {'name': 'Slow down. Sit and watch the sunset or sunrise', 'image': 'assets/images/21-days/Day9.png'},
  {'name': 'Get rid of five things you never use', 'image': 'assets/images/21-days/Day10.png'},
  {'name': 'Enjoy the sun and eat lunch outside', 'image': 'assets/images/21-days/Day11.png'},
  {'name': 'Unsubscribe from unnecessary emails', 'image': 'assets/images/21-days/Day12.png'},
  {'name': 'Send an encouraging text to five people', 'image': 'assets/images/21-days/Day13.png'},
  {'name': 'Wake up thirty minutes earlier to pray or meditate', 'image': 'assets/images/21-days/Day14.png'},
  {'name': 'Plan a tea or smoothie date with a friend', 'image': 'assets/images/21-days/Day15.png'},
  {'name': 'Go the entire day without complaining', 'image': 'assets/images/21-days/Day16.png'},
  {'name': 'Buy yourself flowers', 'image': 'assets/images/21-days/Day17.png'},
  {'name': 'Make time for a wholesome breakfast', 'image': 'assets/images/21-days/Day18.png'},
  {'name': 'Do one thing you’ve been putting off', 'image': 'assets/images/21-days/Day19.png'},
  {'name': 'Don’t overthink. Practice being present', 'image': 'assets/images/21-days/Day20.png'},
  {'name': 'Say ‘no’ to that extra commitment', 'image': 'assets/images/21-days/Day21.png'},
];

  List<bool> _isDayCompleted = List.generate(21, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight), // Increase the height of the app bar
        child: AppBar(
          title:Text('21-Day Challenge',style:TextStyle(color:Colors.white),),
          backgroundColor: Colors.transparent, // Transparent background
          automaticallyImplyLeading: false, // Removes the back button
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff881736), Color(0xff281537)],
              ),
            ),))),

      body: Stack(
        children: [
          Container(width: double.infinity,
          height: 200,
           decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff881736), Color(0xff281537)],
              ),
            ),
          child:  Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                            'Do It for 21-Days\n Find A New You',
                            style: TextStyle(fontSize: 20,color:Colors.white),
                          ),
                          Image.asset(
                        'assets/icons/goals.png',
                        width: 150,
                        height: 150,
                      ),
              ],
            ),
          ),),
          Container(
             decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10))),
                  height: double.infinity,
                  width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0,right: 10,bottom: 20),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: 21,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      if (!_isDayCompleted[index]) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: Container(
                                height: 200,
                                width: 200,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(_activities[index]['name']), // Display activity name
                                    SizedBox(height: 10),
                                    Image.asset(
                                      _activities[index]['image'], // Display associated image
                                      height: 100,
                                      width: 100,
                                    ),
                                    SizedBox(height: 10),
                                    ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          _isDayCompleted[index] = true;
                                        });
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Done'),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: _isDayCompleted[index] ? Color(0xff881736).withOpacity(0.2) : Color(0xff281537).withOpacity(0.2),
                        border: Border.all(
                          color: _isDayCompleted[index] ? Color(0xff881736) : Color(0xff281537),
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: Text('Day ${index + 1}'),
                      ),
                    ),
                  );
                  
                },
                
              ),
            ),
            
          ),
          
        ],
        
      ),
    );
  }
}