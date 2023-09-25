import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/animations/FadeIn_Animation.dart';
import 'package:movieapp/constsnts/colors.dart';
import 'package:movieapp/core/screens/AboutUs.dart';
import 'package:page_transition/page_transition.dart';

class Settings extends StatelessWidget {
  Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 5, 0, 10),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: FadeInBounce(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //appbar

              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: Column(
                  children: [
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
                          "Settings",
                          style: GoogleFonts.electrolize(
                              color: white,
                              fontWeight: FontWeight.bold,
                              fontSize: 10.sp,
                              letterSpacing: 1),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),

                    //about
                    Features(
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.fade,
                              curve: Curves.easeInOutBack,
                              duration: Duration(milliseconds: 700),
                              childCurrent: SizedBox(),
                              child: About_Us(),
                            ));
                      },
                      text: "ABOUT US",
                    ),
                    SizedBox(
                      height: 13.h,
                    ),
                    //Your Download
                    const Features(
                      text: "DEMAND MOVIES",
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    const Features(
                      text: "YOUR DOWNLOADS",
                    ),
                    SizedBox(
                      height: 13.h,
                    ),
                    //Ios
                    const Features(
                      text: "IOS VERSION",
                    ),
                    SizedBox(
                      height: 13.h,
                    ),
                    //Download In Windows
                    const Features(
                      text: "WINDOWS VERSION",
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  Center(
                    child: Text(
                      "1.0.0",
                      style: GoogleFonts.syne(
                          color: white,
                          fontSize: 9.sp,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1),
                    ),
                  ),
                  Center(
                    child: Text(
                      "POWERED BY CINERUP",
                      style: GoogleFonts.syne(
                          color: white,
                          fontSize: 8.sp,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1),
                    ),
                  ),
              SizedBox(height: 10.h,),

                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}

class Features extends StatelessWidget {
  final String text;
  final Function()? onTap;
  const Features({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return BouncingButton(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 30.h,
          decoration: BoxDecoration(
              color: grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(9.r)),
          child: Center(
            child: Text(
              text,
              style: GoogleFonts.electrolize(
                  fontWeight: FontWeight.bold,
                  color: white,
                  letterSpacing: 1,
                  fontSize: 9.sp),
            ),
          ),
        ),
      ),
    );
  }
}
