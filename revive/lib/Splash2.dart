import 'package:flutter/material.dart';
import 'package:revive/utils/appbutton.dart';

class Splash2 extends StatefulWidget {
  const Splash2({super.key});

  @override
  State<Splash2> createState() => _Splash2State();
}

class _Splash2State extends State<Splash2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color.fromARGB(255, 100, 143, 77),
      body:Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
            Color(0xff881736),
            Color(0xff281537)],
           
          )
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 230,),
            Center(child: Image.asset('assets/images/logo.png',height:120)),
            Text('Revive',style:TextStyle(fontSize: 40,color: Colors.white)),
            SizedBox(height: 300,),
            AppButton(onTap: (){
              Navigator.pushNamed(context, '/login');
            }, child: Text('Get Started',style: TextStyle(fontSize: 20,color: Colors.black),),color: Colors.white,height: 50,width:200,),
           SizedBox(height: 20,),
          ],),
        ),
      )
    );
  }
}
