import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:revive/Models/UserModal.dart';

class AdminOnboard extends StatelessWidget {
   final Users user;
  const AdminOnboard({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff881736), Color(0xff281537)],
              ),
            ),
            width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome ${user.username}',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),
              SizedBox(height: 20),
              Image.asset('assets/images/logo.png',height:120),
              // Icon(
              //   Icons.admin_panel_settings,
              //   size: 100,
              //   color:Colors.white // Customize icon color as needed
              // ),
              SizedBox(height: 40),
              IconButton(
              icon:Icon(Icons.arrow_circle_right_outlined),
              iconSize: 40,
              color: Colors.white, 
              onPressed: () { 
                Navigator.pushNamed(context,'/adhome');
               },
            ),
            ],
          ),
        ),
      ),
    );
  }
}
