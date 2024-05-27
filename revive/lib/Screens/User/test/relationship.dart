import 'package:flutter/material.dart';
import 'package:revive/Screens/general/testcard.dart';

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
                 Text('Relationship',style: TextStyle(fontSize: 35,color: Colors.white)),
                           Image.asset(
                         'assets/images/relaticon.png',
                         width: 150,
                         height: 150,
                       ),
               ],
             ),
             Text('Select the answer that best suits your current relationship',style: TextStyle(fontSize: 15,color: Colors.white),
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
              title: 'Relationship',
              questions: [
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
  'question': 'I feel like I cannot express my true feelings or opinions around my partner',
  'options': ['Never', 'Sometimes', 'Often', 'Almost always']
},
              {
                'question':'I hide the truth from others because I am afraid not to',
                'options':['Never','Sometimes','often','Almost always',]
              },
 

            ], ),
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