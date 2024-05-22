import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class VideoUploadScreen extends StatefulWidget {
  @override
  _VideoUploadScreenState createState() => _VideoUploadScreenState();
}

class _VideoUploadScreenState extends State<VideoUploadScreen> {
  final ImagePicker _picker = ImagePicker();
  XFile? _video;
  String? _uploadStatus;

  Future<void> _pickVideo() async {
    final XFile? pickedFile = await _picker.pickVideo(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        _video = pickedFile;
      });
    }
  }

  Future<void> _uploadVideo() async {
    if (_video != null) {
      try {
        final File file = File(_video!.path);
        final FirebaseStorage storage = FirebaseStorage.instance;
        final Reference ref = storage.ref().child('videos/${_video!.name}');
        final UploadTask uploadTask = ref.putFile(file);

        final TaskSnapshot snapshot = await uploadTask;
        final String downloadURL = await snapshot.ref.getDownloadURL();

        setState(() {
          _uploadStatus = 'Upload successful: $downloadURL';
          print('-------------------');
        });
      } catch (e) {
        setState(() {
          _uploadStatus = 'Upload failed: $e';
          print('upload failed');
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Video'),
      ),
      body: Center(
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_video != null) Text('Video selected: ${_video!.name}'),
            ElevatedButton(
              onPressed: _pickVideo,
              child: Text('Select Video'),
            ),
            if (_video != null)
              ElevatedButton(
                onPressed: _uploadVideo,
                child: Text('Upload Video'),
              ),
            if (_uploadStatus != null) Text(_uploadStatus!),
          ],
        ),
      ),
    );
  }
}
