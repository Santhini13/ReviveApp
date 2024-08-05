import 'package:flutter/material.dart';
import 'package:revive/utils/appbutton.dart';

class MyTest extends StatefulWidget {
  const MyTest({Key? key});

  @override
  State<MyTest> createState() => _MyTestState();
}

class _MyTestState extends State<MyTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight), // Increase the height of the app bar
        child: AppBar(
          title:Text('Self Assessment Test',style:TextStyle(color:Colors.white),),
          backgroundColor: Colors.transparent, // Transparent background
          automaticallyImplyLeading: false, // Removes the back button
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff881736), Color(0xff281537)],
              ),
            ),))),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            height: double.infinity,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 20, right: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListTileCard(
                      onTap: () {
                        Navigator.pushNamed(context, '/anxiety');
                      },
                      title: 'Anxiety',
                      subtitle: 'Find whether you are suffering from Anxiety.',
                      imagePath: 'assets/images/anxietyIcon.png',
                    ),
                    SizedBox(height: 20),
                    ListTileCard(
                      onTap: () {
                        Navigator.pushNamed(context, '/depression');
                      },
                      title: 'Depression',
                      subtitle: 'Find whether you are suffering from Depression.',
                      imagePath: 'assets/images/Depricon.png',
                    ),
                    SizedBox(height: 20),
                    ListTileCard(
                      onTap: () {
                        Navigator.pushNamed(context, '/stress');
                      },
                      title: 'Stress',
                      subtitle: 'Find whether you are suffering from Stress.',
                      imagePath: 'assets/images/StressIcon.png',
                    ),
                    SizedBox(height: 20),
                    ListTileCard(
                      onTap: () {
                        Navigator.pushNamed(context, '/relations');
                      },
                      title: 'Relationship',
                      subtitle: 'Find whether you are suffering from Relationship problem.',
                      imagePath: 'assets/images/relaticon.png',
                    ),
                    SizedBox(height: 20),
                    ListTileCard(
                      onTap: () {
                        Navigator.pushNamed(context, '/SUD');
                      },
                      title: 'Substance Use',
                      subtitle: 'Find whether you are suffering from excessive use of drugs.',
                      imagePath: 'assets/images/sudIcon.png',
                    ),
                    SizedBox(height: 20),
                    ListTileCard(
                      onTap: () {
                        Navigator.pushNamed(context, '/therapist');
                      },
                      title: 'Others',
                      subtitle: 'If you dont know the issue, take direct therapy.',
                      imagePath: 'assets/images/OthIcon.png',
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ListTileCard extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final String subtitle;
  final String imagePath;

  const ListTileCard({
    required this.onTap,
    required this.title,
    required this.subtitle,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 5,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      subtitle,
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              Image.asset(
                imagePath,
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class MyTest extends StatefulWidget {
//   const MyTest({super.key});

//   @override
//   State<MyTest> createState() => _MyTestState();
// }

// class _MyTestState extends State<MyTest> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar:AppBar(
//         title:Text('Self Assesment Test')
//       ),
//        body:Stack(
//         children: [
//        Container(
//          decoration: BoxDecoration(
//            color: Colors.white,
//            borderRadius: BorderRadius.only(
//              topLeft: Radius.circular(40),
//              topRight: Radius.circular(40)
//            )
//          ),
//          height: double.infinity,
//          width: double.infinity,
//           child: Padding(
//              padding: const EdgeInsets.only(top: 10.0,left: 20,right: 20),
//              child: SingleChildScrollView(
//                child: Column(children: [
//                   CustomContainer(ontap: (){},
//                      height: 200,
//                      width: double.infinity,
//                      decoration: BoxDecoration(
//                        borderRadius: BorderRadius.circular(20),
//                        gradient:LinearGradient(colors: [Color(0xff881736).withOpacity(0.5), Color(0xff281537)])
//                        ),
//                        child: Row(
//                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                          children: [
//                            Padding(
//                              padding: const EdgeInsets.only(left:20.0,top:30),
//                              child: Column(
//                                children: [
//                                  Text('Anxiety',style: TextStyle(color: Colors.white,fontSize: 20),),
//                                  SizedBox(height: 5),
//                                  Text('Find whether you are suffering \nfrom Anxiety.',style: TextStyle(color: Colors.white,fontSize: 10),textAlign: TextAlign.center,),
//                                   SizedBox(height: 25),
//                                  AppButton(onTap: (){
//                                    Navigator.pushNamed(context, '/anxiety');
//                                  }, child: Text('Take Test',style: TextStyle(color: Colors.white),),color:Color(0xff281537),width: 100,height: 40,)
//                                ],
//                              ),
//                            ),
//                            Image.asset('assets/images/anxietyIcon.png',height:250,)
//                          ],
//                        ),
//                      ),
//                      SizedBox(height: 20,),
//                      CustomContainer(ontap: (){},
//                      height: 200,
//                      width: double.infinity,
//                      decoration: BoxDecoration(
//                        borderRadius: BorderRadius.circular(20),
//                        gradient:LinearGradient(colors: [Color(0xff281537),Color(0xff881736).withOpacity(0.5), ])
//                        ),
//                        child: Row(
//                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                          children: [
//                             Image.asset('assets/images/Depricon.png',height:300,),
//                            Padding(
//                              padding: const EdgeInsets.only(top:30,right: 20),
//                              child: Column(
//                                children: [
//                                  Text('Depression',style: TextStyle(color: Colors.white,fontSize: 20),),
//                                  SizedBox(height: 5),
//                                  Text('Find whether you are suffering \nfrom Depression.',style: TextStyle(color: Colors.white,fontSize: 10),textAlign: TextAlign.center,),
//                                   SizedBox(height: 25),
//                                  AppButton(onTap: (){
//                                    Navigator.pushNamed(context, '/depression');
//                                  }, child: Text('Take Test',style: TextStyle(color: Colors.white),),color:Color(0xff281537),width: 100,height: 40,)
//                                ],
//                              ),
//                            ),
//                          ]
//                        ),
//                      ),
//                      SizedBox(height: 20,),
//                      CustomContainer(ontap: (){},
//                      height: 200,
//                      width: double.infinity,
//                      decoration: BoxDecoration(
//                        borderRadius: BorderRadius.circular(20),
//                        gradient:LinearGradient(colors: [Color(0xff881736).withOpacity(0.5), Color(0xff281537)])
//                        ),
//                        child: Row(
//                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                          children: [
//                            Padding(
//                              padding: const EdgeInsets.only(left:20.0,top:30),
//                              child: Column(
//                                children: [
//                                  Text('Stress',style: TextStyle(color: Colors.white,fontSize: 20),),
//                                  SizedBox(height: 5),
//                                  Text('Find whether you are suffering \nfrom Stress.',style: TextStyle(color: Colors.white,fontSize: 10),textAlign: TextAlign.center,),
//                                   SizedBox(height: 25),
//                                  AppButton(onTap: (){
//                                    Navigator.pushNamed(context, '/stress');
//                                  }, child: Text('Take Test',style: TextStyle(color: Colors.white),),color:Color(0xff281537),width: 100,height: 40,)
//                                ],
//                              ),
//                            ),
//                            Image.asset('assets/images/StressIcon.png',height:300,)
//                          ],
//                        ),
//                      ),
//                      SizedBox(height: 20,),
//                      CustomContainer(ontap: (){},
//                      height: 200,
//                      width: double.infinity,
//                      decoration: BoxDecoration(
//                        borderRadius: BorderRadius.circular(20),
//                        gradient:LinearGradient(colors: [Color(0xff281537),Color(0xff881736).withOpacity(0.5), ])
//                        ),
//                        child: Row(
//                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                          children: [
//                             Image.asset('assets/images/relaticon.png',height:300,),
//                            Padding(
//                              padding: const EdgeInsets.only(top:30,right: 20),
//                              child: Column(
//                                children: [
//                                  Text('Relationship',style: TextStyle(color: Colors.white,fontSize: 20),),
//                                  SizedBox(height: 5),
//                                  Text('Find whether you are suffering \nfrom Relationship problem.',style: TextStyle(color: Colors.white,fontSize: 10),textAlign: TextAlign.center,),
//                                   SizedBox(height: 25),
//                                  AppButton(onTap: (){
//                                    Navigator.pushNamed(context, '/relations');
//                                  }, child: Text('Take Test',style: TextStyle(color: Colors.white),),color:Color(0xff281537),width: 100,height: 40,)
//                                ],
//                              ),
//                            ),
//                          ]
//                        ),
//                      ),
//                      SizedBox(height: 20,),
//                      CustomContainer(ontap: (){},
//                    height: 200,
//                    width: double.infinity,
//                    decoration: BoxDecoration(
//                      borderRadius: BorderRadius.circular(20),
//                      gradient:LinearGradient(colors: [Color(0xff881736).withOpacity(0.5), Color(0xff281537)])
//                      ),
//                      child: Row(
//                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                        children: [
//                          Padding(
//                            padding: const EdgeInsets.only(left:20.0,top:30),
//                            child: Column(
//                              children: [
//                                Text('Substance Use',style: TextStyle(color: Colors.white,fontSize: 20),),
//                                SizedBox(height: 5),
//                                Text('Find whether you are suffering \nfrom excessive use of drugs.',style: TextStyle(color: Colors.white,fontSize: 10),textAlign: TextAlign.center,),
//                                 SizedBox(height: 25),
//                                AppButton(onTap: (){
//                                  Navigator.pushNamed(context, '/SUD');
//                                }, child: Text('Take Test',style: TextStyle(color: Colors.white),),color:Color(0xff281537),width: 100,height: 40,)
//                              ],
//                            ),
//                          ),
//                          Image.asset('assets/images/sudIcon.png',height:300,)
//                        ],
//                      ),
//                    ),
//                    SizedBox(height: 20,),
//                    CustomContainer(ontap: (){},
//                    height: 200,
//                    width: double.infinity,
//                    decoration: BoxDecoration(
//                      borderRadius: BorderRadius.circular(20),
//                      gradient:LinearGradient(colors: [Color(0xff281537),Color(0xff881736).withOpacity(0.5), ])
//                      ),
//                      child: Row(
//                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                        children: [
//                           Image.asset('assets/images/OthIcon.png',height:300,),
//                          Padding(
//                            padding: const EdgeInsets.only(top:30,right: 20),
//                            child: Column(
//                              children: [
//                                Text('Others',style: TextStyle(color: Colors.white,fontSize: 20),),
//                                SizedBox(height: 5),
//                                Text('If you dont know the issue\ntake direct therapy.',style: TextStyle(color: Colors.white,fontSize: 10),textAlign: TextAlign.center,),
//                                 SizedBox(height: 25),
//                                AppButton(onTap: (){
//                                  Navigator.pushNamed(context, '/viewtherapist');
//                                }, child: Text('Take Therapy',style: TextStyle(color: Colors.white),),color:Color(0xff281537),width: 100,height: 40,)
//                              ],
//                            ),
//                          ),
//                        ]
//                      ),
//                    ),
//                    SizedBox(height: 20,),
//                ]),
//              )))]
      // body: Container(
      //  // color: Color.fromARGB(255, 114, 219, 219).withOpacity(0.4),
      //   child: SingleChildScrollView(
      //     child: Column(
      //       children: [
      //         //Text('Take a Mental Health Test',style: TextStyle(fontSize: 18),),
      //         SizedBox(height: 10,),
      //         Padding(
      //           padding: const EdgeInsets.only(left:30.0,right: 30.0),
      //           child: Text('Online Screening is one of the quickest way to determine whether you are experiencing symptoms of mental health condition.',style: TextStyle(fontSize: 16),textAlign: TextAlign.justify,),
      //         ),
      //         SizedBox(height: 20,),
      //         Padding(
      //           padding: const EdgeInsets.only(left: 20.0,top: 10,right: 20),
      //           child: SingleChildScrollView(
      //             child: Column(
      //               children: [
      //                 Row(
      //               children: [
      //                 CustomContainer(ontap: (){},
      //                  decoration: BoxDecoration(
      //                       color:Color.fromARGB(255, 114, 219, 219),
      //                       borderRadius: BorderRadius.circular(10),
      //                       boxShadow: [
      //                         BoxShadow(
      //                             offset: Offset(0, 5),
      //                             color: Color.fromARGB(255, 100, 100, 85),
      //                             spreadRadius: 2,
      //                             blurRadius: 5)
      //                       ]),
      //                 child: Column(
      //                   children: [
      //                     Image.asset('assets/images/AnxIcon.png',height: 150,),
      //                     Padding(
      //                     padding: const EdgeInsets.only(bottom: 20.0),
      //                       child: Text('Anxiety'),
      //                     )
      //                   ],
      //                 ),),
      //                 SizedBox(width: 20,),
      //                 CustomContainer(ontap: (){},
      //                  decoration: BoxDecoration(
      //                       color:Color.fromARGB(255, 114, 219, 219),
      //                       borderRadius: BorderRadius.circular(10),
      //                       boxShadow: [
      //                         BoxShadow(
      //                             offset: Offset(0, 5),
      //                             color: Color.fromARGB(255, 100, 100, 85),
      //                             spreadRadius: 2,
      //                             blurRadius: 5)
      //                       ]),
      //                 child: Column(
      //                   children: [
      //                     Image.asset('assets/images/Depricon.png',height: 150,),
      //                     Padding(
      //                       padding: const EdgeInsets.only(bottom: 20.0),
      //                       child: Text('Depression'),
      //                     )
      //                   ],
      //                 ),),
      //               ],
      //             ),
      //             SizedBox(height: 30,),
      //             Row(
      //               children: [
      //                 CustomContainer(ontap: (){},
      //                  decoration: BoxDecoration(
      //                       color:Color.fromARGB(255, 114, 219, 219),
      //                       borderRadius: BorderRadius.circular(10),
      //                       boxShadow: [
      //                         BoxShadow(
      //                             offset: Offset(0, 5),
      //                             color: Color.fromARGB(255, 100, 100, 85),
      //                             spreadRadius: 2,
      //                             blurRadius: 5)
      //                       ]),
      //                 child: Column(
      //                   children: [
      //                     Image.asset('assets/images/StressIcon.png',height: 150,),
      //                     Padding(
      //                      padding: const EdgeInsets.only(bottom: 20.0),
      //                       child: Text('Stress'),
      //                     )
      //                   ],
      //                 ),),
      //                  SizedBox(width: 20,),
      //                 CustomContainer(ontap: (){},
      //                 decoration: BoxDecoration(
      //                       color:Color.fromARGB(255, 114, 219, 219),
      //                       borderRadius: BorderRadius.circular(10),
      //                       boxShadow: [
      //                         BoxShadow(
      //                             offset: Offset(0, 5),
      //                             color: Color.fromARGB(255, 100, 100, 85),
      //                             spreadRadius: 2,
      //                             blurRadius: 5)
      //                       ]),
      //                 child: Column(
      //                   children: [
      //                     Image.asset('assets/images/relaticon.png',height: 150,),
      //                     Padding(
      //                       padding: const EdgeInsets.only(bottom: 20.0),
      //                       child: Text('Relationship'),
      //                     )
      //                   ],
      //                 ),),
      //               ],
      //             ),
      //             SizedBox(height: 30,),
      //             Row(
      //               children: [
      //                 CustomContainer(ontap: (){},
      //                  decoration: BoxDecoration(
      //                       color:Color.fromARGB(255, 114, 219, 219),
      //                       borderRadius: BorderRadius.circular(10),
      //                       boxShadow: [
      //                         BoxShadow(
      //                             offset: Offset(0, 5),
      //                             color: Color.fromARGB(255, 100, 100, 85),
      //                             spreadRadius: 2,
      //                             blurRadius: 5)
      //                       ]),
      //                 child: Column(
      //                   children: [
      //                     Image.asset('assets/images/sudIcon.png',height: 150,),
      //                     Padding(
      //                       padding: const EdgeInsets.only(bottom: 20.0),
      //                       child: Text('Substance Use'),
      //                     )
      //                   ],
      //                 ),),
      //                  SizedBox(width: 20,),
      //                 CustomContainer(ontap: (){},
      //                decoration: BoxDecoration(
      //                       color:Color.fromARGB(255, 114, 219, 219),
      //                       borderRadius: BorderRadius.circular(10),
      //                       boxShadow: [
      //                         BoxShadow(
      //                             offset: Offset(0, 5),
      //                             color: Color.fromARGB(255, 100, 100, 85),
      //                             spreadRadius: 2,
      //                             blurRadius: 5)
      //                       ]),
                      
      //                 child: Column(
      //                   children: [
      //                     Image.asset('assets/images/OthIcon.png',height: 150,),
      //                     Padding(
      //                       padding: const EdgeInsets.only(bottom: 20.0),
      //                       child: Text('Other'),
      //                     )
      //                   ],
                        
      //                 ),),
                      
      //               ],
      //             ),
      //             SizedBox(height: 30,),
      //                 Padding(
      //                   padding: const EdgeInsets.only(left: 10.0,right: 9.0,bottom: 40),
      //                   child: Text('These tests are used as a preliminary analysis to identify whether you posses any kind of symptoms. If you feel very low take support from specialist',style: TextStyle(color: Color.fromARGB(255, 209, 209, 209)),),
      //                 )
      //               ],
      //             ),
      //           ),
      //         )
          
      //       ],
      //     ),
      //   )
       
   //   ),
//     );
//   }
// }