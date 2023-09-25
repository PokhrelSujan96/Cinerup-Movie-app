import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/constsnts/colors.dart';
import 'package:video_player/video_player.dart';

class PlayOffline extends StatefulWidget {
  final link;
  final bool looping;
  final VideoPlayerController videoPlayerController;
  const PlayOffline({
    Key? key,
    required this.looping,
    this.link,
    required this.videoPlayerController,
  }) : super(key: key);

  @override
  State<PlayOffline> createState() => _PlayOfflineState();
}

class _PlayOfflineState extends State<PlayOffline> {
  ChewieController? _chewieController;
  bool _isLoading = true;

  @override
  void initState() {
    _chewieController = ChewieController(
        videoPlayerController: widget.videoPlayerController,
        showControls: true,
        aspectRatio: widget.videoPlayerController.value.aspectRatio,
        autoInitialize: true,
        allowFullScreen: true,
        zoomAndPan: true,
        errorBuilder: (context, errormessage) {
          return Center(
              child: Text(
            "Error Playing Video",
            style: GoogleFonts.lato(
                fontWeight: FontWeight.bold, fontSize: 10.sp, color: white),
          ));
        },
        showControlsOnInitialize: false,
        placeholder: Container(
            color: Colors.black,
            child: Center(
              child: _isLoading
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CupertinoActivityIndicator(
                          color: white,
                          radius: 14.r,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "Fetching video ! Please Wait",
                          style: GoogleFonts.syne(
                              fontWeight: FontWeight.bold,
                              color: white,
                              fontSize: 9.sp),
                        )
                      ],
                    )
                  : IconButton(
                      icon: const Icon(Icons.play_arrow),
                      onPressed: () {
                        setState(() {
                          _isLoading = true;
                          widget.videoPlayerController.play();
                        });
                      },
                    ),
            )),
        looping: true,
        autoPlay: true,
        allowMuting: true,
        overlay: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
          child: Row(
            children: [
              Text(
                "Powered By Cinerup",
                style: GoogleFonts.syne(
                    color: white, fontWeight: FontWeight.bold, fontSize: 9.sp),
              ),
            ],
          ),
        ));
    super.initState();
  }

  @override
  void dispose() {
    widget.videoPlayerController.dispose();
    _chewieController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Chewie(controller: _chewieController!);
  }
}
