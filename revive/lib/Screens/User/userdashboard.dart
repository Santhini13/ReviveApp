
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:revive/Screens/User/navbar.dart';

class UserDashboard extends StatefulWidget {
  @override
  _UserDashboardState createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  int _selectedIndex = 3;
  final List<DashboardItem> items = [];

  final List<Appointment> appointments = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight), // Increase the height of the app bar
        child: AppBar(
          title:Text('Your Dashboard',style:TextStyle(color:Colors.white),),
          backgroundColor: Colors.transparent, // Transparent background
          automaticallyImplyLeading: false, // Removes the back button
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff881736), Color(0xff281537)],
              ),
            ),))),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Progress',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return _buildDashboardItem(items[index]);
                },
                shrinkWrap: true,
               // physics: NeverScrollableScrollPhysics(),
              ),
            ),
            SizedBox(height: 40),
            Text(
              'Upcoming Appointments',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: appointments.length,
                itemBuilder: (context, index) {
                  return _buildAppointmentTile(context, appointments[index]);
                },
              ),
            ),
          ],
        ),
      ),
     bottomNavigationBar: NavBar(selectedIndex: _selectedIndex, userRole: UserRole.User,),
    );
  }

  Widget _buildDashboardItem(DashboardItem item) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            item.title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Stack(
            alignment: Alignment.center,
            children: [
              _buildCircularProgressIndicator(item.progress),
              Text(
                '${item.daysLeft}\nDays Left',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCircularProgressIndicator(double progress) {
    return SizedBox(
      width: 90,
      height: 90,
      child: CircularProgressIndicator(
        color:Color(0xff881736),
        value: progress,
        strokeWidth: 5,
      ),
    );
  }

  Widget _buildAppointmentTile(BuildContext context, Appointment appointment) {
    return GestureDetector(
      onTap: () {
        _showAppointmentDetails(context, appointment);
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: EdgeInsets.symmetric(vertical: 5.0),
        padding: EdgeInsets.all(10.0),
        child: ListTile(
          title: Text(
            appointment.therapistName,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            '${appointment.dateTime.day}/${appointment.dateTime.month}/${appointment.dateTime.year} ${appointment.dateTime.hour}:${appointment.dateTime.minute}',
            style: TextStyle(fontSize: 16),
          ),
          trailing: Text(
            '${appointment.duration.inHours}h ${appointment.duration.inMinutes.remainder(60)}m',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }

  void _showAppointmentDetails(BuildContext context, Appointment appointment) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          width:double.infinity,
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Therapist: ${appointment.therapistName}',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Date & Time: ${appointment.dateTime}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'Duration: ${appointment.duration.inHours}h ${appointment.duration.inMinutes}m',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              if (appointment.sessionOngoing)
                ElevatedButton(
                  onPressed: () {
                    // Action when Join Now button is pressed
                  },
                  child: Text('Join Now',style: TextStyle(color:Colors.white),),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color(0xff881736),),
                  ),
                )
              else
                ElevatedButton(
                  onPressed: null,
                  child: Text('Join Now',style: TextStyle(color: Colors.black),),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.grey),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}


class DashboardItem {
  final String title;
  final double progress;
  final int daysLeft;

  DashboardItem({required this.title, required this.progress, required this.daysLeft, required int markedDayCompleted});
}

class Appointment {
  final DateTime dateTime;
  final String therapistName;
  final Duration duration;
  final bool sessionOngoing;

  Appointment({required this.dateTime, required this.therapistName, required this.duration, required this.sessionOngoing});
}


