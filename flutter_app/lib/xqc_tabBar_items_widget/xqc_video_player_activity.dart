import 'package:flutter/material.dart';
import 'package:flutter_app_study/flhsy_video_player/video_player_tools.dart';
import 'package:flutter_app_study/app_icon.dart';

class Xqc_video_player_activity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: AppScreen.AppScreenContextHeights(context),
      width: AppScreen.AppScreenContextWidths(context),
      child: Container(
        margin: EdgeInsets.only(top: 1.0),
        child: Video_player_tools("http://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4"),
      ),
    );
  }
}
