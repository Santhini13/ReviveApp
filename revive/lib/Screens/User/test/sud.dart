import 'package:flutter/material.dart';
import 'package:revive/Models/testcard.dart';

class SudTest extends StatefulWidget {
  const SudTest({super.key});

  @override
  State<SudTest> createState() => _SudTestState();
}

class _SudTestState extends State<SudTest> {
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
              Text('Substance Use',style: TextStyle(fontSize: 35,color: Colors.white)),
            Text('Select the answer that best suits your current usage of substances like alcohol drugs',style: TextStyle(fontSize: 14,color: Colors.white),textAlign:TextAlign.center,),
            ],
          ),
        ),
      ),
       
       Padding(
        padding: const EdgeInsets.only(top:200.0),
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
                'question':'Have you used drugs other than those required for medical reasons?',
                'options':['Yes','No']
              },
              {
                'question':'Do you abuse more than one drug at a time?',
                'options':['Yes','No']
              },
              {
                'question':'Are you always able to stop using drugs when you want to? (if never use drugs, answer “yes”)',
                'options':['Yes','No']
              },
              {
                'question':' Have you had “blackouts” or “flashbacks” as a result of drug use?',
                'options':['Yes','No']
              },
              {
                'question':'Do you ever feel bad or guilty about your drug use? If never use drugs, choose “no.”',
                'options':['Yes','No']
              },
              {
                'question':'Does your spouse (or parent) ever complain about your involvement with drugs',
               'options':['Yes','No']
              },
               {
                'question':'Have you neglected your family because of your use of drugs?',
                'options':['Yes','No']
              },
              {
                'question':'Have you engaged in illegal activities in order to obtain drugs?',
                'options':['Yes','No']
              },
              {
                'question':'Have you ever experienced withdrawal symptoms (felt sick) when you stopped taking drugs?',
                'options':['Yes','No']
              },
              {
                'question':'. Have you had medical problems as a result of your drug use (e.g., memory loss, hepatitis, convulsions, bleeding, etc.)?',
                'options':['Yes','No']
              },
            
            ],),
          )
        )),
        // Padding(
        //   padding: const EdgeInsets.all(20.0),
        //   child: Image.asset('assets/images/sudIcon.png',height: 210 ,),
        // ),
        
        ])
    );
  }
}