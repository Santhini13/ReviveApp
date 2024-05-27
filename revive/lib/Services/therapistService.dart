import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:revive/Models/bookingModal.dart';
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
Future<String?> fetchTherapistUid(String uid) async {
    try {
      DocumentSnapshot doc = await _firestore.collection('therapists').doc(uid).get();
      if (doc.exists) {
        return doc.id;
      } else {
        return null;
      }
    } catch (e) {
      print('Error fetching therapist UID: $e');
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


    // Add a booking for a therapist
  Future<void> addBooking(String uid, Booking booking) async {
    try {
      await _firestore.collection('therapist').doc(uid).collection('bookings').add(booking.toMap());
    } catch (e) {
      print('Error adding booking: $e');
      throw e;
    }
  }

  // Fetch all bookings for a therapist
  // Future<List<Booking>> fetchBookings(String therapistId) async {
  //   try {
  //     QuerySnapshot querySnapshot = await _firestore.collection('therapist').doc(therapistId).collection('bookings').get();
  //     return querySnapshot.docs.map((doc) => Booking.fromFirestore(doc)).toList();
  //   } catch (e) {
  //     print('Error fetching bookings: $e');
  //     throw e;
  //   }
  // }

  // // Update a specific booking
  // Future<void> updateBooking(String therapistId, String bookingId, Map<String, dynamic> fields) async {
  //   try {
  //     await _firestore.collection('therapist').doc(therapistId).collection('bookings').doc(bookingId).update(fields);
  //   } catch (e) {
  //     print('Error updating booking: $e');
  //     throw e;
  //   }
  // }
}


