import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:revive/Models/articleModal.dart';

class ArticleService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Future<void> registerArticle(Article article) async {
  //   try {
  //     await _firestore.collection('articles').doc(article.category).collection('entries').add({
  //       'title': article.title,
  //       'content': article.content,
  //       'category': article.category,
  //       'date': FieldValue.serverTimestamp(),
  //     });
  //   } catch (e) {
  //     print('Error registering Article: $e');
  //     throw e;
  //   }
  // }
  Future<void> registerArticle(Article article) async {
    try {
      await _firestore.collection('articles').add({
        'title': article.title,
        'content': article.content,
        'category': article.category,
        'date': DateTime.now(),
      });
    } catch (e) {
      print('Error registering Article: $e');
      throw e;
    }
  }
   Future<List<Article>> fetchArticles(String category) async {
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection('articles')
          .where('category', isEqualTo: category)
          .get();

      if (querySnapshot.docs.isEmpty) {
        print('No articles found.');
        return [];
      } else {
        List<Article> articles = querySnapshot.docs.map((doc) {
          print('Document data: ${doc.data()}');
          return Article(
            title: doc['title'],
            content: doc['content'],
            category: doc['category'],
          );
        }).toList();
        print('Fetched ${articles.length} articles.');
        return articles;
      }
    } catch (e) {
      print('Error fetching Articles: $e');
      throw e;
    }
  }

  Future<void> deleteArticle(Article article) async {
    try {
      await _firestore
          .collection('articles')
          .where('title', isEqualTo: article.title)
          .where('content', isEqualTo: article.content)
          .get()
          .then((querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          doc.reference.delete();
        });
      });
    } catch (e) {
      print('Error deleting article: $e');
      throw e;
    }
  }
}


  // Future<List<Article>> fetchArticles(String category) async {
  //   try {
  //     QuerySnapshot querySnapshot = await _firestore
  //         .collection('articles')
  //         .orderBy('date', descending: true)
  //         .get();

  //     // Filter articles by category in code since we don't have an index
  //     List<Article> filteredArticles = querySnapshot.docs
  //         .map((doc) => Article(
  //               title: doc['title'],
  //               content: doc['content'],
  //               category: doc['category'],
  //               date: (doc['date'] as Timestamp).toDate(),
  //             ))
  //         .where((article) => article.category == category)
  //         .toList();

  //     return filteredArticles;
  //   } catch (e) {
  //     print('Error fetching articles: $e');
  //     throw e;
  //   }
  // }
//}
