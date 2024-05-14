import 'package:flutter/material.dart';
import 'package:revive/Screens/Admin/viewtherapist.dart';

class AdHome extends StatefulWidget {
  @override
  _AdHomeState createState() => _AdHomeState();
}

class _AdHomeState extends State<AdHome> {
  String _selectedOption = '';

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff881736), Color(0xff281537)],
              ),
            ),
            width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(top :50.0),
          child: Column(
            children: [ 
              Padding(
                padding: const EdgeInsets.only(left:25.0,right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Admin', style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
                    IconButton(
                icon: Icon(Icons.settings,color: Colors.white,),
                onPressed: () {
                  _showSettingsDialog(context);
                },
                            ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildOptionCard('Users'),
                  SizedBox(width: 10),
                  _buildOptionCard('Therapists'),
                  SizedBox(width: 10),
                  _buildOptionCard('Activities'),
                ],
              ),
              SizedBox(height: 20),
              if (_selectedOption.isNotEmpty) _buildSelectedCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionCard(String option) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedOption = option;
        });
      },
      child: Card(
        color: _selectedOption == option ? Color(0xff881736): null,
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Text(
            option,
            style: TextStyle(
              fontSize: 16,
              color: _selectedOption == option ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSelectedCard() {
    switch (_selectedOption) {
      case 'Users':
        return _buildUserCard();
      case 'Therapists':
        return _buildTherapistCard();
      case 'Activities':
        return _buildActivityCard();
      default:
        return Container();
    }
  }

  Widget _buildUserCard() {
    return CardItem(
      text: 'View Users',
      onTap: () {
        // Add logic for viewing users
        Navigator.pushNamed(context, '/viewuser');
      },
    );
  }

  Widget _buildTherapistCard() {
    return Column(
      children: [
        CardItem(
          text: 'Confirm Request',
          onTap: () {
            Navigator.pushNamed(context, '/adconfirm');
          },
        ),
        CardItem(
          text: 'View Therapists',
          onTap: () {
             Navigator.pushNamed(context, '/adtherapist');
          },
        ),
      ],
    );
  }

  Widget _buildActivityCard() {
    return Column(
      children: [
        CardItem(
          text: 'View Articles',
          onTap: () {
            // Add logic for viewing articles
            Navigator.pushNamed(context, '/adarticle');
          },
        ),
        CardItem(
          text: 'View Feedback',
          onTap: () {
            // Add logic for viewing feedback
             Navigator.pushNamed(context, '/adfeedback');
          },
        ),
        CardItem(
          text: 'View Payment',
          onTap: () {
            // Add logic for updating questionnaire
            Navigator.pushNamed(context, '/viewPayment');
          },
        ),
      ],
    );
  }

  void _showSettingsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: [
              CircleAvatar(
                child: Icon(Icons.person),
              ),
              SizedBox(width: 10),
              Text('Admin'),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: Icon(Icons.lock),
                title: Text('Change Password'),
                onTap: () {
                  Navigator.pop(context);
                  _showChangePasswordDialog(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout'),
                onTap: () {
                  Navigator.pop(context);
                  _performLogout(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showChangePasswordDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Change Password'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Old Password'),
                obscureText: true,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'New Password'),
                obscureText: true,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Confirm Password'),
                obscureText: true,
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _performPasswordChange(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _performPasswordChange(BuildContext context) {
    // Perform password change logic here
    // Example: Call an API to update the password
    // Once the password is successfully changed, show a message to the user
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Password changed successfully!'),
    ));
  }

  void _performLogout(BuildContext context) {
    // Perform logout logic here
    // Example: Navigate to the login screen or clear user session
    // After logout, you might want to navigate back to the login screen
    Navigator.pushReplacementNamed(context, '/login');
  }
}

class CardItem extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const CardItem({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        child: ListTile(
          title: Text(text),
          onTap: onTap,
        ),
      ),
    );
  }
}


