import 'package:flutter/material.dart';
import 'package:revive/utils/customcontainer.dart';

class myCare extends StatefulWidget {
  const myCare({super.key});

  @override
  State<myCare> createState() => _myCareState();
}

class _myCareState extends State<myCare> {
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
                            'Healthy Mind Need \nA Healthy Body',
                            style: TextStyle(fontSize: 20,color:Colors.white),
                          ),
                          Image.asset(
                        'assets/icons/girl.png',
                        width: 150,
                        height: 150,
                      ),
              ],
            ),
          ),),
          Padding(
            padding: const EdgeInsets.only(top:200.0),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(60.0),
                  child: Column(children: [
                    CustomContainer(
                      ontap: () {
                        Navigator.pushNamed(context, '/exercise');
                      },
                      height: 220,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              width: 1, color: Color(0xff281537))),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Image.asset('assets/icons/care1.png',color:Color(0xff881736),height: 100),
                            SizedBox(height: 20,),
                            Image.asset('assets/icons/arrow.png',color:Color(0xff881736),height:50 )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CustomContainer(
                      ontap: (
                      ) {
                        Navigator.pushNamed(context, '/diet');
                      
                      },
                      height: 220,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              width: 1, color: Color(0xff281537),)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Image.asset('assets/icons/care2.png',color:Color(0xff881736),height: 100),
                             SizedBox(height: 20,),
                            Image.asset('assets/icons/arrow.png',color:Color(0xff881736),height:50),
                          ],
                        ),
                      ),
                    ),
                  ]),
                )
                ),
          )
        ],
      ),
    );
  }
}
