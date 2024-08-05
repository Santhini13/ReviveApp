import 'package:flutter/material.dart';

class VoiceCallScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue, // Set the background color
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                 decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff881736), Color(0xff281537)],
              ),
            ),
              ),
            ),
            Positioned(
              top: 40,
              left: 20,
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.15,
              left: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, size: 80, color:Color(0xff281537)), // Add a placeholder icon
                  ),
                  SizedBox(height: 20),
                  Text(
                    'John Doe',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Calling...',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 60,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      // Mute audio logic
                    },
                    child: Icon(Icons.mic_off),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.blue,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      // End call logic
                    },
                    child: Icon(Icons.call_end),
                    backgroundColor: Colors.red,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      // Speaker on/off logic
                    },
                    child: Icon(Icons.volume_up),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.blue,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 120,
              left: 20,
              right: 20,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.timer, color: Colors.white),
                    SizedBox(width: 10),
                    Text(
                      '00:00:00',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.switch_camera, color: Colors.white),
                    onPressed: () {
                      // Switch camera logic
                    },
                  ),
                  SizedBox(width: 20),
                  IconButton(
                    icon: Icon(Icons.message, color: Colors.white),
                    onPressed: () {
                      // Open chat screen logic
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
