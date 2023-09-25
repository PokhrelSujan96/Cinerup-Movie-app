import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/animations/FadeIn_Animation.dart';
import 'package:movieapp/constsnts/colors.dart';
import 'package:movieapp/core/screens/Settings.dart';
import 'package:page_transition/page_transition.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          SizedBox(
            height: 16.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello Family",
                    style: GoogleFonts.electrolize(
                        color: white,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp),
                  ),
                  const SizedBox(
                    height: 2.0,
                  ),
                  Text(
                    "Relax and watch your favourite movies!",
                    style: GoogleFonts.electrolize(
                        color: grey.shade300,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                        fontSize: 8.sp),
                  ),
                ],
              ),
              BouncingButton(
                child: GestureDetector(
                  onTap: () {
                     Navigator.push(
                                          context,
                                          PageTransition(
                                            type: PageTransitionType.fade,
                                            curve: Curves.easeInOutBack,
                                            duration: const Duration(milliseconds: 700),
                                            childCurrent: const SizedBox(),
                                            child: Settings(),
                                          ));
                  },
                  child: Container(
                    height: 20.h,
                    width: 25.w,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Image.asset(
                        "assets/images/app.png",
                        color: white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
