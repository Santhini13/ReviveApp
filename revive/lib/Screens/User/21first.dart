import 'package:flutter/material.dart';
import 'package:revive/Screens/User/21-day.dart';
import 'package:revive/updateActivity.dart';

class ChallengeFirstScreen extends StatefulWidget {
  @override
  _ChallengeFirstScreenState createState() => _ChallengeFirstScreenState();
}

class _ChallengeFirstScreenState extends State<ChallengeFirstScreen> {
  String buttonText = 'Start'; // Initial button text

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 260,
            color: Color(0xff881736),
            child: Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Row(
                children: [
                  Text(
                            'Practice For Next \n21-Days Find A \nNew You',
                            style: TextStyle(fontSize: 20,color:Colors.white),
                          ),
                  Image.asset(
                    'assets/icons/goals.png',
                    width: 150,
                    height: 150,
                  ),
                   SizedBox(height: 100,),
        //    ElevatedButton(
        //   onPressed: uploadActivities, // Call the function to upload activities
        //   child: Text('Upload Activities'),
        // ),
                ],
              ),
            ),
          ),
          Center(child: _Start(context)),
        ],
      ),
    );
  }
}
 Widget _Start(BuildContext context) {
  return GestureDetector(
    onTap: () {
     Navigator.pushNamed(context, '/21day');
    },
    child: Container(
      decoration: BoxDecoration(
        color: Color(0xff881736),
        borderRadius: BorderRadius.circular(30),
      ),
      width: 200,
      height: 50,
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Start',
              style: TextStyle(fontSize:20,color: Colors.white),
            ),
            Icon(
          Icons.arrow_forward,
          color: Colors.white,
          size: 30,
        ),
          ],
        ),
         
      ),
  );
}