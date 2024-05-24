import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:revive/Models/therapistModal.dart';

class TherapistService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Fetch therapist information by user ID
  Future<Therapist?> fetchTherapistInfo(String? uid) async {
    try {
      DocumentSnapshot doc = await _firestore.collection('users').doc(uid).get();
      if (doc.exists) {
        DocumentSnapshot doc2= await _firestore.collection('therapist').doc(uid).get();

        return Therapist.fromFirestore(doc2);
      } else {
        return null;
      }
    } catch (e) {
      print('Error fetching therapist info: $e');
      throw e;
    }
  }

  Future<QuerySnapshot<Map<String, dynamic>>> fetchallTherapistinfo() async{
    try{
       QuerySnapshot<Map<String, dynamic>> doc = await _firestore.collection('therapist').get();
       return doc;


    }catch(e){
      print('Error fetching therapist info: $e');
      throw e;

    }
  }

  // Add or update therapist information
  Future<void> addOrUpdateTherapistInfo(String? uid, Therapist therapist) async {
    try {
      await _firestore.collection('therapist').doc(uid).set(therapist.toMap(), SetOptions(merge: true));
    } catch (e) {
      print('Error adding or updating therapist info: $e');
      throw e;
    }
  }

  // Update specific fields of therapist information
  Future<void> updateTherapistField(String? uid, Map<String, dynamic> fields) async {
    try {
      await _firestore.collection('users').doc(uid).update(fields);
    } catch (e) {
      print('Error updating therapist fields: $e');
      throw e;
    }
  }
}


