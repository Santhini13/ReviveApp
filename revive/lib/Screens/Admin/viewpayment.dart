import 'package:flutter/material.dart';
import 'package:revive/Screens/constants/myAppbar.dart';

class ViewPayment extends StatelessWidget {
   final List<Map<String, dynamic>> payments = [
    {
      "userId": 1,
      "amount": 50.0,
      "date": "2024-05-14",
      "therapistName": "John Doe",
      "therapistEmail": "john.doe@example.com",
    },
    {
      "userId": 2,
      "amount": 30.0,
      "date": "2024-05-15",
      "therapistName": "Jane Smith",
      "therapistEmail": "jane.smith@example.com",
    },
    // Add more payment data as needed
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'View Payment'), 
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: payments.length,
                itemBuilder: (context, index) {
                  final payment = payments[index];
                  return Card(
                    //color: randomColor,
                    child: ListTile(
                      title: Text('User ID: ${payment["userId"]}'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Amount: \$${payment["amount"]}'),
                          Text('Date: ${payment["date"]}'),
                          Text('Therapist Name: ${payment["therapistName"]}'),
                          Text('Therapist Email: ${payment["therapistEmail"]}'),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
