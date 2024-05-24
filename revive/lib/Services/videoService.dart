import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:revive/Models/videoModal.dart';

class VideoService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveVideoData(String uid,VideoModel video) async {
    await _firestore.collection('users').doc(uid).collection('videos').doc(video.id).set(video.toMap());
  }

   Stream<List<VideoModel>> getVideos(String uid) {
    return _firestore.collection('users').doc(uid).collection('videos').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => VideoModel.fromMap(doc.data())).toList();
    });
  }

    Stream<List<VideoModel>> getAllVideos() {
    return _firestore.collectionGroup('videos').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => VideoModel.fromMap(doc.data())).toList();
    });
  }

  
  Future<void> deleteVideo(VideoModel video, String uid) async {
    try {
      await _firestore
          .collection('users')
          .doc(uid)
          .collection('videos')
          .doc(video.id)
          .delete();
    } catch (e) {
      throw Exception('Error deleting video: $e');
    }
  }
}

