import 'package:flutter/material.dart';
import 'package:revive/utils/appbutton.dart';

class TherapistDetailScreen extends StatelessWidget {
  final Map<String, String> therapist;

  const TherapistDetailScreen({required this.therapist});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(therapist['name']!),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              therapist['photo']!,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
              'Qualification: ${therapist['qualification']}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Specialization: ${therapist['specification']}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'Description:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              therapist['description']!,
              style: TextStyle(fontSize: 16),
            ),
            
            Text(
              'Appointment Options:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
              onPressed: () {
                // Handle on-site appointment
              },
              child: Text('On-site'),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle video appointment
              },
              child: Text('Video'),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle audio appointment
              },
              child: Text('Audio'),
            ),
          ],),
            SizedBox(height: 20),
            Text(
              'Time Slot Available:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10,),
           Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text("10:00 AM"),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("11:00 AM"),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("02:00 PM"),
                ),]),
                SizedBox(height: 5,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:[
                ElevatedButton(
                  onPressed: () {},
                  child: Text("03:00 PM"),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("04:00 PM"),
                ),
              ],
            ),
            SizedBox(height: 30,),
            Row(
            mainAxisAlignment: MainAxisAlignment.start,
              children: [
              Container(
                width: 50,
                height:50,
                decoration:BoxDecoration(
                  color:Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(10))
                ),child:  Icon(Icons.favorite)),
                SizedBox(width: 20,),
              AppButton(onTap:(){}, child: Text('Book Now ',style:TextStyle(color:Colors.white)),color:Color(0xff881736),height: 50,width:300)
            ],)
          ],
        ),
      ),
    );
  }
}