import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
   bool _isPasswordVisible = false;
  final FirebaseService _firebaseService=FirebaseService();

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
        role: role, uid: '',

      );
      try{

        await _firebaseService.registerUser(user);
        Navigator.pushNamed(context,'/login');
        //handleLogin();
      } 
      catch(e){
        print('Error user: $e');
        showErrorMessage('email is already in use');
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
                      obscureText: !_isPasswordVisible,
                      controller: _passwordController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.password),
                        hintText: 'Enter your password',
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
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
                    SizedBox(height: 20),
                    AppButton(
                      onTap: () {
                        _register();
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
                            width: 5,
                          ),
                          TextButton(
                                onPressed: () {
                                  Navigator.pushReplacementNamed(context, '/login');
                                },
                                child: Text('Login'),
                              )
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    // OutlinedButton.icon(
                    //   onPressed: () {
                    //     // Implement sign up with Google logic here
                    //     print('Sign up with Google');
                    //   },
                    //   icon: Icon(Icons.g_mobiledata),
                    //   label: Text('Sign Up with Google'),
                    // ),
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


