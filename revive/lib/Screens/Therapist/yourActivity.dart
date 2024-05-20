import 'dart:math';

import 'package:flutter/material.dart';
import 'package:revive/Models/articleModal.dart';
import 'package:revive/Screens/constants/myAppbar.dart';
import 'package:revive/Services/articleService.dart';

class yourActivity extends StatefulWidget {
  const yourActivity({super.key});

  @override
  State<yourActivity> createState() => _yourActivityState();
}

class _yourActivityState extends State<yourActivity> {
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
  //  @override
  // void initState() {
  //   super.initState();
  //   _fetchArticles();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'My Activity'),
      body: Container(
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
                              trailing: IconButton(
                                icon: Icon(Icons.delete, color: Colors.white),
                                onPressed: () => _deleteArticle(article),
                              ),
                            ),
                          );
                        },
                      ),
      ),

      );
  }
}