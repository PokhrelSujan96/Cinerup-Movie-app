import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/animations/FadeIn_Animation.dart';
import 'package:movieapp/constsnts/colors.dart';
import 'package:movieapp/core/categoryScreen/AllMovies.dart';
import 'package:movieapp/core/categoryScreen/CategoriesList.dart';
import 'package:page_transition/page_transition.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Categories",
                style: GoogleFonts.electrolize(
                    fontSize: 12.sp, fontWeight: FontWeight.bold, color: white),
              ),
              Text(
                "SEE ALL",
                style: GoogleFonts.electrolize(
                    fontSize: 10.sp, fontWeight: FontWeight.bold, color: grey),
              ),
            ],
          ),
          SizedBox(
            height: 12.h,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Ct(
                  text: "HOLLYWOOD",
                  onTap: () {
                       Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.fade,
                                      duration: const Duration(seconds: 1),
                                      child: const HollywoodCat()),
                                );
                  },
                ),
                SizedBox(
                  width: 12.w,
                ),
                Ct(
                  text: "BOLLYWOOD",
                  onTap: () {
                     Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.fade,
                                      duration: const Duration(seconds: 1),
                                      child: const BollyWoodCat()),
                                );
                  },
                ),
                SizedBox(
                  width: 12.w,
                ),
                Ct(
                  text: "SOUTH DUBBED",
                  onTap: () {
                    Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.fade,
                                      duration: const Duration(seconds: 1),
                                      child: const SouthCat()),
                                );
                  },
                ),
                SizedBox(
                  width: 12.w,
                ),
                Ct(
                  text: "SERIES",
                  onTap: () {
                      Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.fade,
                                      duration: const Duration(seconds: 1),
                                      child: const SeriesCat()),
                                );
                  },
                )
              ],
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Ct(
                  text: "TV SHOWS",
                  onTap: () {
                      Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.fade,
                                      duration: const Duration(seconds: 1),
                                      child: const SouthCat()),
                                );
                  },
                ),
                SizedBox(
                  width: 12.w,
                ),
                Ct(
                  text: "THRILLER",
                  onTap: () {},
                ),
                SizedBox(
                  width: 12.w,
                ),
                Ct(
                  text: "SOUTH CINEMA",
                  onTap: () {
                      Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.fade,
                                      duration: const Duration(seconds: 1),
                                      child: const SouthCat()),
                                );
                  },
                ),
                SizedBox(
                  width: 12.w,
                ),
                Ct(
                  text: "ACTION",
                  onTap: () {
                      Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.fade,
                                      duration: const Duration(seconds: 1),
                                      child: const BollyWoodCat()),
                                );
                                
                  },
                ),
                   SizedBox(
                  width: 12.w,
                ),
                Ct(
                  text: "VIEW ALL",
                  onTap: () {
                      Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.fade,
                                      duration: const Duration(seconds: 1),
                                      child: const ALlMovies()),
                                );
                                
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Ct extends StatelessWidget {
  final String text;
  final Function()? onTap;
  const Ct({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return BouncingButton(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
            vertical: 7.h,
          ),
          decoration: BoxDecoration(
              color: grey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(4.r)),
          child: Text(
            text,
            style: GoogleFonts.electrolize(
                fontWeight: FontWeight.w500, color: white, fontSize: 9.sp),
          ),
        ),
      ),
    );
  }
}
