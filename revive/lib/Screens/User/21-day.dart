import 'package:flutter/material.dart';

class ChallengeScreen extends StatefulWidget {
  @override
  _ChallengeScreenState createState() => _ChallengeScreenState();
}

class _ChallengeScreenState extends State<ChallengeScreen> {
  List<bool> _isDayCompleted = List.generate(21, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
                                    Text('Day ${index + 1}'),
                                    SizedBox(height: 10),
                                    Image.network(
                                      'https://via.placeholder.com/150',
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