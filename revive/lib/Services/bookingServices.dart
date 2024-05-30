import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:revive/Models/bookingModal.dart';
import 'package:revive/Models/therapistModal.dart';

class BookingService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> registerBooking(String? uid, Booking booking) async {
  try {
    // Check if the therapistId exists in the 'therapist' collection
    var therapistDoc = await _firestore.collection('therapist').doc(booking.therapistId).get();
    
    if (!therapistDoc.exists) {
      throw Exception('Therapist ID does not exist');
    }

    // Register booking under the user's collection
    await _firestore.collection('Booking').doc(uid).collection('booking').add({
      'userName': booking.userName,
      'therapistName': booking.therapistName,
      'userId': booking.userId,
      'therapistId': booking.therapistId,
      'status': booking.status,
      'id': booking.id,
      'appointmentType': booking.appointmentType,
      'timeSlot': booking.timeSlot,
      'day': booking.day,  // Ensure that the date is properly passed as DateTime
    });

    // Register booking under the therapist's collection
    await _firestore.collection('therapist').doc(booking.therapistId).collection('bookings').doc().set({
      'userName': booking.userName,
      'therapistName': booking.therapistName,
      'userId': booking.userId,
      'therapistId': booking.therapistId,
      'status': booking.status,
      'id': booking.id,
      'appointmentType': booking.appointmentType,
      'timeSlot': booking.timeSlot,
      'day': booking.day,
      'timestamp': DateTime.now(),
    });

    print('Registration Successful');
  } catch (e) {
    print('Error registering booking: $e');
    throw e;
  }
}


  // Future<void> registerBooking(String? uid, Booking booking) async {
  //   try {
  //     await _firestore.collection('Booking').doc(uid).collection('booking').add({
  //       'userName':booking.userName,
  //       'therapistName':booking.therapistName,
  //       'userId':booking.userId,
  //       'therapistId':booking.therapistId,
  //       'status':booking.status,
  //       'id': booking.id,
  //       'appointmentType':booking.appointmentType, 
  //       'timeSlot': booking.timeSlot,
  //       'day':booking.day,  // Ensure that the date is properly passed as DateTime
  //     });
  
  //     print('registartion Successful');
  //   } catch (e) {
  //     print('Error registering booking: $e');
  //     throw e;
  //   }
  // }

  Future<String?> fetchTherapistName(String? uid) async {
    try {
      DocumentSnapshot doc = await _firestore.collection('users').doc(uid).get();
      if (doc.exists) {
        DocumentSnapshot doc2 = await _firestore.collection('therapists').doc(uid).get();
        if (doc2.exists) {
          Therapist therapist = Therapist.fromFirestore(doc2);
          return therapist.name;
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      print('Error fetching therapist info: $e');
      throw e;
    }
  }

  Stream<List<Booking>> fetchAllBookings() {
    return _firestore.collectionGroup('booking').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Booking.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }

  Future<List<Booking>> fetchMyBooking(String? uid) async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('Booking').doc(uid).collection('booking').get();

      if (querySnapshot.docs.isEmpty) {
        print('No booking found.');
        return [];
      } else {
        
        List<Booking> bookings = querySnapshot.docs.map((doc) {
          print('Document data: ${doc.data()}');
          return Booking(
            userName:doc['userName'],
            therapistName: doc['therapistName'],
            id: doc['id'],
            appointmentType: doc['appointmentType'],
            timeSlot: doc['timeSlot'],
           // date: (doc['date'] as Timestamp).toDate(), 
            userId: doc['userId'], 
            therapistId: doc['therapistId'], 
            day: (doc['day']as Timestamp).toDate() ,
            status: 1,
            
          );
        }).toList();
        print('Fetched ${bookings.length} bookings.');
        return bookings;
      }
    } catch (e) {
      print('Error fetching bookings: $e');
      throw e;
    }
  }
  Future<List<Booking>> fetchBookingsForTherapist(String therapistId) async {
  try {
    QuerySnapshot querySnapshot = await _firestore
        .collectionGroup('booking')
        .where('therapistId', isEqualTo: therapistId)
        .get();

    List<Booking> bookings = querySnapshot.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return Booking(
        userId: data['userId'],
        therapistId: data['therapistId'],
        status: data['status'],
        id: data['id'],
        appointmentType: data['appointmentType'],
        timeSlot: data['timeSlot'], 
        day:data['day'], therapistName: data['therapistName'],
        userName: data['userName'] 
       // date: data['date'],
      );
    }).toList();

    return bookings;
  } catch (e) {
    print('Error fetching bookings for therapist: $e');
    throw e;
  }
}
   Future<void> deleteBooking(String? uid, String bookingId) async {
    try {
      await _firestore.collection('Booking').doc(uid).collection('booking').doc(bookingId).delete();
      print('Booking deleted successfully');
    } catch (e) {
      print('Error deleting booking: $e');
      throw e;
    }
  }
}

// class BookingService {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Future<void> registerBooking(String? uid,Booking booking) async {
//     try {
//       await _firestore.collection('Booking').doc(uid).collection('booking').add({
        // 'userId':booking.userId,
        // 'therapistId':booking.therapistId,
        // 'status':booking.status,
        // 'id': booking.id,
        // 'appointmentType':booking.appointmentType,
        // 'timeSlot': booking.timeSlot,
        // 'day':booking.day,
//         'date': DateTime.now(),
//       });
//     } catch (e) {
//       print('Error registering booking: $e');
//       throw e;
//     }
//   }


//   Future<List<Booking>> fetchBookingsForUser(String userId) async {
//   try {
//     QuerySnapshot querySnapshot = await _firestore
//         .collectionGroup('Booking')
//         .where('userId', isEqualTo: userId)
//         .get();

//     List<Booking> bookings = querySnapshot.docs.map((doc) {
//       Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
//       return Booking(
//         userId: data['userId'],
//         therapistId: data['therapistId'],
//         status: data['status'],
//         id: data['id'],
//         appointmentType: data['appointmentType'],
//         timeSlot: data['timeSlot'], 
//         day: data['day'],
//       );
//     }).toList();

//     return bookings;
//   } catch (e) {
//     print('Error fetching bookings for user: $e');
//     throw e;
//   }
// }





  //  Future<String?> fetchTherapistName(String? uid) async {
  //   try {
  //     DocumentSnapshot doc = await _firestore.collection('users').doc(uid).get();
  //     if (doc.exists) {
  //       DocumentSnapshot doc2 = await _firestore.collection('therapists').doc(uid).get();
  //       if (doc2.exists) {
  //         Therapist therapist = Therapist.fromFirestore(doc2);
  //         return therapist.name;
  //       } else {
  //         return null;
  //       }
  //     } else {
  //       return null;
  //     }
  //   } catch (e) {
  //     print('Error fetching therapist info: $e');
  //     throw e;
  //   }
  // }


  //  Stream<List<Article>> fetchAllBookings() {
  //   return _firestore.collectionGroup('booking').snapshots().map((snapshot) {
  //     return snapshot.docs.map((doc) {
  //       return Article.fromMap(doc.data() as Map<String, dynamic>);
  //     }).toList();
  //   });
  // }

  //    Future<List<Booking>> fetchMyBooking(String? uid) async {
  //   try {
  //     QuerySnapshot querySnapshot = await _firestore
  //         .collection('Booking').doc(uid).collection('booking').get();

  //     if (querySnapshot.docs.isEmpty) {
  //       print('No booking found.');
  //       return [];
  //     } else {
  //       List<Booking> bookings = querySnapshot.docs.map((doc) {
  //         print('Document data: ${doc.data()}');
  //         return Booking(
  //           userId: doc['userId'],
  //           therapistId: doc['therapistId'],
  //           id: doc['id'],
  //           appointmentType: doc['appointmentType'],
  //           timeSlot: doc['timeSlot'],
  //           date: doc['date'], 
  //           status:doc['status']
  //         );
  //       }).toList();
  //       print('Fetched ${bookings.length} articles.');
  //       return bookings;
  //     }
  //   } catch (e) {
  //     print('Error fetching Articles: $e');
  //     throw e;
  //   }
  // }

//}


