import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:revive/Models/articleModal.dart';

class ArticleService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> registerArticle(String? uid,Article article) async {
    try {
      await _firestore.collection('articles').doc(uid).collection('article').add({
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


   Stream<List<Article>> fetchAllArticles() {
    return _firestore.collectionGroup('article').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Article.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }

     Future<List<Article>> fetchArticles(String? uid) async {
    try {
      QuerySnapshot querySnapshot = await _firestore
          .collection('articles').doc(uid).collection('article').get();

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
Future<void> deleteArticle(Article article, String uid) async {
  try {
    QuerySnapshot querySnapshot = await _firestore
        .collection('articles')
        .doc(uid)
        .collection('article')
        .where('title', isEqualTo: article.title)
        .where('content', isEqualTo: article.content)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      // Assuming only one article should match the criteria
      await querySnapshot.docs.first.reference.delete();
      print('Article deleted successfully: ${article.title}');
    } else {
      print('Article not found.');
    }
  } catch (e) {
    print('Error deleting article: $e');
    throw e;
  }
}



  // Future<void> deleteArticle(Article article, String uid) async {
  //   try {
  //     await _firestore
  //         .collection('articles')
  //         .doc(uid)
  //         .collection('article')  
  //         .get()
  //         .then((querySnapshot) {
  //       querySnapshot.docs.forEach((doc) {
  //         doc.reference.delete();
  //       });
  //     });
  //   } catch (e) {
  //     print('Error deleting article: $e');
  //     throw e;
  //   }
  // }
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
