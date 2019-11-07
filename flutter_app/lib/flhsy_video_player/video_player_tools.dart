import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_app_study/app_icon.dart';

class Video_player_tools extends StatefulWidget {
  String networkUrlString;

  Video_player_tools(@required this.networkUrlString);

  @override
  _Video_player_toolsState createState() =>
      _Video_player_toolsState(this.networkUrlString);
}

class _Video_player_toolsState extends State<Video_player_tools> {
  VideoPlayerController _videoPlayerController;
  String networkUrlString;

  _Video_player_toolsState(@required this.networkUrlString);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _videoPlayerController =
        VideoPlayerController.network(this.networkUrlString)
          ..initialize().then((_) {
            setState(() {});
          });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AspectRatio(
        aspectRatio: AppScreen.AppScreenContextWidths(context) /
            300.0,
        child: Stack(
          children: <Widget>[
            Positioned(
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    child: Icon(Icons.play_arrow),
                    onTap: () {
                      setState(() {
                        _videoPlayerController.play();
                      });
                    },
                  ),
                  GestureDetector(
                    child: Icon(Icons.pause),
                    onTap: () {
                      setState(() {
                        _videoPlayerController.pause();
                      });
                    },
                  )
                ],
              ),
              bottom: 0.0,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _videoPlayerController.dispose();
  }
}
