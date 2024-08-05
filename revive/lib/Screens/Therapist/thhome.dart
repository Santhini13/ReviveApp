import 'package:flutter/material.dart';
import 'package:revive/Models/therapistModal.dart';
import 'package:revive/Screens/Therapist/thdash.dart';
import 'package:revive/Screens/Therapist/thprofile.dart';
import 'package:revive/Screens/User/ads.dart';
import 'package:revive/utils/appbutton.dart';
import 'package:revive/utils/customcontainer.dart';
import 'package:revive/Screens/general/awareness.dart';

class TherapistHome extends StatefulWidget {
  const TherapistHome({Key? key}) : super(key: key);

  @override
  State<TherapistHome> createState() => _TherapistHomeState();
}

class _TherapistHomeState extends State<TherapistHome>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;
  late final Therapist therapist;
    

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight), // Increase the height of the app bar
        child: AppBar(
          backgroundColor: Colors.transparent, // Transparent background
          automaticallyImplyLeading: false, // Removes the back button
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff881736), Color(0xff281537)],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TabBar(
                  controller: _tabController,
                  indicatorColor: Colors.white, // Color of the selection indicator
                  labelColor: Colors.white, // Color of the text when selected
                  unselectedLabelColor: Colors.grey, // Color of the text when not selected
                  tabs: [
                    Tab(text: 'Home'),
                    Tab(text: 'Dashboard'),
                    Tab(text: 'Profile'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Home Screen
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MentalHealthAdsCarousel(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 210.0, left: 10, right: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    height: double.infinity,
                    width: double.infinity,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          // Your Home Screen content here
                          SizedBox(height: 20),
                          Text(
                            'Categories',
                            style: TextStyle(
                              color: Color(0xff881736),
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
                                      color: Color(0xff881736).withOpacity(0.5)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      children: [
                                        Image.asset('assets/icons/diary.png'),
                                        SizedBox(height: 5),
                                        Text('Journaling'),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20),
                                // CustomContainer(
                                //   ontap: () {
                                //     Navigator.pushNamed(context, '/mycare');
                                //   },
                                //   height: 150,
                                //   width: 120,
                                //   decoration: BoxDecoration(
                                //       borderRadius: BorderRadius.circular(20),
                                //       color: Color(0xff281537).withOpacity(0.5)),
                                //   child: Padding(
                                //     padding: const EdgeInsets.all(10.0),
                                //     child: Column(
                                //       children: [
                                //         Image.asset('assets/icons/girl.png'),
                                //         SizedBox(height: 5),
                                //         Text('Self-Care'),
                                //       ],
                                //     ),
                                //   ),
                                // ),
                                // SizedBox(width: 20),
                                CustomContainer(
                                  ontap: () {
                                    Navigator.pushNamed(context, '/challenge');
                                  },
                                  height: 150,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                       color: Color(0xff281537).withOpacity(0.5)),
                                     
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      children: [
                                        Image.asset('assets/icons/goals.png'),
                                        SizedBox(height: 5),
                                        Text('Challenges'),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20),
                                CustomContainer(
                                  ontap: () {
                                    Navigator.pushNamed(context, '/aware');
                                  },
                                  height: 150,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Color(0xff881736).withOpacity(0.5)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      children: [
                                        Image.asset('assets/icons/aware.png'),
                                        SizedBox(height: 5),
                                        Text('Awareness'),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'For You',
                            style: TextStyle(
                              color: Color(0xff881736),
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 20),
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
                                  padding: const EdgeInsets.only(top: 30, right: 10),
                                  child: Column(
                                    children: [
                                      Text(
                                        'Self Assessment Test',
                                        style: TextStyle(color: Colors.white, fontSize: 14),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        'Assessment will guide\nyou to take-on\nyour mental wellness.',
                                        style: TextStyle(color: Colors.white, fontSize: 9),
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
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ThDashboard(),
          // Profile Screen
          ThProfile(),
        ],
      ),
    ); 
    }
    }
