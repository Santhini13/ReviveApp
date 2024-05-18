import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:revive/Models/UserModal.dart';
import 'package:revive/utils/appbutton.dart';
import 'package:revive/Services/UserService.dart';

class UserRegister extends StatefulWidget {
  @override
  _UserRegisterState createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  //late String _selectedRole;
  bool isUser = false;
  bool isTherapist = false;
  final FirebaseService _firebaseService=FirebaseService();
  final _userservice =FirebaseService();

  void handleLogin() {
    if (_formKey.currentState!.validate()) {
      //Save form state
      _formKey.currentState!.save();
      if (isUser) {
        // Navigate to user page
        Navigator.pushNamed(context, '/uonboard');
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => Home()),
        // );
      } else if (isTherapist) {
        Navigator.pushNamed(context, '/thonboard');
      } else {
        Navigator.pushNamed(context, '/adminhome');
      }
    }
  } 

  @override
  void dispose() {
    _usernameController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  Future<void>_register() async{
    if(_formKey.currentState!.validate()){
      String role = isUser ? 'User' : 'Therapist';
      Users user =Users(
        username:_usernameController.text,
        email: _emailController.text,
        password: _passwordController.text,
        phoneNumber:_phoneNumberController.text, 
        role: role,

      );
      try{
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        await _firebaseService.registerUser(user);
        handleLogin();
      } 
      catch(e){
        print('Error user: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xff881736), Color(0xff281537)])),
          child: Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: Column(
              children: [
                Image.asset('assets/images/logo.png', height: 100),
                SizedBox(height: 10),
                Center(
                    child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white, fontSize: 28),
                )),
                SizedBox(height: 10),
                Text('If you don\'t have an account',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    )),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          )),
      Padding(
        padding: const EdgeInsets.only(top: 250.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40))),
          height: double.infinity,
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.only(left: 30, right: 30, top: 50),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  //crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        hintText: 'Enter your username',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your username';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _phoneNumberController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone),
                        hintText: 'Enter your phone number',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        // Validate phone number format using regex
                        if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                          return 'Please enter a valid phone number';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.phone,
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        hintText: 'Enter your email',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email';
                        }
                        // Validate email format using regex
                        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                            .hasMatch(value)) {
                          return 'Please enter a valid email address';
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
                    SizedBox(height: 20),

                    Row(
                      children: [
                        Text('Choose Your Role'),
                        SizedBox(width: 10,),
                        Checkbox(
                          value: isUser,
                          onChanged: (value) {
                            setState(() {
                              isUser = value!;
                              if (value) {
                                isTherapist = false;
                              }
                            });
                          },
                        ),
                        Text('User'),
                        SizedBox(width: 5),
                        Checkbox(
                          value: isTherapist,
                          onChanged: (value) {
                            setState(() {
                              isTherapist = value!;
                              if (value) {
                                isUser = false;
                              }
                            });
                          },
                        ),
                        Text('Therapist'),
                      ],
                    ),
                    // DropdownButtonFormField(
                    //   decoration: InputDecoration(
                    //     border: OutlineInputBorder(),
                    //     hintText: 'Select your role',
                    //   ),
                    //   value: _selectedRole,
                    //   onChanged: (value) {
                    //     setState(() {
                    //       _selectedRole = value!;
                    //     });
                    //   },
                    //   items: [
                    //     DropdownMenuItem(
                    //       value: 'user',
                    //       child: Text('User'),
                    //     ),
                    //     DropdownMenuItem(
                    //       value: 'therapist',
                    //       child: Text('Therapist'),
                    //     ),
                    //   ],
                    //   validator: (value) {
                    //     if (value == null) {
                    //       return 'Please select your role';
                    //     }
                    //     return null;
                    //   },
                    // ),
                    SizedBox(height: 20),
                    AppButton(
                      onTap: () {
                        _register();
                          // Validated successfully, handle registration logic here
                          // For example, you can navigate to the next screen
                          // print(
                          //     'Username: ${_usernameController.text}, Phone: ${_phoneNumberController.text}, Email: ${_emailController.text}, Password: ${_passwordController.text}');
                        
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(color: Colors.white),
                      ),
                      height: 50,
                      width: 100,
                      color: Color(0xff281537),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 60.0, right: 50),
                      child: Row(
                        children: [
                          Text(
                            'If you have an account?',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          AppButton(
                            onTap: () {
                              Navigator.pushNamed(context, '/login');
                            },
                            child: Text('Login'),
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
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ]));
  }
}

// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// class UserRegister extends StatefulWidget {
//   @override
//   _UserRegisterState createState() => _UserRegisterState();
// }

// class _UserRegisterState extends State<UserRegister> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   TextEditingController _usernameController = TextEditingController();
//   TextEditingController _phoneNumberController = TextEditingController();
//   TextEditingController _emailController = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();
//   bool isUser = false;
//   bool isTherapist = false;

//   void handleRegistration() async {
//     if (_formKey.currentState!.validate()) {
  //     try {
  //       UserCredential userCredential =
  //           await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //         email: _emailController.text,
  //         password: _passwordController.text,
  //       );

  //       // User registration successful, now save additional user information if needed
  //       // For example, you can save username, phone number, and role to Firebase Firestore

  //       // Navigate to the home screen or appropriate screen after registration
  //       if (isUser) {
  //         Navigator.pushNamed(context, '/uonboard');
  //       } else if (isTherapist) {
  //         Navigator.pushNamed(context, '/thonboard');
  //       } else {
  //         Navigator.pushNamed(context, '/adboard');
  //       }
  //     } on FirebaseAuthException catch (e) {
  //       if (e.code == 'weak-password') {
  //         print('The password provided is too weak.');
  //       } else if (e.code == 'email-already-in-use') {
  //         print('The account already exists for that email.');
  //       }
  //     } catch (e) {
  //       print(e);
  //     }
  //   }
  // }

//   @override
//   void dispose() {
//     _usernameController.dispose();
//     _phoneNumberController.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             height: double.infinity,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [Color(0xff881736), Color(0xff281537)],
//               ),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.only(top: 60.0),
//               child: Column(
//                 children: [
//                   Image.asset('assets/images/logo.png', height: 100),
//                   SizedBox(height: 10),
//                   Center(
//                     child: Text(
//                       'Register',
//                       style: TextStyle(color: Colors.white, fontSize: 28),
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     'If you don\'t have an account',
//                     style: TextStyle(color: Colors.white, fontSize: 10),
//                   ),
//                   SizedBox(height: 30),
//                 ],
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 250.0),
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(40),
//                   topRight: Radius.circular(40),
//                 ),
//               ),
//               height: double.infinity,
//               width: double.infinity,
//               child: Padding(
//                 padding: EdgeInsets.only(left: 30, right: 30, top: 50),
//                 child: Form(
//                   key: _formKey,
//                   child: SingleChildScrollView(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         TextFormField(
//                           controller: _usernameController,
//                           decoration: InputDecoration(
//                             prefixIcon: Icon(Icons.person),
//                             hintText: 'Enter your username',
//                             border: OutlineInputBorder(),
//                           ),
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return 'Please enter your username';
//                             }
//                             return null;
//                           },
//                         ),
//                         SizedBox(height: 20),
//                         TextFormField(
//                           controller: _phoneNumberController,
//                           decoration: InputDecoration(
//                             prefixIcon: Icon(Icons.phone),
//                             hintText: 'Enter your phone number',
//                             border: OutlineInputBorder(),
//                           ),
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return 'Please enter your phone number';
//                             }
//                             if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
//                               return 'Please enter a valid phone number';
//                             }
//                             return null;
//                           },
//                           keyboardType: TextInputType.phone,
//                         ),
//                         SizedBox(height: 20),
//                         TextFormField(
//                           controller: _emailController,
//                           decoration: InputDecoration(
//                             prefixIcon: Icon(Icons.email),
//                             hintText: 'Enter your email',
//                             border: OutlineInputBorder(),
//                           ),
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return 'Please enter your email';
//                             }
//                             if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
//                                 .hasMatch(value)) {
//                               return 'Please enter a valid email address';
//                             }
//                             return null;
//                           },
//                           keyboardType: TextInputType.emailAddress,
//                         ),
//                         SizedBox(height: 20),
//                         TextFormField(
//                           controller: _passwordController,
//                           decoration: InputDecoration(
//                             prefixIcon: Icon(Icons.password),
//                             hintText: 'Enter your password',
//                             border: OutlineInputBorder(),
//                           ),
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return 'Please enter your password';
//                             }
//                             if (value.length < 6) {
//                               return 'Password must be at least 6 characters long';
//                             }
//                             return null;
//                           },
//                           obscureText: true,
//                         ),
//                         SizedBox(height: 20),
//                         Row(
//                           children: [
//                             Text('Choose Your Role'),
//                             SizedBox(width: 10),
//                             Checkbox(
//                               value: isUser,
//                               onChanged: (value) {
//                                 setState(() {
//                                   isUser = value!;
//                                   if (value) {
//                                     isTherapist = false;
//                                   }
//                                 });
//                               },
//                             ),
//                             Text('User'),
//                             SizedBox(width: 5),
//                             Checkbox(
//                               value: isTherapist,
//                               onChanged: (value) {
//                                 setState(() {
//                                   isTherapist = value!;
//                                   if (value) {
//                                     isUser = false;
//                                   }
//                                 });
//                               },
//                             ),
//                             Text('Therapist'),
//                           ],
//                         ),
//                         SizedBox(height: 20),
//                         ElevatedButton(
//                           onPressed: handleRegistration,
//                           child: Text('Register'),
//                         ),
//                         SizedBox(height: 20),
//                         Padding(
//                           padding: const EdgeInsets.only(left: 60.0, right: 50),
//                           child: Row(
//                             children: [
//                               Text(
//                                 'If you have an account?',
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(fontSize: 16),
//                               ),
//                               SizedBox(width: 10),
//                               TextButton(
//                                 onPressed: () {
//                                   Navigator.pushNamed(context, '/login');
//                                 },
//                                 child: Text('Login'),
//                               )
//                             ],
//                           ),
//                         ),
//                         SizedBox(height: 20),
//                         OutlinedButton.icon(
//                           onPressed: () {
//                             // Implement sign up with Google logic here
//                             print('Sign up with Google');
//                           },
//                           icon: Icon(Icons.g_mobiledata),
//                           label: Text('Sign Up with Google'),
//                         ),
//                         SizedBox(height: 30),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
