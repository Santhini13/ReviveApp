import 'package:flutter/material.dart';
import 'package:revive/screens/general/testcard.dart';

class depressionTest extends StatefulWidget {
  const depressionTest({super.key});

  @override
  State<depressionTest> createState() => _depressionTestState();
}

class _depressionTestState extends State<depressionTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Stack(
        children: [
          Container(
        height: double.infinity,
        
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: 
          [
            Color(0xff881736),
            Color(0xff281537)
          ])
        ),
         child: Padding(
           padding: const EdgeInsets.all(8.0),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [ 
               Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 Text('Depression',style: TextStyle(fontSize: 35,color: Colors.white)),
                           Image.asset(
                         'assets/images/Depricon.png',
                         width: 150,
                         height: 150,
                       ),
               ],
             ),
             Text('Select the answer that best suits your current feelings',style: TextStyle(fontSize: 15,color: Colors.white),
            ),],
           ),
         ),
      ), 
      Padding(
        padding: const EdgeInsets.only(top:220.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          height: double.infinity,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0,right:20,top: 10),
            child: QuestionWidget(
              title:'Depression',
              questions: [
              {
                'question':'Little interest or pleasure in doing things',
                'options':['Not At All','Several Days','More than half of the day','Nearly Everyday',]
              },
              {
                'question':' Feeling down, depressed, or hopeless',
                'options':['Not At All','Several Days','More than half of the day','Nearly Everyday',]
              },
               {
                'question':'Feeling tired or having little energy',
                'options':['Not At All','Several Days','More than half of the day','Nearly Everyday',]
              },
              {
                'question':'Trouble falling or staying asleep, or sleeping too much',
                'options':['Not At All','Several Days','More than half of the day','Nearly Everyday',]
              },
              {
                'question':'Poor appetite or overeating',
                'options':['Not At All','Several Days','More than half of the day','Nearly Everyday',]
              },
              {
                'question':'Feeling bad about yourself - or that you are a failure or have let yourself or your family down',
                'options':['Not At All','Several Days','More than half of the day','Nearly Everyday',]
              },
              {
                'question':'Trouble concentrating on things, such as reading the newspaper or watching television',
                'options':['Not At All','Several Days','More than half of the day','Nearly Everyday',]
              },
               {
                'question':'Moving or speaking so slowly that other people could have noticed Or the opposite - being so fidgety or restless that you have been moving around a lot more than usual',
                'options':['Not At All','Several Days','More than half of the day','Nearly Everyday',]
              },
               {
                'question':'Thoughts that you would be better off dead, or of hurting yourself',
                'options':['Not At All','Several Days','More than half of the day','Nearly Everyday',]
              },
               {
                'question':'If you checked off any problems, how difficult have these problems made it for you at work, home, or with other people?',
                'options':['Not At All','Several Days','More than half of the day','Nearly Everyday',]
              },
            
            ],),
          )
        )),
        
        
        ])
    );
  }
}