import 'package:flutter/material.dart';

class QuestionWidget extends StatefulWidget {
 final List<Map<String,dynamic>>questions;
  const QuestionWidget({super.key, required this.questions});

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}
// print(QuestionWidget){
//   return QuestionWidget;
// }
class _QuestionWidgetState extends State<QuestionWidget> {
  List<int?>selectedOptions=[];
  int totalScore=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  ListView.builder(
        itemCount: widget.questions.length,
        itemBuilder: (context,index){
          final question=widget.questions[index];
          return Card(
            margin: EdgeInsets.all(8),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Question ${index+1}:${question['question']}',
                style: TextStyle(fontSize: 18),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(question['options'].length, (optionindex) => RadioListTile<int>(
                    title:  Text('${question['options'][optionindex]}',
                  style: TextStyle(fontSize: 16),),
                    value: optionindex, groupValue: selectedOptions.length>index? selectedOptions[index]:null, onChanged: (value){
                    setState(() {
                      selectedOptions[index]=value;
                    });
                  })
                 ))
                ),
            ]
            )
          );
        }

          ),
          floatingActionButton: FloatingActionButton(onPressed: () {
            computeScore();
          },
          backgroundColor:Color(0xff881736), 
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text('Score',style: TextStyle(color: Colors.white,fontSize: 10),),
                Icon(Icons.save,color:Colors.white),
              ],
            ),
          ),),
      );
  }
  
  void computeScore() {
    totalScore=0;
    for(int? optionindex in selectedOptions){
      if(optionindex!=null){
        totalScore+=optionindex+1;
      }
    }
    String message;
    if(totalScore<5){
      message='Your score is $totalScore.You are safe';
    }
    else{
      message='Your score is $totalScore.You are at risk';
    }
    showDialog(context: context, builder: (BuildContext){
      return AlertDialog(
        title: Text('Total Score'),
        content: Text(message),
        actions: [
          TextButton(onPressed: (){
            Navigator.of(context).pop();
          }, child: Text('Ok'))
        ],
      );
    }
    );
  }
}