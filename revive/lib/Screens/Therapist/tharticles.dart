import 'package:flutter/material.dart';

class AddArticleScreen extends StatefulWidget {
  @override
  _AddArticleScreenState createState() => _AddArticleScreenState();
}

class _AddArticleScreenState extends State<AddArticleScreen> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();

  void _saveArticle() {
    // Implement logic to save the article
    String title = _titleController.text;
    String content = _contentController.text;
    // Save the article to the database or perform any other action
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Article'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveArticle,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.title),
                hintText: 'Enter the article title',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Content',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            TextFormField(
              controller: _contentController,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.description),
                hintText: 'Enter the article content',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
