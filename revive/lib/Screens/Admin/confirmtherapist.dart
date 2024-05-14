import 'package:flutter/material.dart';
import 'package:revive/constants/myAppbar.dart';

class ConfirmRequestScreen extends StatefulWidget {
  @override
  _ConfirmRequestScreenState createState() => _ConfirmRequestScreenState();
}

class _ConfirmRequestScreenState extends State<ConfirmRequestScreen> {
  final List<String> confirmRequests = [
    'Request 1',
    'Request 2',
    'Request 3',
  ];

  final List<String> acceptedRequests = [];

  void _acceptRequest(String request) {
    setState(() {
      acceptedRequests.add(request);
      confirmRequests.remove(request);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Request "$request" accepted'),
      ),
    );
  }

  void _rejectRequest(String request) {
    setState(() {
      confirmRequests.remove(request);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Request "$request" rejected'),
      ),
    );
  }

 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Confirm Request'), 
      body: ListView(
        children: [
          _buildConfirmRequestsList(),
        ],
      ),
    );
  }


  Widget _buildConfirmRequestsList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: confirmRequests.length,
      itemBuilder: (context, index) {
        final request = confirmRequests[index];
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListTile(
            title: Text(request),
            onTap: () {
              _showTherapistDetailsDialog(request);
            },
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _acceptRequest(request);
                  },
                  child: Text('Accept'),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    _rejectRequest(request);
                  },
                  child: Text('Reject'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showTherapistDetailsDialog(String request) {
    // Fetch therapist details based on the request and display them in a dialog
    // Here you can use the request to identify the therapist details to display
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // Replace the content with actual therapist details
        return AlertDialog(
          title: Text('Therapist Details'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Therapist Name: Example Name'),
              Text('Therapist Email: example@example.com'),
              // Add more therapist details here
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
