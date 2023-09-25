import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/constsnts/colors.dart';

class Promotion extends StatelessWidget {
  final String image;
  final Function()? onTap;
  final String heading;
  final String? movieName;
  const Promotion(
      {super.key,
      required this.image,
      this.onTap,
      required this.heading,
      this.movieName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100.h,
        width: MediaQuery.of(context).size.width.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            image:
                DecorationImage(image: NetworkImage(image), fit: BoxFit.fill)),
        child: Stack(
          children: [
            Positioned(
              left: 5.w,
              top: 5.h,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
                decoration: BoxDecoration(
                    color: black, borderRadius: BorderRadius.circular(2.r)),
                child: Text(
                  heading,
                  style: GoogleFonts.electrolize(
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow,
                      fontSize: 8.sp),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
