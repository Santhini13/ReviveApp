
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; 
import 'package:revive/Models/videoModal.dart';
import 'package:revive/Screens/constants/myAppbar.dart';
import 'package:revive/Services/authprovider.dart';
import 'package:revive/Services/videoService.dart';

class UploadVideoPage extends StatefulWidget {
  @override
  _UploadVideoPageState createState() => _UploadVideoPageState();
}

class _UploadVideoPageState extends State<UploadVideoPage> {
  final TextEditingController _urlController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final VideoService _videoService = VideoService();
  Future<void> _uploadVideo() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
      String uid = authProvider.uid!;
    if (_urlController.text.isNotEmpty && _titleController.text.isNotEmpty) {
      VideoModel video = VideoModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        title: _titleController.text,
        url: _urlController.text, 
        //userId:uid,
      );
      await _videoService.saveVideoData(uid,video);
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Video Uploaded'),backgroundColor: Color(0xff881736),));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please enter a title and a YouTube link.'),backgroundColor: Color(0xff881736)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Upload Video'),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
            children: [        
              TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Video Title', border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0), // Adjust the border radius
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff281537), width: 1.0), // Border color when TextField is not focused
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color:Color(0xff881736), width: 2.0), // Border color when TextField is focused
              ),
            ),
                
              ),
              SizedBox(height: 10),
              TextField(
                controller: _urlController,
                decoration: InputDecoration(labelText: 'YouTube Link', border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0), // Adjust the border radius
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff281537), width: 1.0), // Border color when TextField is not focused
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color:Color(0xff881736), width: 2.0), // Border color when TextField is focused
              ),
            ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _uploadVideo,
                child: Text('Upload Video'),
              ),
               SizedBox(height: 10),
               Text('To Delete your video visit more on dashboard long press on item',style: TextStyle(color:Colors.grey,fontSize: 8),),
            ],
          ),
        ),
      ),
    );
  }
}

