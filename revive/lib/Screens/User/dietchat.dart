import 'dart:math';

import 'package:flutter/material.dart';
import 'package:revive/Screens/constants/myAppbar.dart';

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
  List<String> vegetables = ['spinach', 'kale', 'broccoli', 'carrots', 'bell peppers', 'cucumbers'];
  List<String> fruits = ['apple', 'banana', 'orange', 'strawberries', 'blueberries', 'kiwi'];
  List<String> noSugarFoods = ['berries', 'nuts', 'seeds', 'avocado', 'dark chocolate', 'greek yogurt'];
  List<String> noOilFoods = ['grilled chicken', 'baked fish', 'steamed vegetables', 'salad', 'quinoa', 'tofu'];
  List<String> sugarFoods = ['candy', 'soda', 'cookies', 'cake', 'ice cream', 'sweetened beverages'];
  List<String> oilFoods = ['fried chicken', 'fried fish', 'fried potatoes', 'fried snacks', 'fast food', 'deep-fried foods'];

  // Trim any leading or trailing whitespace from the food item
  foodItem = foodItem.trim().toLowerCase();

  if (vegetables.contains(foodItem)) {
    return '$foodItem is a vegetable, which is a healthy choice.';
  } else if (fruits.contains(foodItem)) {
    return '$foodItem is a fruit, which is a healthy choice.';
  } else if (noSugarFoods.contains(foodItem)) {
    return '$foodItem is a no-sugar food, which is a healthy choice.';
  } else if (noOilFoods.contains(foodItem)) {
    return '$foodItem is a no-oil food, which is a healthy choice.';
  } else if (sugarFoods.contains(foodItem)) {
    return '$foodItem is a sugary food, which is not considered healthy.';
  } else if (oilFoods.contains(foodItem)) {
    return '$foodItem is an oily food, which is not considered healthy.';
  } else {
    return '$foodItem may not be a part of a healthy meal.';
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:MyAppBar(title: 'Healthy Meal Bot'),
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
                          color: _messages[index].isUser ? Color(0xff281537) : Color(0xff881736),
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
                    icon: Icon(Icons.send, color: Color(0xff881736)),
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
