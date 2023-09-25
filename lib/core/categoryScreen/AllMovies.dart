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

class ALlMovies extends StatelessWidget {
  const ALlMovies({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 5, 0, 10),
      body: SafeArea(
        child: FadeInBounce(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 12.h,),
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
                              "EXPLORE ALL MOOVIES",
                              style: GoogleFonts.electrolize(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                  color: white),
                            ),
                          ],
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
                        return  Padding(
                          padding:  EdgeInsets.only(right: 14.w),
                          child: Container(
                                     padding: EdgeInsets.symmetric(vertical: 5.h),
                            width: MediaQuery.of(context).size.width,
                            child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisExtent: 160.h,
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 10.h
                                ),
                                shrinkWrap: true,
                                itemCount: snapshot.data.length,
                                itemBuilder: (context, int index) {
                                  return  Hero(
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
                                        );
                                }),
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Container(
                          padding: EdgeInsets.symmetric(vertical: 5.h),
                          width: MediaQuery.of(context).size.width,
                          child: GridView.builder(
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisExtent: 160.h,
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 10.h
                                ),
                                shrinkWrap: true,
                                itemCount: 20,
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
                        return Container(
                          padding: EdgeInsets.symmetric(vertical: 5.h),
                          width: MediaQuery.of(context).size.width,
                          child: GridView.builder(
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisExtent: 160.h,
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 10.h
                                ),
                                shrinkWrap: true,
                                itemCount: 20,
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
          ),
        ),
      ),
    );
  }
}
