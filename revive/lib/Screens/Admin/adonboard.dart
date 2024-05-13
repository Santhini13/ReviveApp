import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class AdminOnboard extends StatelessWidget {
  const AdminOnboard({Key? key}) : super(key: key);

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
                'Welcome Admin',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),
              SizedBox(height: 20),
              Icon(
                Icons.admin_panel_settings,
                size: 100,
                color:Colors.white // Customize icon color as needed
              ),
              SizedBox(height: 40),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/adhome');
                  // Handle button tap
                },
                icon: Icon(Icons.arrow_forward),
                label: Text('Continue'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
