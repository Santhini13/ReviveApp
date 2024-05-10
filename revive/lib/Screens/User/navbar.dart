import 'package:flutter/material.dart';

class navBar extends StatelessWidget {
  const navBar({
    super.key,
    required int selectedIndex,
  }) : _selectedIndex = selectedIndex;

  final int _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
       type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          label: 'Therapist',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.explore),
          label: 'Explore',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard),
          label: 'DashBoard',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor:Color(0xff881736),
      unselectedItemColor: Colors.grey,
      // onTap: _onItemTapped,
      onTap: (int index) {
        if (index == 0) {
          // Navigate to the home screen
          Navigator.pushNamed(context, '/home');
        } else if (index == 1) {
          // Navigate to the settings screen
          Navigator.pushNamed(context, '/therapist');
        }
        else if (index == 2) {
          // Navigate to the settings screen
          Navigator.pushNamed(context, '/explore');
        }else if (index == 3) {
          // Navigate to the settings screen
          Navigator.pushNamed(context, '/userdash');
        }

        else{
          Navigator.pushNamed(context, '/uprofile');
        }
      },
    );
  }
}
