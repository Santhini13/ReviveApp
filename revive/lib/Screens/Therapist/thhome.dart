import 'package:flutter/material.dart';
import 'package:revive/Screens/Therapist/thnavbar.dart';
import 'package:revive/Screens/User/ads.dart';
import 'package:revive/utils/appbutton.dart';
import 'package:revive/utils/customcontainer.dart';


class TherapistHome extends StatefulWidget {
  const TherapistHome({super.key});

  @override
  State<TherapistHome> createState() => _TherapistHomeState();
}

class _TherapistHomeState extends State<TherapistHome> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Hello UserName',style: TextStyle(fontSize: 24, color:Color(0xff881736)),),

      ),
      drawer: Drawer(),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Stack(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MentalHealthAdsCarousel(),
          ),
          Padding(
            padding: const EdgeInsets.only(top:210.0,left: 10,right: 10),
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                height: double.infinity,
                width: double.infinity,
                child: Padding(
                  padding:
                      const EdgeInsets.only( left: 10, right: 10),
                  child: SingleChildScrollView(
                    child: Column(children: [
                     SizedBox(height:20),
                      Text(
                    'Categories',
                    style: TextStyle(
                      color:  Color(0xff881736),
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.0),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            CustomContainer(
                              ontap: () {
                                Navigator.pushNamed(context, '/myjournal');
                              },
                              height: 150,
                              width: 120,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color:  Color(0xff881736).withOpacity(0.5)
                                ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    Image.asset('assets/icons/diary.png'),
                                    SizedBox(height: 5,),
                                    Text('Journaling',)
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                           CustomContainer(
                              ontap: () {
                                Navigator.pushNamed(context, '/mycare');
                              },
                              height: 150,
                              width: 120,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color(0xff281537).withOpacity(0.5)
                                ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    Image.asset('assets/icons/girl.png'),
                                    SizedBox(height: 5,),
                                    Text('Self-Care',)
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            CustomContainer(
                              ontap: () {
                                Navigator.pushNamed(context, '/challenge');
                              },
                              height: 150,
                              width: 120,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color:  Color(0xff881736).withOpacity(0.5)
                                ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    Image.asset('assets/icons/goals.png'),
                                    SizedBox(height: 5,),
                                    Text('Challenges',)
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                           CustomContainer(
                              ontap: () {
                                Navigator.pushNamed(context, '/aware');
                              },
                              height: 150,
                              width: 120,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color(0xff281537).withOpacity(0.5)
                                ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    Image.asset('assets/icons/profile/aware.png'),
                                    SizedBox(height: 5,),
                                    Text('Awareness',)
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                    'For You',
                    style: TextStyle(
                      color:  Color(0xff881736),
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.0),
                      CustomContainer(
                        ontap: () {},
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: LinearGradient(colors: [
                              Color(0xff281537),
                              Color(0xff881736),
                            ])),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset('assets/images/checklist.png'),
                            Padding(
                              padding: const EdgeInsets.only(
                                 top: 30,right: 10),
                              child: Column(
                                children: [
                                  Text(
                                    'Self Assessment Test',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Assessment will guide\nyou to take-on\nyour mental wellness.',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 9),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: 25),
                                  AppButton(
                                    onTap: () {
                                      Navigator.pushNamed(context, '/mytest');
                                    },
                                    child: Text(
                                      'Take Test',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    color: Color(0xff281537),
                                    width: 100,
                                    height: 40,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
            
                      SizedBox(
                        height: 25,
                      ),
                      
                    ]),
                  ),
                )),
          )
        ]),
      ),
      bottomNavigationBar: thnavBar(selectedIndex: _selectedIndex),
    );
  }
}

