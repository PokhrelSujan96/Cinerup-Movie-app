import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:movieapp/animations/FadeIn_Animation.dart';
import 'package:movieapp/constsnts/colors.dart';

class About_Us extends StatelessWidget {
  const About_Us({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 5, 0, 10),
      body: SafeArea(
          child: FadeInBounce(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                //appbar
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 20.h,
                        width: 20.w,
                        decoration: BoxDecoration(
                            color: grey.withOpacity(0.1),
                            shape: BoxShape.circle),
                        child: const Center(
                          child: Icon(
                            Icons.arrow_back,
                            color: white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Text(
                      "About Us",
                      style: GoogleFonts.electrolize(
                          color: white,
                          fontWeight: FontWeight.bold,
                          fontSize: 10.sp,
                          letterSpacing: 1),
                    )
                  ],
                ),
                //about_us
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "- Cinerup is all about the movies, series and other cinematography content and our intention is only to entertain you all. Here, in our app you can get all the new movies and series related to almost all the topic.\n\n  We will try to entertain with new and unique content. Our App is fully ads free so you don't need to worry about facing the challenges against the ads and especially our app will not promote the adult (+18) content or ads. Our app can be used by every groups of people as it is suitable for everyone",
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.electrolize(
                      color: white,
                      fontWeight: FontWeight.bold,
                      fontSize: 9.sp,
                      letterSpacing: 1),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Center(
                  child: Text(
                    "Our Features",
                    style: GoogleFonts.electrolize(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        color: white,
                        fontSize: 11.sp,
                        decoration: TextDecoration.underline),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 100.h,
                      child: Center(
                        child: LottieBuilder.asset("assets/lottie/fast.zip"),
                      ),
                    ),
                    Expanded(
                        child: Text(
                      "Our app is quick and 99.9% faster in processing the data..",
                      style: GoogleFonts.electrolize(
                          fontWeight: FontWeight.bold,
                          color: white,
                          fontSize: 10.sp,
                          letterSpacing: 1),
                    ))
                  ],
                ),
                //adfree
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      "Cinerup is totally ad free and suitable to every groups of people due to its smoothness, Especially it doesn't advertise adult (18+) content...",
                      style: GoogleFonts.electrolize(
                          fontWeight: FontWeight.bold,
                          color: white,
                          fontSize: 10.sp,
                          letterSpacing: 1),
                    )),
                    SizedBox(
                      height: 100.h,
                      child: Center(
                        child: LottieBuilder.asset("assets/lottie/noad.zip"),
                      ),
                    ),
                  ],
                ),
                //smooth
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 100.h,
                      child: Center(
                        child: LottieBuilder.asset("assets/lottie/smooth.zip"),
                      ),
                    ),
                    Expanded(
                        child: Text(
                      "Our app uses clean ui which make the transition and the application more smooth to use...",
                      style: GoogleFonts.electrolize(
                          fontWeight: FontWeight.bold,
                          fontSize: 10.sp,
                          color: white,
                          letterSpacing: 1),
                    )),
                  ],
                ),
                //clean ui
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      "We Focus more on user friendly interface with clean ui and we will always give 100% clean user interface...",
                      style: GoogleFonts.electrolize(
                          fontWeight: FontWeight.bold,
                          fontSize: 10.sp,
                          color: white,
                          letterSpacing: 1),
                    )),
                    SizedBox(
                      height: 100.h,
                      child: Center(
                        child: LottieBuilder.asset("assets/lottie/clean.zip"),
                      ),
                    ),
                  ],
                ),
                //easy download
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 100.h,
                      child: Center(
                        child: LottieBuilder.asset(
                          "assets/lottie/download.zip",
                          filterQuality: FilterQuality.high,
                        ),
                      ),
                    ),
                    Expanded(
                        child: Text(
                      "Cinerup provides you easy download method with no delay...",
                      style: GoogleFonts.electrolize(
                          fontWeight: FontWeight.bold,
                          fontSize: 10.sp,
                          color: white,
                          letterSpacing: 1),
                    )),
                  ],
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
