// import 'package:flutter/material.dart';
// import 'package:revive/Models/articleModal.dart';
// import 'package:revive/Screens/constants/myAppbar.dart';
// import 'package:revive/Services/articleService.dart';

// class ViewArticleScreen extends StatefulWidget {
//   @override
//   _ViewArticleScreenState createState() => _ViewArticleScreenState();
// }

// class _ViewArticleScreenState extends State<ViewArticleScreen> {
//   final ArticleService _articleService = ArticleService();
//   List<Map<String, dynamic>> _allArticlesWithUsers = [];
//   List<Map<String, dynamic>> _filteredArticlesWithUsers = [];
//   TextEditingController _searchController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _searchController.addListener(_onSearchChanged);
//   }

//   @override
//   void dispose() {
//     _searchController.removeListener(_onSearchChanged);
//     _searchController.dispose();
//     super.dispose();
//   }

//   _onSearchChanged() {
//     setState(() {
//       _filteredArticlesWithUsers = _allArticlesWithUsers
//           .where((articleWithUser) =>
//               articleWithUser['article'].title.toLowerCase().contains(_searchController.text.toLowerCase()))
//           .toList();
//     });
//   }

//   void _deleteArticle(String userId, String articleId) async {
//     await _articleService.deleteArticle(userId as Article, articleId);
//     setState(() {
//       _allArticlesWithUsers.removeWhere((articleWithUser) =>
//         articleWithUser['articleId'] == articleId && articleWithUser['userId'] == userId
//       );
//       _filteredArticlesWithUsers.removeWhere((articleWithUser) =>
//         articleWithUser['articleId'] == articleId && articleWithUser['userId'] == userId
//       );
//     });
//     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Article deleted successfully')));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: MyAppBar(
//         title: 'Articles',
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: TextField(
//               controller: _searchController,
//               decoration: InputDecoration(
//                 hintText: 'Search articles...',
//                 prefixIcon: Icon(Icons.search, color: Color(0xff281537)),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(25.0)),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Color(0xff881736)),
//                   borderRadius: BorderRadius.all(Radius.circular(25.0)),
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: StreamBuilder<List<Map<String, dynamic>>>(
//               stream: _articleService.getAllArticlesWithUsers(),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Center(child: CircularProgressIndicator());
//                 }
//                 if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                   return Center(child: Text('No articles available.'));
//                 }
//                 _allArticlesWithUsers = snapshot.data!;
//                 _filteredArticlesWithUsers = _searchController.text.isEmpty
//                     ? _allArticlesWithUsers
//                     : _filteredArticlesWithUsers;
//                 return ListView.builder(
//                   itemCount: _filteredArticlesWithUsers.length,
//                   itemBuilder: (context, index) {
//                     var articleWithUser = _filteredArticlesWithUsers[index];
//                     Article article = articleWithUser['article'];
//                     String username = articleWithUser['username'];
//                     String userId = articleWithUser['userId'];
//                     String articleId = articleWithUser['articleId'];
//                     return Card(
//                       color: Color.fromARGB(255, 240, 220, 212),
//                       elevation: 10,
//                       margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//                       child: ListTile(
//                         contentPadding: EdgeInsets.all(10),
//                         leading: Icon(Icons.article, size: 50, color: Color(0xff881736)),
//                         title: Text(
//                           article.title,
//                           style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff281537)),
//                         ),
//                         subtitle: Text(
//                           'by $username',
//                           style: TextStyle(color: Color(0xff281537)),
//                         ),
//                         trailing: IconButton(
//                           icon: Icon(Icons.delete, color: Color(0xff881736)),
//                           onPressed: () {
//                             _deleteArticle(userId, articleId);
//                           },
//                         ),
//                         onTap: () {
//                           // Navigate to article detail page if needed
//                         },
//                       ),
//                     );
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:revive/Models/articleModal.dart';
import 'package:revive/Screens/constants/myAppbar.dart';
import 'package:revive/Services/articleService.dart';

class ViewArticleScreen extends StatefulWidget {
  @override
  _ViewArticleScreenState createState() => _ViewArticleScreenState();
}

class _ViewArticleScreenState extends State<ViewArticleScreen> {
  final ArticleService _articleService = ArticleService();
  List<Map<String, dynamic>> _allArticlesWithUsers = [];
  List<Map<String, dynamic>> _filteredArticlesWithUsers = [];
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  _onSearchChanged() {
    setState(() {
      _filteredArticlesWithUsers = _allArticlesWithUsers
          .where((articleWithUser) =>
              articleWithUser['article'].title.toLowerCase().contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  void _deleteArticles(userId, String articleId) async {
    await _articleService.deleteArticle(userId, articleId);
    setState(() {
      _allArticlesWithUsers.removeWhere((articleWithUser) =>
        articleWithUser['articleId'] == articleId && articleWithUser['userId'] == userId
      );
      _filteredArticlesWithUsers.removeWhere((articleWithUser) =>
        articleWithUser['articleId'] == articleId && articleWithUser['userId'] == userId
      );
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Article deleted successfully')));
  }

  void _showArticleDetails(Article article) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                article.title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 10),
              Text(
                'Content: ${article.content}',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
              SizedBox(height: 10),
              Text(
                'Category: ${article.category}',
              ),
              SizedBox(height: 10),
              Text(
                'Date: ${article.date.toString()}',
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Articles',
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search articles...',
                prefixIcon: Icon(Icons.search, color: Color(0xff281537)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff881736)),
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder<List<Map<String, dynamic>>>(
              stream: _articleService.getAllArticlesWithUsers(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No articles available.'));
                }
                _allArticlesWithUsers = snapshot.data!;
                _filteredArticlesWithUsers = _searchController.text.isEmpty
                    ? _allArticlesWithUsers
                    : _filteredArticlesWithUsers;
                return ListView.builder(
                  itemCount: _filteredArticlesWithUsers.length,
                  itemBuilder: (context, index) {
                    var articleWithUser = _filteredArticlesWithUsers[index];
                    Article article = articleWithUser['article'];
                    String username = articleWithUser['username'];
                    String userId = articleWithUser['userId'];
                    String articleId = articleWithUser['articleId'];
                    return Card(
                      color: Color.fromARGB(255, 240, 220, 212),
                      elevation: 10,
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      child: ListTile(
                        contentPadding: EdgeInsets.all(10),
                        leading: Icon(Icons.article, size: 50, color: Color(0xff881736)),
                        title: Text(
                          article.title,
                          style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff281537)),
                        ),
                        subtitle: Text(
                          'by $username',
                          style: TextStyle(color: Color(0xff281537)),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: Color(0xff881736)),
                          onPressed: () {
                            _deleteArticles(userId, articleId);
                          },
                        ),
                        onTap: () {
                          _showArticleDetails(article);
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
