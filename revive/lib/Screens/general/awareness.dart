import 'dart:math';
import 'package:flutter/material.dart';
import 'package:revive/Models/articleModal.dart';
import 'package:revive/Screens/constants/myAppbar.dart';
import 'package:revive/Services/articleService.dart';

class AwarenessScreen extends StatelessWidget {
  final ArticleService _articleService = ArticleService();

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
              child: StreamBuilder<List<Article>>(
                stream: _articleService.fetchAllArticles(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    List<Article> articles = snapshot.data ?? [];
                    return ListView.builder(
                      padding: EdgeInsets.all(16.0),
                      itemCount: articles.length,
                      itemBuilder: (context, index) {
                        final article = articles[index];
                       final randomColor = Colors.primaries[Random().nextInt(Colors.primaries.length)];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ArticleDetailScreen(article: article),
                              ),
                            );
                          },
                          child: Card(
                            color: randomColor,
                            child: ListTile(
                              title: Text(
                                article.title,
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                              // subtitle: Text(
                              //   article.content,
                              //   style: TextStyle(color: Colors.white),
                              // ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ArticleDetailScreen extends StatelessWidget {
  final Article article;

  ArticleDetailScreen({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: article.title
      ),
      body: SingleChildScrollView(
        child: Container(
          width:double.infinity,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article.category,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                SizedBox(height: 10),
                Text(
                  article.content,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


