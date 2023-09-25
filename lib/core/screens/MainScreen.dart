import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_fade/image_fade.dart';
import 'package:movieapp/animations/FadeIn_Animation.dart';
import 'package:movieapp/constsnts/colors.dart';
import 'package:movieapp/constsnts/global.dart';
import 'package:movieapp/core/Resources/network.dart';
import 'package:movieapp/core/screens/DetailsScreen.dart';
import 'package:movieapp/core/screens/SearchScreen.dart';
import 'package:movieapp/core/widgets/AllMovies.dart';
import 'package:movieapp/core/widgets/AppBar.dart';
import 'package:movieapp/core/widgets/GlobalMovieData.dart';
import 'package:movieapp/core/widgets/Promotion.dart';
import 'package:movieapp/core/widgets/ThrillerAndHorror.dart';
import 'package:movieapp/core/widgets/banner.dart';
import 'package:movieapp/core/widgets/category.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shimmer/shimmer.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 5, 0, 10),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomAppBar(),
              SizedBox(
                height: 20.h,
              ),
              const SearchBar(),
              SizedBox(
                height: 20.h,
              ),
              const FadeInBounce(child: RecentRelease()),
              SizedBox(
                height: 20.h,
              ),
              const FadeInBounce(child: Categories()),
              SizedBox(
                height: 20.h,
              ),
              const FadeInBounce(child: BannerHome()),
              SizedBox(
                height: 20.h,
              ),
              //bollywood
              const GlobalMoviesDatas(
                  category: "bollywood", title: "Bollywood"),
              SizedBox(
                height: 20.h,
              ),
              //enter your custom url and better to fetch from server

              Padding(
                  padding: defPadding,
                  child: const FadeInBounce(
                      child: Promotion(
                          heading: "PROMOTION",
                          image:
                              "https://www.crushpixel.com/big-static19/preview4/big-sale-discount-banner-template-3224496.jpg"))),
              SizedBox(
                height: 20.h,
              ),
              //hollywood
              const GlobalMoviesDatas(
                  category: "hollywood", title: "Hollywood"),
              SizedBox(
                height: 20.h,
              ),
              //series
              const GlobalMoviesDatas(
                  category: "series", title: "Trending Series"),
              SizedBox(
                height: 20.h,
              ),
              //enter your custom url and better to fetch from server

              Padding(
                padding: defPadding,
                child: const FadeInBounce(
                  child: Promotion(
                      heading: "TRENDING",
                      image:
                          "https://bigmovies.com.np/Modules/CineUploadFiles/Movie/HDImage/WEBSITE%20BANNER%20CK%20CINEMAS%20AND%20JAWAN_519226_784916.jpg"),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              //south movie
              const GlobalMoviesDatas(
                  category: "south", title: "South Dual Language"),
              SizedBox(
                height: 20.h,
              ),
              //romance
              const GlobalMoviesDatas(
                  category: "romance", title: "Romantic Love"),
              SizedBox(
                height: 20.h,
              ),
              const ThrillerMovie(),
              SizedBox(
                height: 20.h,
              ),
              //enter your custom url and better to fetch from server

              Padding(
                padding: defPadding,
                child: const FadeInBounce(
                  child: Promotion(
                      heading: "PROMOTION",
                      image:
                          "https://rakbank.ae/wps/wcm/connect/6e1d5db4-3405-4902-9707-485a48b9f8da/J241121---Zomato-Banner-Web.jpg?MOD=AJPERES&CACHEID=ROOTWORKSPACE-6e1d5db4-3405-4902-9707-485a48b9f8da-nRhFDMi"),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              //ott
              const GlobalMoviesDatas(category: "Ott Show", title: "OTT Shows"),
              SizedBox(
                height: 20.h,
              ),
              //enter your custom url and better to fetch from server
              Padding(
                padding: defPadding,
                child: const FadeInBounce(
                  child: Promotion(
                      heading: "HOT TOPIC",
                      image:
                          "https://incinemas.sg/movieshowtimes/Oppenheimer/banner.jpg"),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              const AllMoviesData()
            ],
          ),
        ),
      ),
    );
  }
}

class RecentRelease extends StatelessWidget {
  const RecentRelease({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
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
                "Recent Release",
                style: GoogleFonts.electrolize(
                    fontSize: 12.sp, fontWeight: FontWeight.bold, color: white),
              ),
            ],
          ),
        ),
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
                      itemCount: 10,
                      itemBuilder: (context, int index) {
                        return Hero(
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
                                          duration:
                                              const Duration(milliseconds: 700),
                                          childCurrent: const SizedBox(),
                                          child: Detail_Screen(
                                            snapshot.data[index],
                                          ),
                                        ));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    child: Stack(
                                      children: [
                                        Positioned.fill(
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.r),
                                            child: ImageFade(
                                              image: NetworkImage(
                                                  snapshot.data[index].image),
                                              duration:
                                                  const Duration(seconds: 0),
                                              syncDuration:
                                                  const Duration(seconds: 0),
                                              alignment: Alignment.center,
                                              fit: BoxFit.fill,
                                              loadingBuilder: (context,
                                                      progress, chunkEvent) =>
                                                  Center(
                                                      child:
                                                          CircularProgressIndicator(
                                                              value: progress *
                                                                  20)),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                            bottom: 0,
                                            child: Container(
                                              height: 30.h,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width
                                                  .w,
                                              decoration:
                                                  BoxDecoration(boxShadow: [
                                                BoxShadow(
                                                    color:
                                                        black.withOpacity(0.75),
                                                    blurRadius: 12.r,
                                                    spreadRadius: 12.r)
                                              ]),
                                            )),
                                        Positioned(
                                            bottom: 5.h,
                                            left: 10.w,
                                            right: 10.w,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  snapshot.data[index].title
                                                      .toString()
                                                      .toUpperCase(),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style:
                                                      GoogleFonts.electrolize(
                                                          decoration:
                                                              TextDecoration
                                                                  .none,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 10.sp,
                                                          color: white),
                                                ),
                                                Text(
                                                  snapshot.data[index].category,
                                                  style:
                                                      GoogleFonts.electrolize(
                                                          decoration:
                                                              TextDecoration
                                                                  .none,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 9.sp,
                                                          color: grey),
                                                )
                                              ],
                                            )),
                                        Positioned(
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 3.h, horizontal: 6.w),
                                            decoration: BoxDecoration(
                                                color: black,
                                                borderRadius:
                                                    BorderRadius.circular(1.r)),
                                            child: Text(
                                              "FHD",
                                              style: GoogleFonts.electrolize(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 7.sp,
                                                  color: yellow),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )),
                            ),
                          ),
                        );
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
                              highlightColor: grey.shade500,
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
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.fade,
                  curve: Curves.easeInOutBack,
                  duration: Duration(milliseconds: 700),
                  childCurrent: SizedBox(),
                  child: Search()),
            );
          },
          child: Container(
              height: 30.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: grey.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(5.r)),
              child: Row(
                children: [
                  SizedBox(
                    width: 13.w,
                  ),
                  const Icon(
                    Icons.search,
                    size: 20,
                    color: white,
                  ),
                  SizedBox(
                    width: 7.w,
                  ),
                  Text(
                    "Search Movies",
                    style:
                        GoogleFonts.electrolize(fontSize: 10.sp, color: white),
                  )
                ],
              )),
        ));
  }
}
