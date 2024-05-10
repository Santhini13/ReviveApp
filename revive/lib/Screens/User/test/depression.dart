import 'package:flutter/material.dart';
import 'package:revive/Models/testcard.dart';

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
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: 
          [
            Color(0xff881736),
            Color(0xff281537)
          ])
        ),
         child: Padding(
          padding: const EdgeInsets.all(70.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [ 
              Text('Depression',style: TextStyle(fontSize: 35,color: Colors.white)),
            Text('Select the answer that best suits your current feelings',style: TextStyle(fontSize: 16,color: Colors.white),textAlign:TextAlign.center,),
            ],
          ),
        ),
      ),
       
      Padding(
        padding: const EdgeInsets.only(top:220.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40)
            )
          ),
          height: double.infinity,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0,right:20,top: 10),
            child: QuestionWidget(questions: [
              {
                'question':'Little interest or pleasure in doing things',
                'options':['Not At All','Several Days','More than half of the day','Nearly Everyday',]
              },
              {
                'question':' Feeling down, depressed, or hopeless',
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