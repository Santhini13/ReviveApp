// import 'package:flutter/material.dart';

// class UserLogin extends StatefulWidget {
//   const UserLogin({Key? key}) : super(key: key);

//   @override
//   State<UserLogin> createState() => _UserLoginState();
// }

// class _UserLoginState extends State<UserLogin> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   late TextEditingController _emailOrPhoneController;
//   late TextEditingController _passwordController;
//   bool isUser = false;
//   bool isTherapist = false;

//   void handleLogin() {
//     if (_formKey.currentState!.validate()) {
//       //Save form state
//       _formKey.currentState!.save();
//       if (isUser) {
//         // Navigate to user page
//         Navigator.pushNamed(context, '/uonboard');
//         // Navigator.push(
//         //   context,
//         //   MaterialPageRoute(builder: (context) => Home()),
//         // );
//       } else if (isTherapist) {
//         Navigator.pushNamed(context, '/thonboard');
//       } else {
//         Navigator.pushNamed(context, '/adboard');
//       }
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     _emailOrPhoneController = TextEditingController();
//     _passwordController = TextEditingController();
//   }

//   @override
//   void dispose() {
//     _emailOrPhoneController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
    // return Scaffold(
    //   body: Stack(
    //     children: [
    //       Container(
    //         height: double.infinity,
    //         width: double.infinity,
    //         decoration: BoxDecoration(
    //           gradient: LinearGradient(
    //             colors: [Color(0xff881736), Color(0xff281537)],
    //           ),
    //         ),
    //         child: Padding(
    //           padding: const EdgeInsets.only(top: 80.0),
    //           child: Column(
    //             children: [
    //               Image.asset('assets/images/logo.png', height: 100),
    //               SizedBox(height: 10),
    //               Center(
    //                 child: Text(
    //                   'Welcome Back',
    //                   style: TextStyle(color: Colors.white, fontSize: 28),
    //                 ),
    //               ),
    //               SizedBox(height: 10),
    //               Text(
    //                 'Sign In If You Have An Account',
    //                 style: TextStyle(color: Colors.white, fontSize: 10),
    //               ),
    //               SizedBox(height: 30),
    //             ],
    //           ),
    //         ),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.only(top: 270.0),
    //         child: Container(
    //           decoration: BoxDecoration(
    //             color: Colors.white,
    //             borderRadius: BorderRadius.only(
    //               topLeft: Radius.circular(40),
    //               topRight: Radius.circular(40),
    //             ),
    //           ),
    //           height: double.infinity,
    //           width: double.infinity,
    //           child: Padding(
    //             padding: EdgeInsets.only(left: 30, right: 30, top: 50),
    //             child: Form(
    //               key: _formKey,
    //               child: SingleChildScrollView(
    //                 child: Column(
    //                   mainAxisAlignment: MainAxisAlignment.start,
    //                   children: [
    //                     TextFormField(
    //                       controller: _emailOrPhoneController,
    //                       decoration: InputDecoration(
    //                         prefixIcon: Icon(Icons.contact_page),
    //                         hintText: 'Enter your email or phone number',
    //                         border: OutlineInputBorder(),
    //                       ),
    //                       validator: (value) {
    //                         if (value!.isEmpty) {
    //                           return 'Please enter your email or phone number';
    //                         }
    //                         // Validate email or phone number format using regex
    //                         if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
    //                                 .hasMatch(value) &&
    //                             !RegExp(r'^[0-9]{10}$').hasMatch(value)) {
    //                           return 'Please enter a valid email or phone number';
    //                         }
    //                         return null;
    //                       },
    //                       keyboardType: TextInputType.emailAddress,
    //                     ),
    //                     SizedBox(height: 20),
    //                     TextFormField(
    //                       controller: _passwordController,
    //                       decoration: InputDecoration(
    //                         prefixIcon: Icon(Icons.password),
    //                         hintText: 'Enter your password',
    //                         border: OutlineInputBorder(),
    //                       ),
    //                       validator: (value) {
    //                         if (value!.isEmpty) {
    //                           return 'Please enter your password';
    //                         }
    //                         if (value.length < 6) {
    //                           return 'Password must be at least 6 characters long';
    //                         }
    //                         return null;
    //                       },
    //                       obscureText: true,
    //                     ),
    //                     SizedBox(height: 1),
    //                     Align(
    //                       alignment: Alignment.centerRight,
    //                       child: TextButton(
    //                         onPressed: () {
    //                           // Implement forgot password logic here
    //                           print('Forgot Password?');
    //                         },
    //                         child: Text(
    //                           'Forgot Password?',
    //                           style: TextStyle(color: Color(0xff881736)),
    //                         ),
    //                       ),
    //                     ),
    //                    SizedBox(height: 20),

    //                 // Row(
    //                 //   children: [
    //                 //     Text('Choose Your Role'),
    //                 //     SizedBox(width: 10,),
    //                 //     Checkbox(
    //                 //       value: isUser,
    //                 //       onChanged: (value) {
    //                 //         setState(() {
    //                 //           isUser = value!;
    //                 //           if (value) {
    //                 //             isTherapist = false;
    //                 //           }
    //                 //         });
    //                 //       },
    //                 //     ),
    //                 //     Text('User'),
    //                 //     SizedBox(width: 5),
    //                 //     Checkbox(
    //                 //       value: isTherapist,
    //                 //       onChanged: (value) {
    //                 //         setState(() {
    //                 //           isTherapist = value!;
    //                 //           if (value) {
    //                 //             isUser = false;
    //                 //           }
    //                 //         });
    //                 //       },
    //                 //     ),
    //                 //     Text('Therapist'),
    //                 //   ],
    //                 // ),
    //                     SizedBox(height: 20),
    //                     ElevatedButton(
    //                       onPressed: handleLogin,
    //                       //() {

    //                       // if (_formKey.currentState!.validate()) {
    //                       //   // Save form state
    //                       //   _formKey.currentState!.save();
    //                       //   // Validated successfully, handle login logic here
    //                       //   // For example, you can navigate to the next screen
    //                       //   print('Email/Phone: ${_emailOrPhoneController.text}, Password: ${_passwordController.text}');
    //                       // }
    //                       //},
    //                       child: Text(
    //                         'Login',
    //                         style: TextStyle(color: Colors.white),
    //                       ),
    //                       style: ElevatedButton.styleFrom(
    //                         backgroundColor: Color(0xff281537),
    //                       ),
    //                     ),
    //                     SizedBox(height: 20),
    //                     Padding(
    //                       padding: const EdgeInsets.only(left: 50.0, right: 50),
    //                       child: Row(
    //                         children: [
    //                           Text(
    //                             'Don\'t have an account?',
    //                             textAlign: TextAlign.center,
    //                             style: TextStyle(fontSize: 16),
    //                           ),
    //                           SizedBox(width: 10),
    //                           TextButton(
    //                             onPressed: () {
    //                               Navigator.pushNamed(context, '/register');
    //                             },
    //                             child: Text('Register'),
    //                           )
    //                         ],
    //                       ),
    //                     ),
    //                     SizedBox(height: 20),
    //                     OutlinedButton.icon(
    //                       onPressed: () {
    //                         // Implement sign up with Google logic here
    //                         print('Sign up with Google');
    //                       },
    //                       icon: Icon(Icons.g_mobiledata),
    //                       label: Text('Sign Up with Google'),
    //                     ),
    //                     SizedBox(height: 20),

    //                     //SizedBox(height: 30),
    //                     // ElevatedButton(
    //                     //   onPressed: () {
    //                     //     Navigator.pushNamed(context, '/home');
    //                     //   },
    //                     //   child: Text('user'),
    //                     // ),
    //                     // ElevatedButton(
    //                     //   onPressed: () {
    //                     //     Navigator.pushNamed(context, '/thhome');
    //                     //   },
    //                     //   child: Text('therapist'),
    //                     // )
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
//   }
// }

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({Key? key}) : super(key: key);

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _emailOrPhoneController;
  late TextEditingController _passwordController;

  void handleLogin() async {
    if (_formKey.currentState!.validate()) {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailOrPhoneController.text,
          password: _passwordController.text,
        );

        // Authentication successful, navigate to the appropriate screen
        // Determine the role of the user and navigate accordingly
        User? user = userCredential.user;
        if (user != null) {
          // Fetch user data from Firestore to determine role
          DocumentSnapshot<Map<String, dynamic>> userDoc =
              await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
          if (userDoc.exists) {
            String role = userDoc.data()!['role'];
            if (role == 'User') {
              Navigator.pushNamed(context, '/uonboard');
            } else if (role == 'Therapist') {
              Navigator.pushNamed(context, '/thonboard');
            } else if (role == 'Admin') {
              // Check if the logged-in user is an admin
              Navigator.pushNamed(context, '/adboard');
            } else {
              // Handle other roles or errors
              print('Unknown role');
            }
          } else {
            // User document doesn't exist, handle accordingly
            print('User document does not exist');
          }
        } else {
          // User is null, handle accordingly
          print('User is null');
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
      } catch (e) {
        print(e);
      }
    }
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
                            hintText: 'Enter your email or phone number',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email or phone number';
                            }
                            // Validate email or phone number format using regex
                            if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                    .hasMatch(value) &&
                                !RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                              return 'Please enter a valid email or phone number';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.password),
                            hintText: 'Enter your password',
                            border: OutlineInputBorder(),
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
                          obscureText: true,
                        ),
                        SizedBox(height: 1),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              // Implement forgot password logic here
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
                                  Navigator.pushNamed(context, '/register');
                                },
                                child: Text('Register'),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        OutlinedButton.icon(
                          onPressed: () {
                            // Implement sign up with Google logic here
                            print('Sign up with Google');
                          },
                          icon: Icon(Icons.g_mobiledata),
                          label: Text('Sign Up with Google'),
                        ),
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
