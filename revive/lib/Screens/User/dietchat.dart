import 'dart:math';

import 'package:flutter/material.dart';
class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Message> _messages = [];

  void _sendMessage(String message) {
    setState(() {
      // Add user message to chat
      _messages.add(Message(text: message, isUser: true));

      // Get bot response based on food item
      String botResponse = _getBotResponse(message);

      // Add bot response to chat
      _messages.add(Message(text: botResponse, isUser: false));

      // Clear text field
      _controller.clear();
    });
  }

  String _getBotResponse(String foodItem) {
    // List of healthy food items
    List<String> healthyFoods = ['banana', 'spinach', 'quinoa', 'grilled chicken', 'kale', 'avocado', 'sweet potato'];

    // Check if the food item is in the list of healthy foods
    if (healthyFoods.contains(foodItem.toLowerCase())) {
      return 'Yes, $foodItem is healthy!';
    } else {
      return ' $foodItem is not healthy.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Healthy Meal Bot',style: TextStyle(color:Color(0xff881736)),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                    child: Align(
                      alignment: _messages[index].isUser ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: _messages[index].isUser ? Color(0xff281537):Color(0xff881736),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Text(
                          _messages[index].text,
                          style: TextStyle(
                            color: _messages[index].isUser ? Colors.white : Colors.white,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      onSubmitted: (String value) {
                        if (value.isNotEmpty) {
                          _sendMessage(value);
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Type a food item...',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (_controller.text.isNotEmpty) {
                        _sendMessage(_controller.text);
                      }
                    },
                    icon: Icon(Icons.send,color:Color(0xff881736)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Message {
  final String text;
  final bool isUser;

  Message({required this.text, required this.isUser});
}
// class ChatScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Healthy Meal'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView(
//               padding: EdgeInsets.all(8.0),
//               children: [
//                 // List of chat messages
//                 ChatMessage(text: 'Hello', isMe: false),
//                 ChatMessage(text: 'Hi there!', isMe: true),
//                 // Add more chat messages here
//               ],
//             ),
//           ),
//           _buildInputField(),
//         ],
//       ),
//     );
//   }

//   Widget _buildInputField() {
//     return Padding(
//       padding: EdgeInsets.only(left:10.0,right: 10,bottom:20),
//       child: Row(
//         children: [
//           Expanded(
//             child: TextField(
//               decoration: InputDecoration(
//                 hintText: 'Type a message...',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//           ),
//           IconButton(
//             onPressed: () {
//               // Send message functionality
//             },
//             icon: Icon(Icons.send),
//           ),
//         ],
//       ),
//     );
//   }
// }

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isMe;

  const ChatMessage({required this.text, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: isMe ? Colors.blue : Colors.grey[300],
              borderRadius: BorderRadius.circular(10.0),
            ),
            padding: EdgeInsets.all(10.0),
            child: Text(
              text,
              style: TextStyle(
                color: isMe ? Colors.white : Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}