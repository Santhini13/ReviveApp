import 'package:flutter/material.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight), // Increase the height of the app bar
        child: AppBar(
          title:Text('Terms & Conditions',style:TextStyle(color:Colors.white),),
          backgroundColor: Colors.transparent, // Transparent background
          automaticallyImplyLeading: false, // Removes the back button
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff881736), Color(0xff281537)],
              ),
            ),))),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome To Revive',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xff881736),
              ),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 20),
            Text(
              'Welcome to Revive. By using this app, you agree to be bound by these Terms and Conditions. Please read them carefully before using the app.',
              style: TextStyle(fontSize: 16),textAlign: TextAlign.justify,
            ),
            SizedBox(height: 20),
            Text(
              '1. Use of the App',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'You agree to use the app only for its intended purposes and in accordance with these Terms and Conditions, as well as any applicable laws and regulations.',
              style: TextStyle(fontSize: 16),textAlign: TextAlign.justify,
            ),
            SizedBox(height: 20),
            Text(
              '2. Privacy Policy',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Our Privacy Policy governs the collection, use, and disclosure of your personal information. By using the app, you consent to the terms of our Privacy Policy.',
              style: TextStyle(fontSize: 16),textAlign: TextAlign.justify,
            ),
            SizedBox(height: 20),
            Text(
              '3. Intellectual Property',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'All content included in the app, such as text, graphics, logos, images, and software, is the property of the app developer and is protected by copyright laws.',
              style: TextStyle(fontSize: 16),textAlign: TextAlign.justify,
            ),
            SizedBox(height: 20),
            Text(
              '4. Disclaimer',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'The information provided in the app is for educational and informational purposes only. It should not be construed as medical advice or used as a substitute for professional medical treatment or diagnosis.',
              style: TextStyle(fontSize: 16),textAlign: TextAlign.justify,
            ),
            SizedBox(height: 20),
            Text(
              '5. User Conduct',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'You agree not to use the app in any way that violates any applicable laws or regulations, or that is prohibited by these Terms and Conditions. You also agree not to engage in any conduct that could harm or interfere with the operation or security of the app.',
              style: TextStyle(fontSize: 16),textAlign: TextAlign.justify,
            ),
            SizedBox(height: 20),
            Text(
              '6. Changes to Terms and Conditions',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'We reserve the right to update or modify these Terms and Conditions at any time without prior notice. Your continued use of the app after any such changes constitutes your acceptance of the new Terms and Conditions.',
              style: TextStyle(fontSize: 16),textAlign: TextAlign.justify,
            ),
            SizedBox(height: 20),
            Text(
              '7. Contact Us',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'If you have any questions or concerns about these Terms and Conditions, please contact us at support@revive.com.',
              style: TextStyle(fontSize: 16),textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}