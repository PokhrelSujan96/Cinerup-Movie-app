import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_fade/image_fade.dart';
import 'package:movieapp/animations/FadeIn_Animation.dart';
import 'package:movieapp/constsnts/colors.dart';
import 'package:movieapp/core/Resources/network.dart';
import 'package:movieapp/core/screens/DetailsScreen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shimmer/shimmer.dart';

class GlobalMoviesDatas extends StatelessWidget {
  final String category;
  final String title;
  final Function()? onTap;
  const GlobalMoviesDatas({super.key, required this.category, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return FadeInBounce(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 20.h,
                        width: 1.w,
                        decoration: const BoxDecoration(color: Colors.yellow),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        title,
                        style: GoogleFonts.electrolize(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: white),
                      ),
                    ],
                  ),
                  Text(
                    "See All",
                    style: GoogleFonts.electrolize(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                        color: grey),
                  ),
                ],
              )),
          SizedBox(
            height: 10.h,
          ),
          FutureBuilder(
              future: fetchMovie(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return SizedBox(
                    height: 160.h,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, int index) {
                          return (snapshot.data[index].category == category)
                              ? Hero(
                                  tag: snapshot.data[index].image,
                                  child: AspectRatio(
                                    aspectRatio: 2 / 3,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 12.w),
                                      child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                PageTransition(
                                                  type: PageTransitionType.fade,
                                                  curve: Curves.easeInOutBack,
                                                  duration: const Duration(
                                                      milliseconds: 700),
                                                  childCurrent:
                                                      const SizedBox(),
                                                  child: Detail_Screen(
                                                    snapshot.data[index],
                                                  ),
                                                ));
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(8.r),
                                            ),
                                            child: Stack(
                                              children: [
                                                Positioned.fill(
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.r),
                                                    child: ImageFade(
                                                      image: NetworkImage(
                                                          snapshot.data[index]
                                                              .image),
                                                      duration: const Duration(
                                                          seconds: 0),
                                                      syncDuration:
                                                          const Duration(
                                                              seconds: 0),
                                                      alignment:
                                                          Alignment.center,
                                                      fit: BoxFit.fill,
                                                      loadingBuilder: (context,
                                                              progress,
                                                              chunkEvent) =>
                                                          Center(
                                                              child: CircularProgressIndicator(
                                                                  value:
                                                                      progress *
                                                                          20)),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                    bottom: 0,
                                                    child: Container(
                                                      height: 35.h,
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width
                                                              .w,
                                                      decoration: BoxDecoration(
                                                          boxShadow: [
                                                            BoxShadow(
                                                                color: black
                                                                    .withOpacity(
                                                                        0.75),
                                                                blurRadius:
                                                                    12.r,
                                                                spreadRadius:
                                                                    12.r)
                                                          ]),
                                                    )),
                                                Positioned(
                                                    bottom: 5.h,
                                                    left: 10.w,
                                                    right: 10.w,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          snapshot
                                                              .data[index].title
                                                              .toString()
                                                              .toUpperCase(),
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: GoogleFonts
                                                              .electrolize(
                                                                  decoration:
                                                                      TextDecoration
                                                                          .none,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize:
                                                                      10.sp,
                                                                  color: white),
                                                        ),
                                                        Text(
                                                          snapshot
                                                              .data[index].cast,
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: GoogleFonts
                                                              .electrolize(
                                                                  decoration:
                                                                      TextDecoration
                                                                          .none,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize:
                                                                      9.sp,
                                                                  color: grey),
                                                        )
                                                      ],
                                                    )),
                                              ],
                                            ),
                                          )),
                                    ),
                                  ),
                                )
                              : SizedBox();
                        }),
                  );
                } else if (snapshot.hasError) {
                  return SizedBox(
                    height: 160.h,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return AspectRatio(
                            aspectRatio: 2 / 3,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10.w),
                              child: Shimmer.fromColors(
                                baseColor: grey.shade800,
                                highlightColor: grey.shade600,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(9.r),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  );
                } else {
                  return SizedBox(
                    height: 160.h,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return AspectRatio(
                            aspectRatio: 2 / 3,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10.w),
                              child: Shimmer.fromColors(
                                baseColor: grey.shade800,
                                highlightColor: grey.shade600,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(9.r),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  );
                }
              })
        ],
      ),
    );
  }
}
