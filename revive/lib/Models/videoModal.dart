import 'dart:io';

class VideoModel {
  final String title;
  final String description;
  final File videoFile; // or String filePath
  // Additional properties as needed
  
  VideoModel({
    required this.title,
    required this.description,
    required this.videoFile,
    // Additional constructor parameters as needed
  });
}
