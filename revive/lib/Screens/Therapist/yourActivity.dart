// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:revive/Models/articleModal.dart';
// import 'package:revive/Models/videoModal.dart';
// import 'package:revive/Models/assesmentModal.dart';
// import 'package:revive/Screens/general/videoPlayer.dart';
// import 'package:revive/Services/articleService.dart';
// import 'package:revive/Services/videoService.dart';
// import 'package:revive/Services/assesmentService.dart';
// import 'package:revive/Services/authprovider.dart';
// import 'package:intl/intl.dart';

// class YourActivity extends StatefulWidget {
//   const YourActivity({super.key});

//   @override
//   State<YourActivity> createState() => _YourActivityState();
// }

// class _YourActivityState extends State<YourActivity> with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//   List<Article> _articles = [];
//   List<Assessment> _assessmentScores = [];
//   bool _isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 3, vsync: this);
//     _fetchData();
//   }

//   Future<void> _fetchData() async {
//     final authProvider = Provider.of<AuthProvider>(context, listen: false);
//     try {
//       final articles = await ArticleService().fetchArticles(authProvider.uid);
//       final assessmentScores = await AssesmentService().fetchAssesment(authProvider.uid);
//       setState(() {
//         _articles = articles;
//         _assessmentScores = assessmentScores;
//         _isLoading = false;
//       });
//     } catch (e) {
//       print('Error fetching data: $e');
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }

//   void _deleteArticle(Article article) async {
//     final authProvider = Provider.of<AuthProvider>(context, listen: false);
//     try {
//       await ArticleService().deleteArticle(article, authProvider.uid!);
//       setState(() {
//         _articles.remove(article);
//       });
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Article deleted successfully.'),
//           backgroundColor: Color(0xff881736),
//         ),
//       );
//     } catch (e) {
//       print('Error deleting article: $e');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Error deleting article.'),
//           backgroundColor: Colors.red,
//         ),
//       );
//     }
//   }

//   void _deleteVideo(VideoModel video) async {
//     final authProvider = Provider.of<AuthProvider>(context, listen: false);
//     try {
//       await VideoService().deleteVideo(video, authProvider.uid!);
//       // No need to manually remove the video from the list,
//       // as the StreamBuilder will automatically update the list.
//     } catch (e) {
//       print('Error deleting video: $e');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Error deleting video.'),
//           backgroundColor: Colors.red,
//         ),
//       );
//     }
//   }

//   void _deleteAssessment(Assessment assessment) async {
//     final authProvider = Provider.of<AuthProvider>(context, listen: false);
//     try {
//       await AssesmentService().deleteAssessment(assessment, authProvider.uid!);
//       setState(() {
//         _assessmentScores.remove(assessment);
//       });
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Assessment deleted successfully.'),
//           backgroundColor: Color(0xff881736),
//         ),
//       );
//     } catch (e) {
//       print('Error deleting assessment: $e');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Error deleting assessment.'),
//           backgroundColor: Colors.red,
//         ),
//       );
//     }
//   }

//   void _showInformation(String title, String content) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text(title),
//         content: Text(content),
//         actions: <Widget>[
//           TextButton(
//             child: Text('Back'),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final authProvider = Provider.of<AuthProvider>(context, listen: false);

//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.only(top:30.0,left:5,right:10),
//         child: Column(
//           children: <Widget>[
//             TabBar(
//               controller: _tabController,
//               tabs: [
//                 Tab(text: 'Articles'),
//                 Tab(text: 'Videos'),
//                 Tab(text: 'Assessment'),
//               ],
//             ),
//             Expanded(
//               child: _isLoading
//                   ? Center(child: CircularProgressIndicator())
//                   : TabBarView(
//                       controller: _tabController,
//                       children: [
//                         _buildArticleList(),
//                         _buildVideoList(authProvider.uid!),
//                         _buildAssessmentScoreList(),
//                       ],
//                     ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildArticleList() {
//     if (_articles.isEmpty) {
//       return Center(child: Text('No articles found.'));
//     }
//     return ListView.builder(
//       padding: EdgeInsets.all(16.0),
//       itemCount: _articles.length,
//       itemBuilder: (context, index) {
//         final article = _articles[index];
//         final darkColors = Colors.primaries.where((color) {
//           final hsl = HSLColor.fromColor(color);
//           return hsl.lightness < 0.4;
//         }).toList();
//         Color randomColor;
//         if (darkColors.isNotEmpty) {
//           randomColor = darkColors[Random().nextInt(darkColors.length)];
//         } else {
//           randomColor = Colors.grey; // fallback color
//         }
//         return Card(
//           color: randomColor,
//           child: ListTile(
//             title: Text(
//               article.title,
//               style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//             ),
//             // subtitle: Text(
//             //   article.content,
//             //   style: TextStyle(color: Colors.white),
//             // ),
//             onTap: () => _showInformation(article.title, article.content),
//             trailing: IconButton(
//               icon: Icon(Icons.delete, color: Colors.white),
//               onPressed: () => _deleteArticle(article),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildVideoList(String uid) {
//     return StreamBuilder<List<VideoModel>>(
//       stream: VideoService().getVideos(uid),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(child: CircularProgressIndicator());
//         }
//         if (!snapshot.hasData || snapshot.data!.isEmpty) {
//           return Center(child: Text('No videos found.'));
//         }
//         final videos = snapshot.data!;
//         return ListView.builder(
//           padding: EdgeInsets.all(16.0),
//           itemCount: videos.length,
//           itemBuilder: (context, index) {
//             final video = videos[index];
//             return Card(
//               color: Color.fromARGB(255, 240, 220, 212),
//               elevation: 10,
//               margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//               child: ListTile(
//                 contentPadding: EdgeInsets.all(10),
//                 leading: Icon(Icons.video_library, size: 50, color: Color(0xff881736)),
//                 title: Text(
//                   video.title,
//                   style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff281537)),
//                 ),
//                 trailing: Icon(Icons.play_arrow, color: Color(0xff881736)),
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => VideoPlayerPage(videoUrl: video.url),
//                     ),
//                   );
//                 },
//                 onLongPress: () => _deleteVideo(video),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }

//   Widget _buildAssessmentScoreList() {
//     if (_assessmentScores.isEmpty) {
//       return Center(child: Text('No assessment scores found.'));
//     }
//     return ListView.builder(
//       padding: EdgeInsets.all(16.0),
//       itemCount: _assessmentScores.length,
//       itemBuilder: (context, index) {
//         final assessment = _assessmentScores[index];
//         return Card(
//           color: Color.fromARGB(255, 240, 220, 212),
//           elevation: 10,
//           margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//           child: ListTile(
//             contentPadding: EdgeInsets.all(10),
//             leading: Icon(Icons.assessment, size: 50, color: Color(0xff881736)),
//             title: Text(
//               assessment.title,
//               style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff281537)),
//             ),
//             subtitle: Text(
//               'Score: ${assessment.score}\nDate: ${DateFormat.yMMMd().format(assessment.date)}',
//               style: TextStyle(color: Color(0xff281537)),
//             ),
//             trailing: IconButton(
//               icon: Icon(Icons.delete, color: Color(0xff281537)),
//               onPressed: () => _deleteAssessment(assessment),
//             ),
//             onTap: () {
//               _showAssessmentDetails(context, assessment);
//             },
//           ),
//         );
//       },
//     );
//   }

//   void _showAssessmentDetails(BuildContext context, Assessment assessment) {
//     String riskLevel;
//     Color riskColor;

//     if (assessment.title == "Substance Use") {
//       if (assessment.score > 8) {
//         riskLevel = 'At Risk';
//         riskColor = Colors.red;
//       } else if (assessment.score > 5) {
//         riskLevel = 'Moderate';
//         riskColor = Colors.orange;
//       } else {
//         riskLevel = 'No Risk';
//         riskColor = Colors.grey;
//       }
//     } else {
//       if (assessment.score > 25) {
//         riskLevel = 'At Risk';
//         riskColor = Colors.red;
//       } else if (assessment.score > 20) {
//         riskLevel = 'Moderate';
//         riskColor = Colors.orange;
//       } else if (assessment.score > 15) {
//         riskLevel = 'Mild';
//         riskColor = Colors.yellow;
//       } else if (assessment.score > 10) {
//         riskLevel = 'Normal';
//         riskColor = Colors.green;
//       } else {
//         riskLevel = 'No Risk';
//         riskColor = Colors.grey;
//       }
//     }

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           backgroundColor: riskColor,
//           title: Text(
//             assessment.title,
//             style: TextStyle(color: Colors.white),
//           ),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Score: ${assessment.score}',
//                 style: TextStyle(color: Colors.white),
//               ),
//               Text(
//                 'Date: ${DateFormat.yMMMd().format(assessment.date)}',
//                 style: TextStyle(color: Colors.white),
//               ),
//               SizedBox(height: 10),
//               Container(
//                 padding: EdgeInsets.all(4.0),
//                 color: riskColor,
//                 child: Text(
//                   riskLevel,
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                     fontSize: 16,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             ],
//           ),
//           actions: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 if (assessment.title == "Substance Use")
//                   IconButton(
//                     icon: Icon(Icons.info, color: Colors.white),
//                     onPressed: () {
//                       _showSubstanceUseInfoDialog(context);
//                     },
//                   ),
//                 TextButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: Text('Close', style: TextStyle(color: Colors.white)),
//                 ),
//               ],
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _showSubstanceUseInfoDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           content: Text(
//               'Substance Use assessments,\n the risk levels are calculated\nas follows:\n\n'
//               '- At Risk: Score > 8\n'
//               '- Moderate: Score > 5\n'
//               '- No Risk: Score <= 5'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: Text('Close'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }



import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:revive/Models/articleModal.dart';
import 'package:revive/Models/videoModal.dart';
import 'package:revive/Models/assesmentModal.dart';
import 'package:revive/Screens/general/videoPlayer.dart';
import 'package:revive/Services/articleService.dart';
import 'package:revive/Services/videoService.dart';
import 'package:revive/Services/assesmentService.dart';
import 'package:revive/Services/authprovider.dart';
import 'package:intl/intl.dart';

class YourActivity extends StatefulWidget {
  const YourActivity({super.key});

  @override
  State<YourActivity> createState() => _YourActivityState();
}

class _YourActivityState extends State<YourActivity> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Article> _articles = [];
  List<Assessment> _assessmentScores = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _fetchData();
  }

  Future<void> _fetchData() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    try {
      final articles = await ArticleService().fetchArticles(authProvider.uid);
      final assessmentScores = await AssesmentService().fetchAssesment(authProvider.uid);
      setState(() {
        _articles = articles;
        _assessmentScores = assessmentScores;
        _isLoading = false;
      });
    } catch (e) {
      print('Error fetching data: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }


  void _deleteArticle(Article article) async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    try {
      await ArticleService().deleteArticle(article, authProvider.uid!);
      setState(() {
        _articles.remove(article);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Article deleted successfully.'),
          backgroundColor:  Color(0xff881736),
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


  void _deleteVideo(VideoModel video) async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    try {
      await VideoService().deleteVideo(video, authProvider.uid!);
      // No need to manually remove the video from the list,
      // as the StreamBuilder will automatically update the list.
    } catch (e) {
      print('Error deleting video: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error deleting video.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _deleteAssessment(Assessment assessment) async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    try {
      await AssesmentService().deleteAssessment(assessment, authProvider.uid!);
      setState(() {
        _assessmentScores.remove(assessment);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Assessment deleted successfully.'),
          backgroundColor:  Color(0xff881736),
        ),
      );
    } catch (e) {
      print('Error deleting assessment: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error deleting assessment.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _showInformation(String title, String content) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          TextButton(
            child: Text('Back'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top:30.0,left:5,right:10),
        child: Column(
          children: <Widget>[
            TabBar(
              controller: _tabController,
              tabs: [
                Tab(text: 'Articles'),
                Tab(text: 'Videos'),
                Tab(text: 'Assessment'),
              ],
            ),
            Expanded(
              child: _isLoading
                  ? Center(child: CircularProgressIndicator())
                  : TabBarView(
                      controller: _tabController,
                      children: [
                        _buildArticleList(),
                        _buildVideoList(authProvider.uid!),
                        _buildAssessmentScoreList(),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildArticleList() {
    if (_articles.isEmpty) {
      return Center(child: Text('No articles found.'));
    }
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemCount: _articles.length,
      itemBuilder: (context, index) {
        final article = _articles[index];
        final darkColors = Colors.primaries.where((color) {
          final hsl = HSLColor.fromColor(color);
          return hsl.lightness < 0.4;
        }).toList();
        Color randomColor;
        if (darkColors.isNotEmpty) {
          randomColor = darkColors[Random().nextInt(darkColors.length)];
        } else {
          randomColor = Colors.grey; // fallback color
        }
        return Card(
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
            onTap: () => _showInformation(article.title, article.content),
            trailing: IconButton(
            icon: Icon(Icons.delete, color: Colors.white),
             onPressed: () => _deleteArticle(article),
          ),
          ),
        );
      },
    );
  }

  Widget _buildVideoList(String uid) {
    return StreamBuilder<List<VideoModel>>(
      stream: VideoService().getVideos(uid),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No videos found.'));
        }
        final videos = snapshot.data!;
        return ListView.builder(
          padding: EdgeInsets.all(16.0),
          itemCount: videos.length,
          itemBuilder: (context, index) {
            final video = videos[index];
            return Card(
              color: Color.fromARGB(255, 240, 220, 212),
              elevation: 10,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: ListTile(
                contentPadding: EdgeInsets.all(10),
                leading: Icon(Icons.video_library, size: 50, color: Color(0xff881736)),
                title: Text(
                  video.title,
                  style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff281537)),
                ),
                trailing: Icon(Icons.play_arrow, color: Color(0xff881736)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VideoPlayerPage(videoUrl: video.url),
                    ),
                  );
                },
                onLongPress: () => _deleteVideo(video),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildAssessmentScoreList() {
    if (_assessmentScores.isEmpty) {
      return Center(child: Text('No assessment scores found.'));
    }
    return ListView.builder(
      padding: EdgeInsets.all(16.0),
      itemCount: _assessmentScores.length,
      itemBuilder: (context, index) {
        final assessment = _assessmentScores[index];
        return Card(
          color: Color.fromARGB(255, 240, 220, 212),
          elevation: 10,
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: ListTile(
            contentPadding: EdgeInsets.all(10),
            leading: Icon(Icons.assessment, size: 50, color: Color(0xff881736)),
            title: Text(
              assessment.title,
              style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff281537)),
            ),
            subtitle: Text(
              'Score: ${assessment.score}\nDate: ${DateFormat.yMMMd().format(assessment.date)}',
              style: TextStyle(color: Color(0xff281537)),
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete, color: Color(0xff281537)),
              onPressed: () => _deleteAssessment(assessment),
            ),
            onTap: () {
              _showAssessmentDetails(context, assessment);
            },
          ),
        );
      },
    );
  }

  void _showAssessmentDetails(BuildContext context, Assessment assessment) {
    String riskLevel;
    Color riskColor;

    if (assessment.title == "Substance Use") {
      if (assessment.score > 8) {
        riskLevel = 'At Risk';
        riskColor = Colors.red;
      } else if (assessment.score > 5) {
        riskLevel = 'Moderate';
        riskColor = Colors.orange;
      } else {
        riskLevel = 'No Risk';
        riskColor = Colors.grey;
      }
    } else {
      if (assessment.score > 25) {
        riskLevel = 'At Risk';
        riskColor = Colors.red;
      } else if (assessment.score > 20) {
        riskLevel = 'Moderate';
        riskColor = Colors.orange;
      } else if (assessment.score > 15) {
        riskLevel = 'Mild';
        riskColor = Colors.yellow;
      } else if (assessment.score > 10) {
        riskLevel = 'Normal';
        riskColor = Colors.green;
      } else {
        riskLevel = 'No Risk';
        riskColor = Colors.grey;
      }
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: riskColor,
          title: Text(
            assessment.title,
            style: TextStyle(color: Colors.white),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Score: ${assessment.score}',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'Date: ${DateFormat.yMMMd().format(assessment.date)}',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(4.0),
                color: riskColor,
                child: Text(
                  riskLevel,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (assessment.title == "Substance Use")
                  IconButton(
                    icon: Icon(Icons.info, color: Colors.white),
                    onPressed: () {
                      _showSubstanceUseInfoDialog(context);
                    },
                  ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Close', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  void _showSubstanceUseInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(
              'Substance Use assessments,\n the risk levels are calculated\nas follows:\n\n'
              '- At Risk: Score > 8\n'
              '- Moderate: Score > 5\n'
              '- No Risk: Score <= 5'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}