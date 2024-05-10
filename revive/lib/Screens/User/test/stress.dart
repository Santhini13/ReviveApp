import 'package:flutter/material.dart';
import 'package:revive/Models/testcard.dart';

class stressTest extends StatefulWidget {
  const stressTest({super.key});

  @override
  State<stressTest> createState() => _stressTestState();
}

class _stressTestState extends State<stressTest> {
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
              Text('Stress',style: TextStyle(fontSize: 35,color: Colors.white)),
            Text('Select the answer that best suits your current relationship',style: TextStyle(fontSize: 16,color: Colors.white),textAlign:TextAlign.center,),
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
                'question':'Do you have trouble staying focused on the present moment?',
                'options':['Never','Sometimes','often','Almost always',]
              },
              {
                'question':'How often do you feel overwhelmed with your life? ',
                'options':['Never','Sometimes','often','Almost always',]
              },
              {
                'question':' Do you struggle to fall asleep at night? ',
                'options':['Never','Sometimes','often','Almost always',]
              },
              {
                'question':'On average, do you get less than 7-8 hours of sleep a night? ',
                'options':['Never','Sometimes','often','Almost always',]
              },
              {
                'question':'During work hours, do you have a hard time staying focused and concentrating on the task-at-hand?',
                'options':['Never','Sometimes','often','Almost always',]
              },
              {
                'question':'Do you feel pain or tension in your stomach, muscles, chest, or head?',
                'options':['Never','Sometimes','often','Almost always',]
              },
              {
                'question':'Do you have trouble staying focused on the present moment?',
                'options':['Never','Sometimes','often','Almost always',]
              },
              {
                'question':'Do you turn to unhealthy food indulgences such as eating junk food, drinking excessively, or eating sugary foods when feeling overwhelmed?',
                'options':['Never','Sometimes','often','Almost always',]
              },
              {
                'question':'Do you feel like withdrawing from family, friends, and isolating yourself? ',
                'options':['Never','Sometimes','often','Almost always',]
              },
            ],),
          )
        )),
      
        ])
    );
  }
}