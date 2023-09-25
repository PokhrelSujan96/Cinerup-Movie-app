// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_fade/image_fade.dart';
import 'package:movieapp/constsnts/colors.dart';
import 'package:movieapp/core/Resources/network.dart';
import 'package:movieapp/core/screens/DetailsScreen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shimmer/shimmer.dart';

class GlobalCategory extends StatelessWidget {
  final String categoryName;
  final String category;
  const GlobalCategory(
      {super.key, required this.categoryName, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 5, 0, 10),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 5, 0, 10),
          automaticallyImplyLeading: false,
          centerTitle: true,
          elevation: 1,
          title: Text(
            categoryName,
            style: TextStyle(
              color: white,
              fontWeight: FontWeight.bold,
              fontSize: 12.sp,
            ),
          ),
          bottom: PreferredSize(
            child: Divider(color: white, thickness: 1.h),
            preferredSize: const Size.fromHeight(0),
          ),
        ),
        body: SafeArea(
            child: FutureBuilder(
                future: fetchMovie(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, int index) {
                            return (snapshot.data[index].category == category)
                                ? Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 5.h, horizontal: 10.w),
                                    child: IntrinsicHeight(
                                      child: Row(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                color: Colors.transparent,
                                                borderRadius:
                                                    BorderRadius.circular(9.r)),
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5.h,
                                                horizontal: 10.w),
                                            height: 180.h,
                                            width: 150.w,
                                            child: Hero(
                                              tag: snapshot.data[index].image,
                                              child: AspectRatio(
                                                aspectRatio: 2 / 3,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 0),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      Navigator.push(
                                                          context,
                                                          PageTransition(
                                                            type:
                                                                PageTransitionType
                                                                    .fade,
                                                            curve: Curves
                                                                .easeInOutBack,
                                                            duration:
                                                                const Duration(
                                                                    milliseconds:
                                                                        700),
                                                            childCurrent:
                                                                const SizedBox(),
                                                            child: Detail_Screen(
                                                                snapshot.data[
                                                                    index]),
                                                          ));
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Colors.transparent,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(9.r),
                                                      ),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        child: Card(
                                                          child: ImageFade(
                                                            image: NetworkImage(
                                                                snapshot
                                                                    .data[index]
                                                                    .image),
                                                            duration:
                                                                const Duration(
                                                                    seconds: 0),
                                                            syncDuration:
                                                                const Duration(
                                                                    seconds: 0),
                                                            alignment: Alignment
                                                                .center,
                                                            fit: BoxFit.fill,
                                                            placeholder: Shimmer
                                                                .fromColors(
                                                              baseColor:
                                                                  grey.shade800,
                                                              highlightColor:
                                                                  grey.shade600,
                                                              child:
                                                                  Container(),
                                                            ),
                                                            loadingBuilder: (context,
                                                                    progress,
                                                                    chunkEvent) =>
                                                                Center(
                                                                    child: CircularProgressIndicator(
                                                                        value: progress *
                                                                            20)),
                                                            errorBuilder:
                                                                (context,
                                                                        error) =>
                                                                    Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Shimmer
                                                                  .fromColors(
                                                                baseColor: grey
                                                                    .shade800,
                                                                highlightColor:
                                                                    grey.shade600,
                                                                child:
                                                                    Container(),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          //expanded
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  EdgeInsets.only(left: 10.w),
                                              child: Container(
                                                padding:
                                                    EdgeInsets.only(left: 10.w),
                                                decoration: BoxDecoration(
                                                  color: grey.withOpacity(0.1),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          9.r),
                                                ),
                                                height: 170.h,
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 10.w),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width
                                                            .w,
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    12.w,
                                                                vertical: 5.h),
                                                        decoration:
                                                            BoxDecoration(
                                                                color: grey
                                                                    .shade900),
                                                        child: Text(
                                                          "Movie Name : ${snapshot.data[index].title}",
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: GoogleFonts
                                                              .electrolize(
                                                                  color: white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  letterSpacing:
                                                                      1,
                                                                  fontSize:
                                                                      10.sp),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 5.h,
                                                      ),
                                                      Container(
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width
                                                            .w,
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    12.w,
                                                                vertical: 5.h),
                                                        decoration:
                                                            BoxDecoration(
                                                                color: grey
                                                                    .shade900),
                                                        child: Text(
                                                          "Cast : ${snapshot.data[index].cast}",
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: GoogleFonts
                                                              .electrolize(
                                                                  color: white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  letterSpacing:
                                                                      1,
                                                                  fontSize:
                                                                      10.sp),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 5.h,
                                                      ),
                                                      Container(
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width
                                                            .w,
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    12.w,
                                                                vertical: 5.h),
                                                        decoration:
                                                            BoxDecoration(
                                                                color: grey
                                                                    .shade900),
                                                        child: Text(
                                                          "Avalable : ${snapshot.data[index].quality}",
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: GoogleFonts
                                                              .electrolize(
                                                                  color: white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  letterSpacing:
                                                                      1,
                                                                  fontSize:
                                                                      10.sp),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 5.h,
                                                      ),
                                                      Container(
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width
                                                            .w,
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    12.w,
                                                                vertical: 5.h),
                                                        decoration:
                                                            BoxDecoration(
                                                                color: grey
                                                                    .shade900),
                                                        child: Text(
                                                          "Genre : ${snapshot.data[index].genre}",
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: GoogleFonts
                                                              .electrolize(
                                                                  color: white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  letterSpacing:
                                                                      1,
                                                                  fontSize:
                                                                      10.sp),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 5.h,
                                                      ),
                                                      Container(
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width
                                                            .w,
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    12.w,
                                                                vertical: 5.h),
                                                        decoration:
                                                            BoxDecoration(
                                                                color: grey
                                                                    .shade900),
                                                        child: Text(
                                                          "Language : ${snapshot.data[index].language}",
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: GoogleFonts
                                                              .electrolize(
                                                                  color: white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  letterSpacing:
                                                                      1,
                                                                  fontSize:
                                                                      10.sp),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20.w,
                                          ),
                                          Container(
                                            width: 2.w,
                                            decoration: const BoxDecoration(
                                                color: yellow),
                                          ),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                : const SizedBox();
                          }),
                    );
                  } else if (snapshot.hasError) {
                    return Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 10,
                          itemBuilder: (context, int index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 5.h),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 10.w),
                                    child: Shimmer.fromColors(
                                      baseColor: black,
                                      highlightColor: grey.shade300,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: grey.withOpacity(0.1),
                                            borderRadius:
                                                BorderRadius.circular(9.r)),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 5.h, horizontal: 10.w),
                                        height: 170.h,
                                        width: 150.w,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),

                                  //expanded
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 10.w),
                                      child: Shimmer.fromColors(
                                        baseColor: black,
                                        highlightColor: grey.shade300,
                                        child: Container(
                                          padding: EdgeInsets.only(left: 10.w),
                                          decoration: BoxDecoration(
                                              color: grey.withOpacity(0.1),
                                              borderRadius:
                                                  BorderRadius.circular(9.r)),
                                          height: 170.h,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    );
                  } else {
                    return Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: (context, int index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 5.h,
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 10.w),
                                    child: Shimmer.fromColors(
                                      baseColor: black,
                                      highlightColor: grey.shade300,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: grey.withOpacity(0.1),
                                            borderRadius:
                                                BorderRadius.circular(9.r)),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 5.h, horizontal: 10.w),
                                        height: 170.h,
                                        width: 150.w,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  //expanded
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 10.w),
                                      child: Shimmer.fromColors(
                                        baseColor: black,
                                        highlightColor: grey.shade300,
                                        child: Container(
                                          padding: EdgeInsets.only(left: 10.w),
                                          decoration: BoxDecoration(
                                              color: grey.withOpacity(0.1),
                                              borderRadius:
                                                  BorderRadius.circular(9.r)),
                                          height: 170.h,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    );
                  }
                })));
  }
}
