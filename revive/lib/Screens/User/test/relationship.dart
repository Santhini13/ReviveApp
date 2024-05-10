import 'package:flutter/material.dart';
import 'package:revive/Models/testcard.dart';

class relatioTest extends StatefulWidget {
  const relatioTest({super.key});

  @override
  State<relatioTest> createState() => _relatioTestState();
}

class _relatioTestState extends State<relatioTest> {
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
              Text('Relationship',style: TextStyle(fontSize: 35,color: Colors.white)),
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
                'question':'My partner makes me feel unsafe even in my own home',
                'options':['Never','Sometimes','often','Almost always',]
              },
              {
                'question':'I feel ashamed of the things my partner does to me ',
                'options':['Never','Sometimes','often','Almost always',]
              },
              {
                'question':'I try not to rock the boat because I am afraid of what my partner might do',
                'options':['Never','Sometimes','often','Almost always',]
              },
              {
                'question':'I feel like I am programmed to react a certain way to my partner ',
                'options':['Never','Sometimes','often','Almost always',]
              },
              {
                'question':'I feel like my partner keeps me prisoner',
                'options':['Never','Sometimes','often','Almost always',]
              },
              {
                'question':'My partner makes me feel like I have no control over my life, no power, no protection ',
                'options':['Never','Sometimes','often','Almost always',]
              },
              {
                'question':'My partner can scare me without laying a hand on me',
                'options':['Never','Sometimes','often','Almost always',]
              },
              {
                'question':'My partner has a look that goes straight through me and terrifies me',
                'options':['Never','Sometimes','often','Almost always',]
              }, 
              {
                'question':'I hide the truth from others because I am afraid not to',
                'options':['Never','Sometimes','often','Almost always',]
              },
            ],),
          )
        )),
        // Padding(
        //   padding: const EdgeInsets.all(20.0),
        //   child: 
        // ),
        
        ])
    );
  }
}