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


  Stream<List<Map<String, dynamic>>> getAllArticlesWithUsers() async* {
    var userSnapshot = await _firestore.collection('users').get();
    List<Map<String, dynamic>> articlesWithUsers = [];

    for (var userDoc in userSnapshot.docs) {
      var userData = userDoc.data() as Map<String, dynamic>;
      var articleSnapshot = await _firestore.collection('articles').doc(userDoc.id).collection('article').get();

      for (var articleDoc in articleSnapshot.docs) {
        var articleData = articleDoc.data() as Map<String, dynamic>;

        articlesWithUsers.add({
          'article': Article.fromMap(articleData),
          'username': userData['username'],
          'userId': userDoc.id, // Add user ID to identify the user
          'articleId': articleDoc.id, // Add article ID to identify the article
        });
      }
    }

    yield articlesWithUsers;
  }

  Future<void> deleteArticles(String userId, String articleId) async {
    await _firestore.collection('articles').doc(userId).collection('article').doc(articleId).delete();
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
//     QuerySnapshot querySnapshot = await _firestore
//         .collection('articles')
//         .doc(uid)
//         .collection('article')
//         .where('title', isEqualTo: article.title)
//         .where('content', isEqualTo: article.content)
//         .get();

//     if (querySnapshot.docs.isNotEmpty) {
//       // Assuming only one article should match the criteria
//       await querySnapshot.docs.first.reference.delete();
//       print('Article deleted successfully: ${article.title}');
//     } else {
//       print('Article not found.');
//     }
//   } catch (e) {
//     print('Error deleting article: $e');
//     throw e;
//   }
// }
}


