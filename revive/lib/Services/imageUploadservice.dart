// import 'dart:io';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

// class ImageUploadService {
//   final firebase_storage.FirebaseStorage _storage =
//       firebase_storage.FirebaseStorage.instance;

//   Future<String?> uploadImage(File imageFile) async {
//     try {
//       final task = await _storage
//           .ref('images/${DateTime.now().millisecondsSinceEpoch}.png')
//           .putFile(imageFile);
//       final imageUrl = await task.ref.getDownloadURL();
//       return imageUrl;
//     } catch (e) {
//       print('Error uploading image: $e');
//       return null;
//     }
//   }
// }
