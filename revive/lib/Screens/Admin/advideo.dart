// // import 'package:flutter/material.dart';
// // import 'package:provider/provider.dart';
// // import 'package:revive/Models/videoModal.dart';
// // import 'package:revive/Screens/constants/myAppbar.dart';
// // import 'package:revive/Services/authprovider.dart';
// // import 'package:revive/Services/videoService.dart';
// // import 'package:revive/Screens/general/videoPlayer.dart';

// // class AdVideoListPage extends StatefulWidget {
// //   @override
// //   _AdVideoListPageState createState() => _AdVideoListPageState();
// // }

// // class _AdVideoListPageState extends State<AdVideoListPage> {
// //   final VideoService _videoService = VideoService();
// //   List<Map<String, dynamic>> _allVideosWithUsers = [];
// //   List<Map<String, dynamic>> _filteredVideosWithUsers = [];
// //   TextEditingController _searchController = TextEditingController();

// //   @override
// //   void initState() {
// //     super.initState();
// //     _searchController.addListener(_onSearchChanged);
// //   }

// //   @override
// //   void dispose() {
// //     _searchController.removeListener(_onSearchChanged);
// //     _searchController.dispose();
// //     super.dispose();
// //   }

// //   _onSearchChanged() {
// //     setState(() {
// //       _filteredVideosWithUsers = _allVideosWithUsers
// //           .where((videoWithUser) => videoWithUser['videos']
// //               .title
// //               .toLowerCase()
// //               .contains(_searchController.text.toLowerCase()))
// //           .toList();
// //     });
// //   }
// //   void _deleteVideo(VideoModel video) async {
// //     final authProvider = Provider.of<AuthProvider>(context, listen: false);
// //     try {
// //       await VideoService().deleteVideo(video, authProvider.uid!);
// //       // No need to manually remove the video from the list,
// //       // as the StreamBuilder will automatically update the list.
// //     } catch (e) {
// //       print('Error deleting video: $e');
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(
// //           content: Text('Error deleting video.'),
// //           backgroundColor: Colors.red,
// //         ),
// //       );
// //     }
// //   }
// //   // void _deleteVideo(VideoModel video) {
// //   //   final authProvider = Provider.of<AuthProvider>(context, listen: false);
// //   //   showDialog(
// //   //     context: context,
// //   //     builder: (BuildContext context) {
// //   //       return AlertDialog(
// //   //         title: Text("Confirm Delete"),
// //   //         content: Text("Are you sure you want to delete this video?"),
// //   //         actions: [
// //   //           TextButton(
// //   //             onPressed: () {
// //   //               Navigator.of(context).pop(); // Close the dialog
// //   //             },
// //   //             child: Text("Cancel"),
// //   //           ),
// //   //           TextButton(
// //   //             onPressed: () async {
// //   //               try {
// //   //                 await _videoService.deleteVideo(
// //   //                     video, authProvider.uid!); // Pass the user's id
// //   //                 Navigator.of(context).pop(); // Close the dialog
// //   //                 setState(() {
// //   //                   // Update the UI to reflect the deletion
// //   //                   _allVideosWithUsers.removeWhere((videoWithUser) =>
// //   //                       videoWithUser['video'].id == video.id);
// //   //                   _filteredVideosWithUsers.removeWhere((videoWithUser) =>
// //   //                       videoWithUser['video'].id == video.id);
// //   //                 });
// //   //               } catch (e) {
// //   //                 print("Error deleting video: $e");
// //   //                 // Handle error
// //   //               }
// //   //             },
// //   //             child: Text("Delete"),
// //   //           ),
// //   //         ],
// //   //       );
// //   //     },
// //   //   );
// //   // }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: MyAppBar(
// //         title: 'Videos',
// //       ),
// //       body: Column(
// //         children: [
// //           Padding(
// //             padding: const EdgeInsets.all(20.0),
// //             child: TextField(
// //               controller: _searchController,
// //               decoration: InputDecoration(
// //                 hintText: 'Search videos...',
// //                 prefixIcon: Icon(Icons.search, color: Color(0xff281537)),
// //                 border: OutlineInputBorder(
// //                   borderRadius: BorderRadius.all(Radius.circular(25.0)),
// //                 ),
// //                 focusedBorder: OutlineInputBorder(
// //                   borderSide: BorderSide(color: Color(0xff881736)),
// //                   borderRadius: BorderRadius.all(Radius.circular(25.0)),
// //                 ),
// //               ),
// //             ),
// //           ),
// //           Expanded(
// //             child: StreamBuilder<List<Map<String, dynamic>>>(
// //               stream: _videoService.getAllVideosWithUsers(),
// //               builder: (context, snapshot) {
// //                 if (snapshot.connectionState == ConnectionState.waiting) {
// //                   return Center(child: CircularProgressIndicator());
// //                 }
// //                 if (!snapshot.hasData || snapshot.data!.isEmpty) {
// //                   return Center(child: Text('No videos available.'));
// //                 }
// //                 _allVideosWithUsers = snapshot.data!;
// //                 _filteredVideosWithUsers = _searchController.text.isEmpty
// //                     ? _allVideosWithUsers
// //                     : _filteredVideosWithUsers;
// //                 return ListView.builder(
// //                   itemCount: _filteredVideosWithUsers.length,
// //                   itemBuilder: (context, index) {
// //                     var videoWithUser = _filteredVideosWithUsers[index];
// //                     VideoModel video = videoWithUser['video'];
// //                     String username = videoWithUser['username'];
// //                     return Card(
// //                       color: Color.fromARGB(255, 240, 220, 212),
// //                       elevation: 10,
// //                       margin:
// //                           EdgeInsets.symmetric(vertical: 10, horizontal: 15),
// //                       child: ListTile(
// //                         contentPadding: EdgeInsets.all(10),
// //                         leading: Icon(Icons.video_library,
// //                             size: 50, color: Color(0xff881736)),
// //                         title: Text(
// //                           video.title,
// //                           style: TextStyle(
// //                               fontWeight: FontWeight.bold,
// //                               color: Color(0xff281537)),
// //                         ),
// //                         subtitle: Text(
// //                           'by $username',
// //                           style: TextStyle(color: Color(0xff281537)), 
// //                         ),
// //                         // trailing: IconButton(
// //                         //   icon: Icon(Icons.delete, color: Color(0xff881736)),
// //                         //   onPressed: () {
// //                         //     _deleteVideo(video);
// //                         //   },
// //                         // ),
// //                         onTap: () {
// //                           Navigator.push(
// //                             context,
// //                             MaterialPageRoute(
// //                               builder: (context) =>
// //                                   VideoPlayerPage(videoUrl: video.url),
// //                             ),
// //                           );
// //                         },
// //                       ),
// //                     );
// //                   },
// //                 );
// //               },
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:revive/Models/videoModal.dart';
// import 'package:revive/Screens/constants/myAppbar.dart';
// import 'package:revive/Services/authprovider.dart';
// import 'package:revive/Services/videoService.dart';
// import 'package:revive/Screens/general/videoPlayer.dart';

// class AdVideoListPage extends StatefulWidget {
//   @override
//   _AdVideoListPageState createState() => _AdVideoListPageState();
// }

// class _AdVideoListPageState extends State<AdVideoListPage> {
//   final VideoService _videoService = VideoService();
//   List<Map<String, dynamic>> _allVideosWithUsers = [];
//   List<Map<String, dynamic>> _filteredVideosWithUsers = [];
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
//       _filteredVideosWithUsers = _allVideosWithUsers
//           .where((videoWithUser) => videoWithUser['video']
//               .title
//               .toLowerCase()
//               .contains(_searchController.text.toLowerCase()))
//           .toList();
//     });
//   }

//   void _deleteVideo(VideoModel video) async {
//     final authProvider = Provider.of<AuthProvider>(context, listen: false);
//     try {
//       await _videoService.deleteVideo(video, authProvider.uid!);
//       setState(() {
//         _allVideosWithUsers.removeWhere((videoWithUser) => videoWithUser['video'].id == video.id);
//         _filteredVideosWithUsers.removeWhere((videoWithUser) => videoWithUser['video'].id == video.id);
//       });
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Video deleted successfully.'),
//           backgroundColor: Colors.green,
//         ),
//       );
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

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: MyAppBar(
//         title: 'Videos',
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: TextField(
//               controller: _searchController,
//               decoration: InputDecoration(
//                 hintText: 'Search videos...',
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
//               stream: _videoService.getAllVideosWithUsers(),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Center(child: CircularProgressIndicator());
//                 }
//                 if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                   return Center(child: Text('No videos available.'));
//                 }
//                 _allVideosWithUsers = snapshot.data!;
//                 _filteredVideosWithUsers = _searchController.text.isEmpty
//                     ? _allVideosWithUsers
//                     : _filteredVideosWithUsers;
//                 return ListView.builder(
//                   itemCount: _filteredVideosWithUsers.length,
//                   itemBuilder: (context, index) {
//                     var videoWithUser = _filteredVideosWithUsers[index];
//                     VideoModel video = videoWithUser['video'];
//                     String username = videoWithUser['username'];
//                     return Card(
//                       color: Color.fromARGB(255, 240, 220, 212),
//                       elevation: 10,
//                       margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//                       child: ListTile(
//                         contentPadding: EdgeInsets.all(10),
//                         leading: Icon(Icons.video_library, size: 50, color: Color(0xff881736)),
//                         title: Text(
//                           video.title,
//                           style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xff281537)),
//                         ),
//                         subtitle: Text(
//                           'by $username',
//                           style: TextStyle(color: Color(0xff281537)),
//                         ),
//                         trailing: IconButton(
//                           icon: Icon(Icons.delete, color: Color(0xff881736)),
//                           onPressed: () {
//                             _deleteVideo(video);
//                           },
//                         ),
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => VideoPlayerPage(videoUrl: video.url),
//                             ),
//                           );
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
import 'package:revive/Models/videoModal.dart';
import 'package:revive/Screens/constants/myAppbar.dart';
import 'package:revive/Services/videoService.dart';
import 'package:revive/Screens/general/videoPlayer.dart';
import 'package:revive/Screens/User/navbar.dart';

class AdVideoListPage extends StatefulWidget {
  @override
  _AdVideoListPageState createState() => _AdVideoListPageState();
}

class _AdVideoListPageState extends State<AdVideoListPage> {
  int _selectedIndex = 2;
  final VideoService _videoService = VideoService();
  List<VideoModel> _allVideos = [];
  List<VideoModel> _filteredVideos = [];
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
      _filteredVideos = _allVideos
          .where((video) =>
              video.title.toLowerCase().contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  Future<void> _deleteVideo(String videoId) async {
    await _videoService.deleteVideos(videoId);
    setState(() {
      _allVideos.removeWhere((video) => video.id == videoId);
      _filteredVideos.removeWhere((video) => video.id == videoId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: 'Videos',
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search videos...',
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
            child: StreamBuilder<List<VideoModel>>(
              stream: _videoService.getAllVideos(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No videos available.'));
                }
                _allVideos = snapshot.data!;
                _filteredVideos = _searchController.text.isEmpty
                    ? _allVideos
                    : _filteredVideos;
                return ListView.builder(
                  itemCount: _filteredVideos.length,
                  itemBuilder: (context, index) {
                    VideoModel video = _filteredVideos[index];
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
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.delete, color: Color(0xff881736)),
                              onPressed: () => _deleteVideo(video.id),
                            ),
                          ],
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => VideoPlayerPage(videoUrl: video.url),
                            ),
                          );
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
