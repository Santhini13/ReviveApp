import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:revive/Models/UserModal.dart';
import 'package:revive/Services/authprovider.dart' as AuthenticationProvider;
import 'package:revive/forgotPassword.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({Key? key}) : super(key: key);

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _emailOrPhoneController;
  late TextEditingController _passwordController;
  bool _isPasswordVisible = false;

  // Future<void> handleLogin() async {
  //   if (_formKey.currentState!.validate()) {
  //     //Save form state
  //     _formKey.currentState!.save();
  //     String email = _emailOrPhoneController.text;
  //     String password = _passwordController.text;

  //      print('Email: $email, Password: $password');
  //     try {
  //       await Provider.of<AuthenticationProvider.AuthProvider>(context,
  //               listen: false)
  //           .login(_emailOrPhoneController.text, _passwordController.text);
  //     } catch (e) {
  //       print(e);
  //     }
  //   }
  // }

Future<void> handleLogin() async {
  if (_formKey.currentState!.validate()) {
    // Save form state
    _formKey.currentState!.save();
    String email = _emailOrPhoneController.text;
    String password = _passwordController.text;

    try {
      // Perform login operation
      await Provider.of<AuthenticationProvider.AuthProvider>(context, listen: false)
          .login(email, password);

      // Navigate to the appropriate screen based on user's role
      final authProvider = Provider.of<AuthenticationProvider.AuthProvider>(context, listen: false);
      switch (authProvider.user!.role) {
        case 'User':
          Navigator.pushReplacementNamed(context, '/uonboard');
          break;
        case 'Therapist':
          Navigator.pushReplacementNamed(context,  '/thonboard');
          break;
        case 'Admin':
          Navigator.pushReplacementNamed(context, '/adboard');
          break;
        default:
          // Navigate to a default screen if user role is not recognized
          Navigator.pushReplacementNamed(context, '/Splash2');
      }
    } catch (e) {
      print(e);
      // Handle login error
       showErrorMessage('Invalid email or password');
    }
  }
}
 void showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
        content: Text(
          message,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xff881736),
      ),
    );
  }
  @override
  void initState() {
    super.initState();
    _emailOrPhoneController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailOrPhoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff881736), Color(0xff281537)],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: Column(
                children: [
                  Image.asset('assets/images/logo.png', height: 100),
                  SizedBox(height: 10),
                  Center(
                    child: Text(
                      'Welcome Back',
                      style: TextStyle(color: Colors.white, fontSize: 28),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Sign In If You Have An Account',
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 270.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              height: double.infinity,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.only(left: 30, right: 30, top: 50),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: _emailOrPhoneController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.contact_page),
                            hintText: 'Enter your email',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email ';
                            }
                            // Validate email or phone number format using regex
                            if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                .hasMatch(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          obscureText: !_isPasswordVisible,
                          controller: _passwordController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.password),
                            hintText: 'Enter your password',
                            border: OutlineInputBorder(),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                // Update the state to toggle the password visibility
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              },
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your password';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters long';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 1),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ForgotPasswordPage()));
                              print('Forgot Password?');
                            },
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(color: Color(0xff881736)),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: handleLogin,
                          child: Text(
                            'Login',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff281537),
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 50.0, right: 50),
                          child: Row(
                            children: [
                              Text(
                                'Don\'t have an account?',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(width: 10),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushReplacementNamed(context, '/register');
                                },
                                child: Text('Register'),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
