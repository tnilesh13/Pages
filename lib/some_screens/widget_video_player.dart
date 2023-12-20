import 'package:flutter/material.dart';
import 'package:new_app/helper/util.dart';
import 'package:new_app/helper/read_json.dart';
import 'package:video_player/video_player.dart';

class WidgetVideoPlayer extends StatefulWidget {
  const WidgetVideoPlayer({super.key});

  @override
  State<WidgetVideoPlayer> createState() => _WidgetVideoPlayerState();
}

class _WidgetVideoPlayerState extends State<WidgetVideoPlayer> {
  Map<String, dynamic>? myMap;

  @override
  void initState() {
    super.initState();

    ReadJsonFile.readJsonData(path: "assets/json/video.json").then((value) {
      setState(() {
        myMap = value["VideoView"];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var textColor =
        Util.getColorFromHex(myMap!["TextView"]["FontColor"]);
    var bgColor = Util.getColorFromHex(myMap!["BackgroundColor"]);

    return Container(
      margin: EdgeInsets.all(myMap!["Margin"]),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(myMap!["Radius"]),
        color: bgColor,
      ),
      width: double.infinity,
      // color: bgColor,
      child: Column(
        children: [
          MyVideo(myMap),

                  Padding(
                    padding: EdgeInsets.all(myMap!["Padding"]),
                    child: Text(
                      myMap!["TextView"]["Description"],
                      style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: myMap!["TextView"]
                              ['DescriptionFontSize']),
                    ),
                  ),
        ],
      ),
    );
  }
}

class MyVideo extends StatefulWidget {
  Map<String, dynamic>? myMap;
  VideoPlayerController? _videoController;
  Future<void>? _initializeVideoPlayerFuture;
  MyVideo(this.myMap);

  @override
  State<MyVideo> createState() => _MyVideoState();
}

class _MyVideoState extends State<MyVideo> {
  String? srcc;
  @override
  void initState() {
    super.initState();
    srcc = widget.myMap!["Src"];

    widget._videoController =
        VideoPlayerController.networkUrl(Uri.parse(srcc!));
    print("mysrccccccc12$srcc");

    widget._initializeVideoPlayerFuture = widget._videoController!.initialize();
  }

  @override
  Widget build(BuildContext context) {
    var textColor =
        Util.getColorFromHex(widget.myMap!["TextView"]["FontColor"]);
    return FutureBuilder(
        future: widget._initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Padding(
              padding: EdgeInsets.all(widget.myMap!["Margin"]),
              child: InkWell(
                child: Stack(children: [
                  AspectRatio(
                    aspectRatio: widget._videoController!.value.aspectRatio,
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(widget.myMap!["Radius"]),
                      child: VideoPlayer(widget._videoController!),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: widget._videoController!.value.isPlaying
                        ? Text("")
                        : Icon(
                            widget._videoController!.value.isPlaying
                                ? Icons.pause
                                : Icons.play_arrow,
                            size: 48,
                          ),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.all(widget.myMap!["Padding"]),
                  //   child: Text(
                  //     widget.myMap!["TextView"]["Description"],
                  //     style: TextStyle(
                  //         color: textColor,
                  //         fontWeight: FontWeight.bold,
                  //         fontSize: widget.myMap!["TextView"]
                  //             ['DescriptionFontSize']),
                  //   ),
                  // ),
                ]),
                onTap: () {
                  setState(() {
                    if (widget._videoController!.value.isPlaying) {
                      widget._videoController!.pause();
                    } else {
                      widget._videoController!.play();
                    }
                  });
                },
              ),
            );
          } else {
            return Padding(
                padding: EdgeInsets.all(widget.myMap!["TextView"]["Padding"]),
                child: const SizedBox(
                  height: 40.0,
                  // width: 10.0,
                  child: Center(child: CircularProgressIndicator()),
                ));

            //  CircularProgressIndicator();
          }
        });
  }

  @override
  void dispose() {
    widget._videoController!.dispose();
    super.dispose();
  }
}