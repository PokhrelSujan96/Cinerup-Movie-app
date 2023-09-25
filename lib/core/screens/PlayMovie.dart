import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movieapp/constsnts/colors.dart';
import 'package:movieapp/core/widgets/VideoPlayer.dart';
import 'package:video_player/video_player.dart';

class MoviePlayer extends StatelessWidget {
  const MoviePlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: black,
      child: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9.r),
              color: grey.withOpacity(0.1)),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: PlayOffline(
                looping: true,
                link: "assets/images/sample.mp4",
                videoPlayerController:
                    VideoPlayerController.asset("assets/images/sample.mp4"),
              )),
        ),
      ),
    );
  }
}
