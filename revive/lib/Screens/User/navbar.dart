// import 'package:flutter/material.dart';

// class navBar extends StatelessWidget {
//   const navBar({
//     super.key,
//     required int selectedIndex,
//   }) : _selectedIndex = selectedIndex;

//   final int _selectedIndex;

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//        type: BottomNavigationBarType.fixed,
//       items: const <BottomNavigationBarItem>[
//         BottomNavigationBarItem(
//           icon: Icon(Icons.home),
//           label: 'Home',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.people),
//           label: 'Therapist',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.explore),
//           label: 'Explore',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.dashboard),
//           label: 'DashBoard',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.person),
//           label: 'Profile',
//         ),
//       ],
//       currentIndex: _selectedIndex,
//       selectedItemColor:Color(0xff881736),
//       unselectedItemColor: Colors.grey,
//       // onTap: _onItemTapped,
//       onTap: (int index) {
//         if (index == 0) {
//           // Navigate to the home screen
//           Navigator.pushNamed(context, '/home');
//         } else if (index == 1) {
//           // Navigate to the settings screen
//           Navigator.pushNamed(context, '/therapist');
//         }
//         else if (index == 2) {
//           // Navigate to the settings screen
//           Navigator.pushNamed(context, '/explore');
//         }else if (index == 3) {
//           // Navigate to the settings screen
//           Navigator.pushNamed(context, '/userdash');
//         }

//         else{
//           Navigator.pushNamed(context, '/uprofile');
//         }
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';

enum UserRole { User, Therapist, Admin }

class NavBar extends StatelessWidget {
  const NavBar({
    Key? key,
    required this.selectedIndex,
    required this.userRole,
  }) : super(key: key);

  final int selectedIndex;
  final UserRole userRole;

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> items = [];

    if (userRole == UserRole.User) {
      items = <BottomNavigationBarItem>[
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
      ];
    } else if (userRole == UserRole.Therapist) {
      items = <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.explore),
          label: 'Explore',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ];
    } else if (userRole == UserRole.Admin) {
      items = <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.explore),
          label: 'Explore',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard),
          label: 'Dashboard',
        ),
      ];
    }

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: items,
      currentIndex: selectedIndex,
      selectedItemColor: Color(0xff881736),
      unselectedItemColor: Colors.grey,
      onTap: (int index) {
        if (userRole == UserRole.User) {
          if (index == 0) {
            Navigator.pushNamed(context, '/home');
          } else if (index == 1) {
            Navigator.pushNamed(context, '/therapist');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/explore');
          }
           else if (index == 3) {
            Navigator.pushNamed(context, '/userdash');
           } else if (index == 4) {
            Navigator.pushNamed(context, '/uprofile');
          }
        } else if (userRole == UserRole.Therapist) {
          if (index == 0) {
            Navigator.pushNamed(context, '/home');
          } else if (index == 1) {
            Navigator.pushNamed(context, '/explore');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/thdash');
          }
          else if (index == 3) {
            Navigator.pushNamed(context, '/thprofile');
          }
        } else if (userRole == UserRole.Admin) {
          if (index == 0) {
            Navigator.pushNamed(context, '/home');
          } else if (index == 1) {
            Navigator.pushNamed(context, '/therapist');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/explore');
          }
           else if (index == 3) {
            Navigator.pushNamed(context, '/addash');
           } else if (index == 4) {
            Navigator.pushNamed(context, '/uprofile');
          }
        }
      },
    );
  }
}

