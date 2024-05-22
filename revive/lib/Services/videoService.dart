import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class VideoUploadService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> uploadVideo(File videoFile, String fileName) async {
    try {
      final Reference ref = _storage.ref().child('videos/$fileName');
      final UploadTask uploadTask = ref.putFile(videoFile);

      final TaskSnapshot snapshot = await uploadTask;
      final String downloadURL = await snapshot.ref.getDownloadURL();
      
      return downloadURL;
    } catch (e) {
      print('Error uploading video: $e');
      throw Exception('Failed to upload video');
    }
  }
}
