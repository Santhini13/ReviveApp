// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:revive/Models/bookingModal.dart';
// import 'package:revive/Models/therapistModal.dart';

// class BookingService {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;



//   Future<bool> checkSlotAvailability(String therapistId, DateTime selectedDate, String selectedTimeSlot) async {
//     try {
//       // Query the bookings collection to check if the selected slot is already booked
//       QuerySnapshot querySnapshot = await FirebaseFirestore.instance
//           .collection('therapist')
//           .where('therapistId', isEqualTo: therapistId)
//           .where('day', isEqualTo: selectedDate)
//           .where('timeSlot', isEqualTo: selectedTimeSlot)
//           .get();

//       // If no documents are returned, the slot is available; otherwise, it's booked
//       return querySnapshot.docs.isEmpty;
//     } catch (e) {
//       // Handle any errors that occur during the query
//       print('Error checking slot availability: $e');
//       throw e;
//     }
//   }
//   Future<void> registerBooking(String? uid, Booking booking) async {
//   try {
//     // Check if the therapistId exists in the 'therapist' collection
//     var therapistDoc = await _firestore.collection('therapist').doc(booking.therapistId).get();
    
//     if (!therapistDoc.exists) {
//       throw Exception('Therapist ID does not exist');
//     }
// String bookingId = _firestore.collection('Booking').doc().id;
//     // Register booking under the user's collection
//     await _firestore.collection('Booking').doc(uid).collection('booking').doc(bookingId).set({
//       'userName': booking.userName,
//       'therapistName': booking.therapistName,
//       'userId': booking.userId,
//       'therapistId': booking.therapistId,
//       'status': booking.status,
//       'id': bookingId,
//       'appointmentType': booking.appointmentType,
//       'timeSlot': booking.timeSlot,
//       'day': booking.day,  // Ensure that the date is properly passed as DateTime
//     });

//     // Register booking under the therapist's collection
//     await _firestore.collection('therapist').doc(booking.therapistId).collection('bookings').doc(bookingId).set({
//       'userName': booking.userName,
//       'therapistName': booking.therapistName,
//       'userId': booking.userId,
//       'therapistId': booking.therapistId,
//       'status': booking.status,
//       'id': bookingId,
//       'appointmentType': booking.appointmentType,
//       'timeSlot': booking.timeSlot,
//       'day': booking.day,
//       'timestamp': DateTime.now(),
//     });

//     print('Registration Successful');
//   } catch (e) {
//     print('Error registering booking: $e');
//     throw e;
//   }
// }

// Future<bool> _checkAvailability(String therapistId, DateTime date, String timeSlot) async {
//   try {
//     // Query Firestore to check if there are any bookings for the selected therapist, date, and time slot
//     QuerySnapshot bookingsSnapshot = await FirebaseFirestore.instance
//         .collection('bookings')
//         .where('therapistId', isEqualTo: therapistId)
//         .where('day', isEqualTo: date)
//         .where('timeSlot', isEqualTo: timeSlot)
//         .get();

//     // Log the number of documents returned by the query for debugging
//     print('Number of bookings for $therapistId on $date at $timeSlot: ${bookingsSnapshot.docs.length}');

//     // If there are no existing bookings, the slot is available
//     return bookingsSnapshot.docs.isEmpty;
//   } catch (e) {
//     // Log any errors that occur during the query for debugging
//     print('Error checking availability: $e');
//     // Assume slot is not available in case of any errors
//     return false;
//   }
// }

//   Future<String?> fetchTherapistName(String? uid) async {
//     try {
//       DocumentSnapshot doc = await _firestore.collection('users').doc(uid).get();
//       if (doc.exists) {
//         DocumentSnapshot doc2 = await _firestore.collection('therapists').doc(uid).get();
//         if (doc2.exists) {
//           Therapist therapist = Therapist.fromFirestore(doc2);
//           return therapist.name;
//         } else {
//           return null;
//         }
//       } else {
//         return null;
//       }
//     } catch (e) {
//       print('Error fetching therapist info: $e');
//       throw e;
//     }
//   }

//   Stream<List<Booking>> fetchAllBookings() {
//     return _firestore.collectionGroup('booking').snapshots().map((snapshot) {
//       return snapshot.docs.map((doc) {
//         return Booking.fromMap(doc.data() as Map<String, dynamic>);
//       }).toList();
//     });
//   }

//   Future<List<Booking>> fetchMyBooking(String? uid) async {
//     try {
//       QuerySnapshot querySnapshot = await _firestore.collection('Booking').doc(uid).collection('booking').get();

//       if (querySnapshot.docs.isEmpty) {
//         print('No booking found.');
//         return [];
//       } else {
        
//         List<Booking> bookings = querySnapshot.docs.map((doc) {
//           print('Document data: ${doc.data()}');
//           return Booking(
//             userName:doc['userName'],
//             therapistName: doc['therapistName'],
//             id: doc['id'],
//             appointmentType: doc['appointmentType'],
//             timeSlot: doc['timeSlot'],
//            // date: (doc['date'] as Timestamp).toDate(), 
//             userId: doc['userId'], 
//             therapistId: doc['therapistId'], 
//             day: (doc['day']as Timestamp).toDate() ,
//             status: 1,
            
//           );
//         }).toList();
//         print('Fetched ${bookings.length} bookings.');
//         return bookings;
//       }
//     } catch (e) {
//       print('Error fetching bookings: $e');
//       throw e;
//     }
//   }


//   Future<List<Booking>> fetchBooking(String? uid) async {
//     try {
//       QuerySnapshot querySnapshot = await _firestore.collection('therapist').doc(uid).collection('booking').get();

//       if (querySnapshot.docs.isEmpty) {
//         print('No booking found.');
//         return [];
//       } else {
        
//         List<Booking> bookings = querySnapshot.docs.map((doc) {
//           print('Document data: ${doc.data()}');
//           return Booking(
//             userName:doc['userName'],
//             therapistName: doc['therapistName'],
//             id: doc['id'],
//             appointmentType: doc['appointmentType'],
//             timeSlot: doc['timeSlot'],
//            // date: (doc['date'] as Timestamp).toDate(), 
//             userId: doc['userId'], 
//             therapistId: doc['therapistId'], 
//             day: (doc['day']as Timestamp).toDate() ,
//             status: 1,
            
//           );
//         }).toList();
//         print('Fetched ${bookings.length} bookings.');
//         return bookings;
//       }
//     } catch (e) {
//       print('Error fetching bookings: $e');
//       throw e;
//     }
//   }

//   Future<String?> fetchUserName(String userId) async {
//     try {
//       DocumentSnapshot userDoc = await _firestore.collection('users').doc(userId).get();
//       if (userDoc.exists) {
//         return userDoc['username']; // Assuming 'name' is the field containing the user's name
//       } else {
//         return null;
//       }
//     } catch (e) {
//       print('Error fetching user name: $e');
//       throw e;
//     }
//   }


//    Future<String?> fetchUserPhoneNumber(String userId) async {
//     try {
//       DocumentSnapshot userDoc = await _firestore.collection('users').doc(userId).get();
//       if (userDoc.exists) {
//         return userDoc['phoneNumber']; // Assuming 'name' is the field containing the user's name
//       } else {
//         return null;
//       }
//     } catch (e) {
//       print('Error fetching user name: $e');
//       throw e;
//     }
//   }
//    Future<String?> fetchUserEmail(String userId) async {
//     try {
//       DocumentSnapshot userDoc = await _firestore.collection('users').doc(userId).get();
//       if (userDoc.exists) {
//         return userDoc['email']; // Assuming 'name' is the field containing the user's name
//       } else {
//         return null;
//       }
//     } catch (e) {
//       print('Error fetching user name: $e');
//       throw e;
//     }
//   }



//   Future<void> deleteBookings(String? uid, String bookingId, String therapistId) async {
//   try {
//     // Delete booking from the user's collection
//     await _firestore.collection('Booking').doc(uid).collection('booking').doc(bookingId).delete();

//     // Delete booking from the therapist's collection
//     await _firestore.collection('therapist').doc(therapistId).collection('bookings').doc(bookingId).delete();

//     print('Deletion Successful');
//   } catch (e) {
//     print('Error deleting booking: $e');
//     throw e;
//   }
// }


//   Stream<List<Booking>> fetchBookingForTherapist(String therapistId) async* {
//     await for (var snapshot in _firestore
//         .collection('therapist')
//         .doc(therapistId)
//         .collection('bookings')
//         .snapshots()) {
//       List<Booking> bookings = await Future.wait(snapshot.docs.map((doc) async {
//         Booking booking = Booking.fromMap(doc.data() as Map<String, dynamic>);
//         String? userName = await fetchUserName(booking.userId);
//         booking.userName = userName ?? booking.userId; // Assign username if found, else fallback to userId
//         return booking;
//       }).toList());
//       yield bookings;
//     }
//   }
//    Future<void> deleteBooking(String userId, String bookingId) async {
//   try {
//     await _firestore.collection('Booking').doc(userId).collection('booking').doc(bookingId).delete();
//     print('Booking deleted successfully with ID: $bookingId');
//   } catch (e) {
//     print('Error deleting booking: $e');
//     throw e;
//   } 
// }
// Future<bool> isTimeSlotAvailable(DateTime selectedDate, String selectedTimeSlot) async {
//     try {
//       QuerySnapshot querySnapshot = await FirebaseFirestore.instance
//           .collection('Booking')
//           .where('day', isEqualTo: selectedDate)
//           .where('timeSlot', isEqualTo: selectedTimeSlot)
//           .get();

//       return querySnapshot.docs.isEmpty;
//     } catch (e) {
//       print('Error checking timeslot availability: $e');
//       throw e;
//     }
//   }


// }










import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:revive/Models/bookingModal.dart';
import 'package:revive/Models/therapistModal.dart';

class BookingService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> checkSlotAvailability(String therapistId, DateTime selectedDate, String selectedTimeSlot) async {
    try {
      // Query the availability collection to check if the selected slot is already booked
      QuerySnapshot querySnapshot = await _firestore
          .collection('availability')
          .where('therapistId', isEqualTo: therapistId)
          .where('day', isEqualTo: selectedDate)
          .where('timeSlot', isEqualTo: selectedTimeSlot)
          .get();

      // If no documents are returned, the slot is available; otherwise, it's booked
      return querySnapshot.docs.isEmpty;
    } catch (e) {
      print('Error checking slot availability: $e');
      throw e;
    }
  }

  Future<void> registerBooking(String? uid, Booking booking) async {
    try {
      // Check if the therapistId exists in the 'therapist' collection
      var therapistDoc = await _firestore.collection('therapist').doc(booking.therapistId).get();
      if (!therapistDoc.exists) {
        throw Exception('Therapist ID does not exist');
      }

      // Check if the selected time slot is available
      bool isAvailable = await checkSlotAvailability(booking.therapistId, booking.day, booking.timeSlot);
      if (!isAvailable) {
        throw Exception('Selected time slot is not available');
      }

      String bookingId = _firestore.collection('Booking').doc().id;

      // Register booking under the user's collection
      await _firestore.collection('Booking').doc(uid).collection('booking').doc(bookingId).set({
        'userName': booking.userName,
        'therapistName': booking.therapistName,
        'userId': booking.userId,
        'therapistId': booking.therapistId,
        'status': booking.status,
        'id': bookingId,
        'appointmentType': booking.appointmentType,
        'timeSlot': booking.timeSlot,
        'day': booking.day,
      });

      // Register booking under the therapist's collection
      await _firestore.collection('therapist').doc(booking.therapistId).collection('bookings').doc(bookingId).set({
        'userName': booking.userName,
        'therapistName': booking.therapistName,
        'userId': booking.userId,
        'therapistId': booking.therapistId,
        'status': booking.status,
        'id': bookingId,
        'appointmentType': booking.appointmentType,
        'timeSlot': booking.timeSlot,
        'day': booking.day,
        'timestamp': DateTime.now(),
      });

      // Add to availability collection
      await _firestore.collection('availability').doc(bookingId).set({
        'therapistId': booking.therapistId,
        'day': booking.day,
        'timeSlot': booking.timeSlot,
      });

      print('Registration Successful');
    } catch (e) {
      print('Error registering booking: $e');
      throw e;
    }
  }

  Future<void> deleteBookings(String? uid, String bookingId, String therapistId) async {
    try {
      // Delete booking from the user's collection
      await _firestore.collection('Booking').doc(uid).collection('booking').doc(bookingId).delete();

      // Delete booking from the therapist's collection
      await _firestore.collection('therapist').doc(therapistId).collection('bookings').doc(bookingId).delete();

      // Remove from availability collection
      await _firestore.collection('availability').doc(bookingId).delete();

      print('Deletion Successful');
    } catch (e) {
      print('Error deleting booking: $e');
      throw e;
    }
  }

  Future<bool> isTimeSlotAvailable(DateTime selectedDate, String selectedTimeSlot) async {
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection('availability')
          .where('day', isEqualTo: selectedDate)
          .where('timeSlot', isEqualTo: selectedTimeSlot)
          .get();

      return querySnapshot.docs.isEmpty;
    } catch (e) {
      print('Error checking timeslot availability: $e');
      throw e;
    }
  }

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


  Future<List<Booking>> fetchBooking(String? uid) async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('therapist').doc(uid).collection('booking').get();

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

  Future<String?> fetchUserName(String userId) async {
    try {
      DocumentSnapshot userDoc = await _firestore.collection('users').doc(userId).get();
      if (userDoc.exists) {
        return userDoc['username']; // Assuming 'name' is the field containing the user's name
      } else {
        return null;
      }
    } catch (e) {
      print('Error fetching user name: $e');
      throw e;
    }
  }


   Future<String?> fetchUserPhoneNumber(String userId) async {
    try {
      DocumentSnapshot userDoc = await _firestore.collection('users').doc(userId).get();
      if (userDoc.exists) {
        return userDoc['phoneNumber']; // Assuming 'name' is the field containing the user's name
      } else {
        return null;
      }
    } catch (e) {
      print('Error fetching user name: $e');
      throw e;
    }
  }
   Future<String?> fetchUserEmail(String userId) async {
    try {
      DocumentSnapshot userDoc = await _firestore.collection('users').doc(userId).get();
      if (userDoc.exists) {
        return userDoc['email']; // Assuming 'name' is the field containing the user's name
      } else {
        return null;
      }
    } catch (e) {
      print('Error fetching user name: $e');
      throw e;
    }
  }



//   Future<void> deleteBookings(String? uid, String bookingId, String therapistId) async {
//   try {
//     // Delete booking from the user's collection
//     await _firestore.collection('Booking').doc(uid).collection('booking').doc(bookingId).delete();

//     // Delete booking from the therapist's collection
//     await _firestore.collection('therapist').doc(therapistId).collection('bookings').doc(bookingId).delete();

//     print('Deletion Successful');
//   } catch (e) {
//     print('Error deleting booking: $e');
//     throw e;
//   }
// }


  Stream<List<Booking>> fetchBookingForTherapist(String therapistId) async* {
    await for (var snapshot in _firestore
        .collection('therapist')
        .doc(therapistId)
        .collection('bookings')
        .snapshots()) {
      List<Booking> bookings = await Future.wait(snapshot.docs.map((doc) async {
        Booking booking = Booking.fromMap(doc.data() as Map<String, dynamic>);
        String? userName = await fetchUserName(booking.userId);
        booking.userName = userName ?? booking.userId; // Assign username if found, else fallback to userId
        return booking;
      }).toList());
      yield bookings;
    }
  }
   Future<void> deleteBooking(String userId, String bookingId) async {
  try {
    await _firestore.collection('Booking').doc(userId).collection('booking').doc(bookingId).delete();
    print('Booking deleted successfully with ID: $bookingId');
  } catch (e) {
    print('Error deleting booking: $e');
    throw e;
  } 
}



}
