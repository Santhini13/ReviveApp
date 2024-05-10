import 'package:flutter/material.dart';

class Splash1 extends StatefulWidget {
  const Splash1({super.key});

  @override
  State<Splash1> createState() => _Splash1State();
}

class _Splash1State extends State<Splash1> {
  @override
  void initState() {
   
    Future.delayed(Duration(seconds:5), () {
    
    });

    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 100, 143, 77),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 230,),
        Center(child: Image.asset('assets/images/logo.png',height:120)),
        Text('Revive',style:TextStyle(fontSize: 40,color: Colors.white)),
        SizedBox(height: 200,),])
    );
  }
}