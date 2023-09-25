import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:movieapp/constsnts/colors.dart';
import 'package:movieapp/core/Resources/Apis.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> with TickerProviderStateMixin {

  var jsondata;
  List<Map<String, dynamic>> _allUsers = [];
  List<Map<String, dynamic>> _newlist = [];
  getdata() async {
    var response = await http.get(Uri.parse(urlApi));
    if (response.statusCode == 200) {
      jsondata = json.decode(response.body);
    } else {
      print("Error");
    }
    for (var i = 0; i < jsondata.length; i++) {
      _allUsers.add({
        "title": jsondata[i]["title"],
        "description": jsondata[i]["description"],
        "cast": jsondata[i]["cast"],
        "quality": jsondata[i]["quality"],
        "genre": jsondata[i]["genre"],
        "image": jsondata[i]["image"],
        "video": jsondata[i]["video"],
        "thumbnail": jsondata[i]["thumbnail"],
        "category": jsondata[i]["category"],
        "language": jsondata[i]["language"],
        "link": jsondata[i]["link"],
        "480p": jsondata[i]["link"]["480p"],
        "720p": jsondata[i]["link"]["720p"],
        "1080p": jsondata[i]["link"]["1080p"],
      });
    }

    setState(() {
      _newlist = _allUsers;
    });
  }

  void _searchlist(String value) {
    setState(() {
      if (value.isEmpty) {
        _newlist = _allUsers;
      } else {
        _newlist = _allUsers
            .where((element) => element['title']
                .toString()
                .toLowerCase()
                .contains(value.toString().toLowerCase()))
            .toList();
      }
    });
  }

  @override
  void initState() {
    getdata();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 5, 0, 10),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 13.h),
                child: Container(
                  height: 30.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(5.r)),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10.w,
                      ),
                      Expanded(
                        child: TextField(
                          onChanged: (value) {
                            _searchlist(value);
                          },
                          style: const TextStyle(color: white),
                          keyboardType: TextInputType.text,
                          autofocus: true,
                          decoration: InputDecoration.collapsed(
                              hintText: "Search for movies",
                              hintStyle: GoogleFonts.electrolize(
                                  color: white,
                                  fontSize: 9.sp,
                                  letterSpacing: 1)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _newlist.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.h),
                      child: InkWell(
                        onTap: () {
                          //CREATE A NEW DETAILS SCREEN AND PASS THE DATAS //
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: grey.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(5.r)),
                          padding: EdgeInsets.symmetric(
                              vertical: 5.h, horizontal: 12.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                _newlist[index]['title'] ?? "".toString(),
                                style: GoogleFonts.electrolize(
                                    color: white,
                                    letterSpacing: 1,
                                    fontSize: 9.sp),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios,
                                color: white,
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
