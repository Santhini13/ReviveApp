
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:revive/Models/journalModal.dart';

class JournalService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> registerJournal(Journal journal, String? uid) async {
    if (uid == null || uid.isEmpty) {
      print('Error: User ID is null or empty');
      throw Exception('User ID is null or empty');
    }

    try {
      await _firestore.collection('journals').doc(uid).collection('entries').doc(journal.id).set({
        'title': journal.title,
        'description': journal.description,
        'mood': journal.mood,
        'date': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print('Error registering Journal: $e');
      throw e;
    }
  }

  Future<List<Journal>> fetchJournals(String? uid) async {
    if (uid == null || uid.isEmpty) {
      print('Error: User ID is null or empty');
      throw Exception('User ID is null or empty');
    }

    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection('journals')
          .doc(uid)
          .collection('entries')
          .orderBy('date', descending: true)
          .get();

      return querySnapshot.docs.map((doc) {
        return Journal(
          id: doc.id,
          title: doc['title'],
          description: doc['description'],
          mood: doc['mood'],
          date: (doc['date'] as Timestamp).toDate(),
        );
      }).toList();
    } catch (e) {
      print('Error fetching journals: $e');
      throw e;
    }
  }

  Future<void> deleteJournal(Journal journal, String uid) async {
    if (uid == null || uid.isEmpty) {
      print('Error: User ID is null or empty');
      throw Exception('User ID is null or empty');
    }

    try {
      await _firestore
          .collection('journals')
          .doc(uid)
          .collection('entries')
          .doc(journal.id)
          .delete();
    } catch (e) {
      print('Error deleting article: $e');
      throw e;
    }
  }
}
