import 'package:flutter/material.dart';
import 'package:revive/Models/chatgroup.dart';

class ChatRoomScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Room'),
        actions: [
          IconButton(
            onPressed: () {
              // Navigate to chat group details
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatGroupDetailsScreen(
                    groupName: 'Group Name',
                    numberOfMembers: 5,
                    members: ['Member 1', 'Member 2', 'Member 3', 'Member 4', 'Member 5'],
                  ),
                ),
              );
            },
            icon: Icon(Icons.info_outline),
          ),
        ],
      ),
      body: Center(
        child: Text('Chat Room Content'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add logic to upload images
        },
        child: Icon(Icons.image),
      ),
    );
  }
}
