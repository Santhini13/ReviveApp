import 'package:flutter/material.dart';
import 'package:revive/Screens/constants/myAppbar.dart';

class ViewArticleScreen extends StatefulWidget {
  @override
  _ViewArticleScreenState createState() => _ViewArticleScreenState();
}

class _ViewArticleScreenState extends State<ViewArticleScreen> {
  final List<String> articles = [
    'Article 1',
    'Article 2',
    'Article 3',
  ];

  void _deleteArticle(String article) {
    setState(() {
      articles.remove(article);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Article "$article" deleted'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'View Articles'), 
      body: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          final article = articles[index];
          return ListTile(
            title: Text(article),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                _deleteArticle(article);
              },
            ),
          );
        },
      ),
    );
  }
}