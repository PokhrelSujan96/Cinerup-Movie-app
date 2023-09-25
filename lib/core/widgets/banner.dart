import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/constsnts/colors.dart';

class BannerHome extends StatelessWidget {
  const BannerHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0.h),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                  "assets/images/blur.jpg"),
              fit: BoxFit.cover)),
      child: Row(
        children: [
          Expanded(
              child: Container(
            height: 60.h,
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  "Great news ! You can now upgrade to our pro mode at a discount of 60% off. Don't miss out on this limited-time offer !",
                  style: GoogleFonts.electrolize(
                      fontWeight: FontWeight.bold,
                      fontSize: 10.sp,
                      color: white),
                ),
              ),
            ),
          )),
          SizedBox(
            height: 70.h,
            width: 120.w,
            child: Image.asset(
              "assets/images/movies.jpg",
              fit: BoxFit.fill,
            ),
          )
        ],
      ),
    );
  }
}
