import 'package:flutter/material.dart';
import 'package:revive/Models/UserModal.dart';

class TherapistOnboardingScreen extends StatelessWidget {
   final Users user;
  const TherapistOnboardingScreen({Key? key,required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
         decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff881736), Color(0xff281537)],
            ),
          ),
          width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome!',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
            Text(
              '${user.username}',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white
              ),
            ),
            SizedBox(height: 30,),
            Image.asset('assets/images/logo.png',height:120),
            SizedBox(height: 20),
            SizedBox(height: 20),
            IconButton(
              icon:Icon(Icons.arrow_circle_right_outlined),
              iconSize: 40,
              color: Colors.white, 
              onPressed: () { 
                Navigator.pushNamed(context,'/thhome');
               },
            ),
          ],
        ),
      ),
    );
  }
}

