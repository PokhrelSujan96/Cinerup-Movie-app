import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/animations/FadeIn_Animation.dart';
import 'package:movieapp/constsnts/colors.dart';
import 'package:movieapp/core/screens/MainScreen.dart';
import 'package:page_transition/page_transition.dart';

class UnBoardScreen extends StatelessWidget {
  const UnBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/images/onboard.jpg",
              ),
              fit: BoxFit.cover),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width.w,
                  height: 200.h,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.9),
                          blurRadius: 12.r,
                          spreadRadius: 10.r),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: FadeInBounce(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "MOO",
                              style: GoogleFonts.electrolize(
                                  fontSize: 13.sp,
                                  color: red,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic),
                            ),
                            Text(
                              "VIE",
                              style: GoogleFonts.electrolize(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.bold,
                                  color: white,
                                  fontStyle: FontStyle.normal),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            "UNLEASH YOUR INNER MOVIE BUFF HERE",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.firaSans(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 7.h,
                          ),
                          Text(
                            "Find your favourite movies wherever\n you are, whenever you want"
                                .toUpperCase(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 8.sp,
                                letterSpacing: 0.3.r,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          BouncingButton(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.fade,
                                      duration: const Duration(seconds: 1),
                                      child: const MainScreen()),
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 10.h),
                                width: MediaQuery.of(context).size.width.w,
                                decoration: BoxDecoration(
                                    color: red,
                                    borderRadius: BorderRadius.circular(10.r)),
                                child: Center(
                                  child: Text(
                                    "START WATCHING",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.electrolize(
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.bold,
                                        color: white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 14.h,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
