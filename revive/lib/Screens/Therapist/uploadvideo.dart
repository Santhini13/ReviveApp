
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; 
import 'package:revive/Models/videoModal.dart';
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
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Video Uploaded')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please enter a title and a YouTube link.')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Upload Video')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Video Title'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _urlController,
              decoration: InputDecoration(labelText: 'YouTube Link'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _uploadVideo,
              child: Text('Upload Video'),
            ),
          ],
        ),
      ),
    );
  }
}

