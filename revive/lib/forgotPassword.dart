import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
       decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
            Color(0xff881736),
            Color(0xff281537)],
           
          )
        ),
        child: Padding(
          padding: const EdgeInsets.only(top:250,left: 50.0,right: 50),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.email,color: Colors.white,size: 25,),
               SizedBox(height: 10),
              Text(
                'Enter the registered email,a reset link will be\nshared open the link and reset your password',
                style: TextStyle(color: Colors.white,fontSize: 12),
              ),
              SizedBox(height: 30),
              // Email TextField for password reset
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Icon(Icons.alternate_email_outlined, color: Colors.grey),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          hintText: 'Enter your registered email',
                          border: InputBorder.none,
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              
              // Reset Password button
              SizedBox(
                //width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Simulate sending a password reset email
                    print('Reset email sent to: ${_emailController.text}');
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Password reset link has been sent to your email.',
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Color(0xff881736),
                      ),
                    );
                  },
                  child: Text(
                    'Send',
                    style: TextStyle(fontSize: 14),
                  ),
                  style: ElevatedButton.styleFrom(
                    //padding: EdgeInsets.symmetric(vertical: 5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
