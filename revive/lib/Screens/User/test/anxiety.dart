import 'package:flutter/material.dart';
import 'package:revive/Models/testcard.dart';

class AnxietyTest extends StatefulWidget {
  const AnxietyTest({super.key});

  @override
  State<AnxietyTest> createState() => _AnxietyTestState();
}

class _AnxietyTestState extends State<AnxietyTest> {
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
              Text('Anxiety',style: TextStyle(fontSize: 35,color: Colors.white)),
            Text('Select the answer that best suits your current feelings',style: TextStyle(fontSize: 16,color: Colors.white),textAlign:TextAlign.center,),
            ],
          ),
        ),
      ),
       Text('Over the last 2 weeks, how often have you been bothered by the following problems?'),
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
                'question':' Feeling nervous, anxious, or on edge',
                'options':['Not At All','Several Days','More than half of the day','Nearly Everyday',]
              },
              {
                'question':'Not being able to stop or control worrying',
                'options':['Not At All','Several Days','More than half of the day','Nearly Everyday',]
              },
              {
                'question':'Worrying too much about different things',
                'options':['Not At All','Several Days','More than half of the day','Nearly Everyday',]
              },
              {
                'question':' Trouble relaxing',
                'options':['Not At All','Several Days','More than half of the day','Nearly Everyday',]
              },
              {
                'question':' Being so restless that it is hard to sit still',
                'options':['Not At All','Several Days','More than half of the day','Nearly Everyday',]
              },
              {
                'question':'Becoming easily annoyed or irritable',
                'options':['Not At All','Several Days','More than half of the day','Nearly Everyday',]
              },
               {
                'question':'Feeling afraid, as if something awful might happen',
                'options':['Not At All','Several Days','More than half of the day','Nearly Everyday',]
              },
            
            ],),
          )
        )),
        
        ])
    ); 
  }
}