import 'package:flutter/material.dart';

class ChatGroupDetailsScreen extends StatelessWidget {
  final String groupName;
  final int numberOfMembers;
  final List<String> members;

  ChatGroupDetailsScreen({
    required this.groupName,
    required this.numberOfMembers,
    required this.members,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Group Details'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(groupName),
            subtitle: Text('Members: $numberOfMembers'),
          ),
          Divider(),
          Text(
            'Members:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: members.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(members[index]),
                );
              },
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Add logic to join the group
              },
              child: Text('Join Group'),
            ),
          ),
        ],
      ),
    );
  }
}