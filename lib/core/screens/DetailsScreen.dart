import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_fade/image_fade.dart';
import 'package:lottie/lottie.dart';
import 'package:movieapp/animations/FadeIn_Animation.dart';
import 'package:movieapp/constsnts/colors.dart';
import 'package:movieapp/constsnts/global.dart';
import 'package:movieapp/core/Resources/Movie.dart';
import 'package:movieapp/core/screens/MainScreen.dart';
import 'package:movieapp/core/screens/PlayMovie.dart';
import 'package:movieapp/core/widgets/Promotion.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shimmer/shimmer.dart';

class Detail_Screen extends StatefulWidget {
  final Movie movie;

  Detail_Screen(this.movie);

  @override
  State<Detail_Screen> createState() => _Detail_ScreenState();
}

class _Detail_ScreenState extends State<Detail_Screen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: ((details) {}),
      child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 5, 0, 10),
          body: SafeArea(
            child: FadeInBounce(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      height: 30.h,
                                      width: 30.w,
                                      decoration: BoxDecoration(
                                          color: grey.withOpacity(0.3),
                                          shape: BoxShape.circle),
                                      child: const Center(
                                          child: Icon(
                                        Icons.arrow_back,
                                        color: white,
                                      )),
                                    ),
                                  ),
                                  Text(
                                    widget.movie.title.toString(),
                                    style: GoogleFonts.syne(
                                        fontSize: 9.sp,
                                        color: white,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              //Image and Details
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Hero(
                                    tag: widget.movie.image.toString(),
                                    child: Card(
                                      child: InkWell(
                                        onTap: () {},
                                        child: Container(
                                          height: 230.h,
                                          width: 160.w,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(9.r),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(9.r),
                                            child: ImageFade(
                                              image: NetworkImage(widget
                                                  .movie.image
                                                  .toString()),
                                              duration:
                                                  const Duration(seconds: 0),
                                              syncDuration:
                                                  const Duration(seconds: 0),
                                              alignment: Alignment.center,
                                              fit: BoxFit.fill,
                                              placeholder: Shimmer.fromColors(
                                                baseColor: grey.shade200,
                                                highlightColor: grey.shade300,
                                                child: Container(),
                                              ),
                                              loadingBuilder: (context,
                                                      progress, chunkEvent) =>
                                                  Center(
                                                      child:
                                                          CircularProgressIndicator(
                                                              value: progress *
                                                                  20)),
                                              errorBuilder: (context, error) =>
                                                  Container(
                                                alignment: Alignment.center,
                                                child: Shimmer.fromColors(
                                                  baseColor: grey.shade200,
                                                  highlightColor: grey.shade300,
                                                  child: Container(),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  //other
                                  Expanded(
                                    child: SizedBox(
                                      height: 230.h,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const CustomReact(
                                              padding: 0,
                                              path: "assets/lottie/heart.zip"),
                                          CustomReact(
                                              padding: 13.sp,
                                              path: "assets/lottie/sad.zip"),
                                          CustomReact(
                                              padding: 8.sp,
                                              path: "assets/lottie/rte.zip")
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),

                              //details
                              SizedBox(
                                height: 16.h,
                              ),
                              buildText("Movie Name : ", widget.movie.title),
                              SizedBox(height: 10.h),
                              Divider(
                                color: grey.shade800,
                              ),
                              SizedBox(
                                height: 6.h,
                              ),
                              //movie_description
                              Text(
                                "ABOUT MOVIE",
                                style: GoogleFonts.electrolize(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.sp,
                                    color: white,
                                    letterSpacing: 1),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Text(
                                "- ${widget.movie.description.toString()}",
                                textAlign: TextAlign.start,
                                style: GoogleFonts.syne(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 9.sp,
                                  color: white,
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Divider(
                                color: grey.shade800,
                              ),
                              SizedBox(
                                height: 6.h,
                              ),
                              //movie_cast
                              Text(
                                "CAST",
                                style: GoogleFonts.electrolize(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.sp,
                                    color: white,
                                    letterSpacing: 1),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Text(
                                "- ${widget.movie.cast.toString()}",
                                textAlign: TextAlign.justify,
                                style: GoogleFonts.syne(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10.sp,
                                    color: white,
                                    letterSpacing: 1),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Divider(
                                color: grey.shade800,
                              ),
                              SizedBox(
                                height: 6.h,
                              ),
                              //movie_cast
                              Text(
                                "GENRE",
                                style: GoogleFonts.electrolize(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.sp,
                                    color: white,
                                    letterSpacing: 1),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Text(
                                "- ${widget.movie.genre.toString()}",
                                textAlign: TextAlign.justify,
                                style: GoogleFonts.syne(
                                    color: white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 9.sp,
                                    letterSpacing: 1),
                              ),
                              //quality
                              SizedBox(
                                height: 10.h,
                              ),
                              Divider(
                                color: grey.shade800,
                              ),
                              SizedBox(
                                height: 6.h,
                              ),

                              Text(
                                "QUALITY AVAILABLE",
                                style: GoogleFonts.electrolize(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.sp,
                                    color: white,
                                    letterSpacing: 1),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Text(
                                "- ${widget.movie.quality.toString()}",
                                textAlign: TextAlign.justify,
                                style: GoogleFonts.syne(
                                    color: white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 9.sp,
                                    letterSpacing: 1),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Divider(
                                color: grey.shade800,
                              ),
                              SizedBox(
                                height: 6.h,
                              ),

                              Text(
                                "LANGUAGE",
                                style: GoogleFonts.electrolize(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.sp,
                                    color: white,
                                    letterSpacing: 1),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Text(
                                "- ${widget.movie.language.toString()}",
                                textAlign: TextAlign.justify,
                                style: GoogleFonts.syne(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 9.sp,
                                    color: white,
                                    letterSpacing: 1),
                              ),
                              //link_to_movies
                              SizedBox(
                                height: 10.h,
                              ),
                              Divider(
                                color: grey.shade800,
                              ),
                              SizedBox(
                                height: 6.h,
                              ),

                              Text(
                                "DOWNLOAD ON DEVICE",
                                style: GoogleFonts.electrolize(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.sp,
                                    color: white,
                                    letterSpacing: 1),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Row(
                                children: [
                                  const DownloadButton(text: "LINK 480p"),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  const DownloadButton(text: "LINK 720p"),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  const DownloadButton(text: "LINK 1080p"),
                                ],
                              ),
                              SizedBox(
                                height: 15.h,
                              ),

                              const Promotion(
                                  heading: "PROMOION",
                                  image:
                                      "https://i0.wp.com/ghanasoccernet.com/in/wp-content/uploads/sites/7/2022/11/1xbet-login.jpg?fit=1200%2C542&ssl=1"),
                              SizedBox(
                                height: 14.h,
                              ),
                              (widget.movie.video == "")
                                  ? const SizedBox()
                                  : Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "STREAM NOW ( INAPP )",
                                          style: GoogleFonts.electrolize(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12.sp,
                                              color: white,
                                              letterSpacing: 1),
                                        ),
                                        SizedBox(
                                          height: 0.h,
                                        ),
                                        Divider(
                                          color: grey.shade800,
                                        ),
                                        SizedBox(
                                          height: 6.h,
                                        ),
                                        BouncingButton(
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                PageTransition(
                                                    type:
                                                        PageTransitionType.fade,
                                                    duration: const Duration(
                                                        seconds: 1),
                                                    child: const MoviePlayer()),
                                              );
                                            },
                                            child: Container(
                                              height: 35.h,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              decoration: BoxDecoration(
                                                color: purp,
                                                borderRadius:
                                                    BorderRadius.circular(9.r),
                                              ),
                                              child: Center(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.play_arrow,
                                                      color: white,
                                                      size: 15.sp,
                                                    ),
                                                    SizedBox(
                                                      width: 5.w,
                                                    ),
                                                    Text(
                                                      "PLAY VIDEO NOW",
                                                      style: GoogleFonts
                                                          .electrolize(
                                                        fontSize: 9.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: white,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 5.w,
                                                    ),
                                                    Icon(
                                                      Icons.play_arrow,
                                                      color: white,
                                                      size: 15.sp,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20.h,
                                        ),
                                      ],
                                    ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const FadeInBounce(child: RecentRelease()),
                    SizedBox(
                      height: 12.h,
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }

  buildText(text1, text2) {
    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
          text: text1,
          style: GoogleFonts.syne(
              color: white,
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              letterSpacing: 1),
          children: [
            TextSpan(
              text: text2,
              style: GoogleFonts.syne(
                  color: white,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1),
            ),
          ]),
    );
  }
}

class DownloadButton extends StatelessWidget {
  final String text;
  const DownloadButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BouncingButton(
        child: Container(
          padding: textPadding,
          decoration: BoxDecoration(
            color: purp,
            borderRadius: BorderRadius.circular(7.r),
          ),
          child: Center(
            child: Text(
              text,
              style: GoogleFonts.electrolize(
                  fontWeight: FontWeight.bold, color: white, fontSize: 10.sp),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomReact extends StatelessWidget {
  final double padding;
  final String path;
  const CustomReact({super.key, required this.path, required this.padding});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(padding),
        height: 60.h,
        width: 80.w,
        decoration: BoxDecoration(
            color: grey.withOpacity(0.3),
            borderRadius: BorderRadius.circular(12.r)),
        child: Center(child: LottieBuilder.asset(path)),
      ),
    );
  }
}
