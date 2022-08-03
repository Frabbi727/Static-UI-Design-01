import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:learning_1ui_6228/utilities/app_colors.dart';
import 'package:learning_1ui_6228/utilities/widgets/app_line.dart';

import 'package:learning_1ui_6228/utilities/widgets/list_tile_widget.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfff8f8fa),
        // appBar: AppBar(
        //   backgroundColor:Color(0xffff7d82),
        //   title: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //     children: [
        //       Container(
        //           color: Colors.grey,
        //           child: IconButton(
        //               onPressed: () {}, icon: Icon(Icons.clear))),
        //       Expanded(
        //         child: Container(
        //           alignment: Alignment.center,
        //           color: Colors.lightBlueAccent,
        //           child: Text(
        //             'Search',
        //             style: TextStyle(
        //                 fontSize: 25, fontWeight: FontWeight.bold),
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        //   centerTitle: true,
        //
        //
        // ),

        body: Column(
          children: [
            //1st Section
            Container(
              // color: Colors.white,
              //height: HelperClass.h250,
              height: 200,
              decoration: BoxDecoration(
                  //color: Color(0xffff7d82),
                gradient: LinearGradient(
                  colors: AppColors.gradientColor,
                  // [
                  //   Color(0xffff7d82),
                  //   Color(0xffff7885),
                  //   Color(0xffffa88a),
                  //   Color(0xffff8e87),
                  //   Color(0xffff9674),
                  //   Color(0xffff9d71),
                  //   Color(0xffffa06e),
                  //   Color(0xffffac82),
                  //   Color(0xffffab69),
                  // ],
                ),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10))),
              child: Column(
                children: <Widget>[
                  //Text and cross button
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10, top: 20),
                    height: 50,
                    // color: Colors.red,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            // color: Colors.grey,
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.clear,
                                  color: Colors.white,
                                  size: 30,
                                ))),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                          //  color: Colors.lightBlueAccent,
                            child: Text(
                              'Search',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  //Search Bar
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    //color: Colors.amber,
                    height: 70,
                    width: double.infinity,
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        suffixIcon: Icon(Icons.clear),
                        hintText: 'Search',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(3),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // List View
            Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 15,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            ListTileWidgets(
                                name: 'MD Fazle Rabbi',
                              followersCount: '400 Followers',
                              iconWidget: Icon(Icons.person_outline_outlined, color: Colors.red,size: 25,),
                            ),
                           AppLine(paddingLeft: 10, paddingRight: 10, heightLine: 1, lineColor: Colors.grey),
                          ],
                        ),
                      );
                    })),
          ],
        ),
      ),
    );
  }
}
