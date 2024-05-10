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
      appBar: AppBar(
        title: Text('My Care'),
      ),
      body: Stack(
        children: [
          Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              height: double.infinity,
              width: double.infinity,
              child: Column(children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 30.0, top: 40, right: 30),
                  child: Row(children: [
                    Column(
                      children: [
                        CustomContainer(
                          ontap: () {},
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  width: 1, color: Color(0xff881736))),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset('assets/icons/gym.png',color: Color(0xff281537),),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Exercise')
                      ],
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Column(
                      children: [
                        CustomContainer(
                          ontap: (
                          ) {
                            Navigator.pushNamed(context, '/diet');
                          
                          },
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  width: 1, color: Color(0xff881736))),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset('assets/icons/keto.png',color: Color(0xff281537),),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Diet Plan')
                      ],
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Column(
                      children: [
                        CustomContainer(
                          ontap: () {},
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  width: 1, color: Color(0xff881736))),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.add,color: Color(0xff281537),size:50),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Add Yours')
                      ],
                    )
                  ]),
                ),SizedBox(height: 30,),
          
              ]))
        ],
      ),
    );
  }
}
