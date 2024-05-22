import 'dart:math';
import 'package:flutter/material.dart';
import 'package:revive/Models/articleModal.dart';
import 'package:revive/Services/articleService.dart';

class AwarenessScreen extends StatefulWidget {
  @override
  _AwarenessScreenState createState() => _AwarenessScreenState();
}

class _AwarenessScreenState extends State<AwarenessScreen> {
  String _selectedInfo = '';
  String _selectedTitle = '';
 List<Article> _articles = [];
  bool _isLoading = true;

  
  Future<void> _fetchArticles() async {
    try {
      final articles = await ArticleService().fetchArticles('Awareness');
      setState(() {
        _articles = articles;
        _isLoading = false;
      });
      print('Fetched articles: $_articles');
    } catch (e) {
      print('Error fetching articles: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

 void _showInformation(String title, String content) {
  setState(() {
    _selectedTitle = title;
    _selectedInfo = content;
  });
}


  void _deleteArticle(Article article) async {
    try {
      await ArticleService().deleteArticle(article);
      setState(() {
        _articles.remove(article);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Article deleted successfully.'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      print('Error deleting article: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error deleting article.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
  @override
  void initState() {
    super.initState();
    _fetchArticles();
  }



  // void _deleteArticle(Article article) async {
  //   final authProvider = Provider.of<AuthProvider>(context, listen: false);
  //   try {
  //     await ArticleService().deleteArticle(authProvider.uid, article);
  //     setState(() {
  //       _articles.remove(article);
  //     });
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('Article deleted successfully.'),
  //         backgroundColor: Colors.green,
  //       ),
  //     );
  //   } catch (e) {
  //     print('Error deleting article: $e');
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('Error deleting article.'),
  //         backgroundColor: Colors.red,
  //       ),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff881736), Color(0xff281537)],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Read and Learn About \nMental Health',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  Image.asset(
                    'assets/icons/aware.png',
                    width: 150,
                    height: 150,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              height: double.infinity,
              width: double.infinity,
              child: _selectedInfo.isNotEmpty
                  ? SingleChildScrollView(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            _selectedTitle,
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 12.0),
                          Text(
                            _selectedInfo,
                            style: TextStyle(fontSize: 16.0),
                          ),
                          SizedBox(height: 20.0),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _selectedTitle = '';
                                _selectedInfo = '';
                              });
                            },
                            child: Text('Back'),
                          ),
                        ],
                      ),
                    )
                  : _isLoading
                      ? Center(child: CircularProgressIndicator())
                      : _articles.isEmpty
                          ? Center(child: Text('No articles found.'))
                          : ListView.builder(
                              padding: EdgeInsets.all(16.0),
                              itemCount: _articles.length,
                              itemBuilder: (context, index) {
                                final article = _articles[index];
                                final randomColor = Colors.primaries[Random().nextInt(Colors.primaries.length)];
                                return Card(
                                  color: randomColor,
                                  child: ListTile(
                                    title: Text(
                                      article.title,
                                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Text(
                                      article.content,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onTap: () => _showInformation(article.title, article.content),
                                    
                                  ),
                                );
                              },
                            ),
            ),
          ),
        ],
      ),
    );
  }
}
