// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// class WidgetVideoPlayer extends StatefulWidget {
//   const WidgetVideoPlayer({super.key});

//   @override
//   State<WidgetVideoPlayer> createState() => _WidgetVideoPlayerState();
// }

// class _WidgetVideoPlayerState extends State<WidgetVideoPlayer> {
//   late VideoPlayerController _videoController;
//   late Future<void> _initializeVideoPlayerFuture;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _videoController = VideoPlayerController.networkUrl(Uri.parse(
//         "https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4"));

//     _initializeVideoPlayerFuture = _videoController.initialize();
//   }

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     _videoController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     bool playVisible = true;
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: Color.fromARGB(138, 124, 4, 0),
//         title: const Text("Video Player"),
//       ),
//       body: FutureBuilder(
//           future: _initializeVideoPlayerFuture,
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.done) {
//               return InkWell(
//                 child: Stack(children: [
//                   AspectRatio(
//                     aspectRatio: _videoController.value.aspectRatio,
//                     child: VideoPlayer(_videoController),
//                   ),
//                   Positioned(
//                     top: 0,
//                     left: 0,
//                     right: 0,
//                     bottom: 0,
//                     child: 
//                     playVisible ? InkWell(
//                       child: Icon(_videoController.value.isPlaying
//                           ? Icons.pause_circle
//                           : Icons.play_arrow),
//                       onTap: () {
//                         setState(() {
//                           if (_videoController.value.isPlaying) {
//                             _videoController.pause();
//                           } else {
//                             _videoController.play();
//                             setState(() {
//                             playVisible=false;                              
//                             });
//                           }
//                         });
//                       },
//                     ) : Container(),
//                   ),
//                 ]),
//                 onTap: () {
//                             setState(() {
//                             playVisible=true;                              
//                             });
//                 }
//               );
//             } else {
//               return CircularProgressIndicator();
//             }
//           }),
//     );
//   }
// }
