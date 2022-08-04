import 'package:flutter/material.dart';
import 'package:learning_1ui_6228/model/user_list.dart';
import 'package:learning_1ui_6228/utilities/app_colors.dart';
import 'package:learning_1ui_6228/utilities/helper.dart';
import 'package:learning_1ui_6228/utilities/widgets/app_line.dart';

import 'package:learning_1ui_6228/utilities/widgets/list_tile_widget.dart';
import 'package:learning_1ui_6228/utilities/widgets/search_user.dart';
import 'package:learning_1ui_6228/views/nav_pages/profile_page.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  //List<Map<String, dynamic>> allUser = UserList().allUser;
  //List<Map<String, dynamic>> findUser = [];
  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    searchedList = userList;
    super.initState();
  }



  // void searchUserFromList(String enteredWord) {
  //   print(enteredWord);
  //   List<Map<String, dynamic>> result = [];
  //
  //   print(' add result user result user $result');
  //   if (enteredWord.isEmpty) {
  //     result = allUser;
  //   } else {
  //     result = allUser
  //         .where((user) =>
  //             user["name"].toLowerCase().contains(enteredWord.toLowerCase()))
  //         .toList();
  //   }
  //   setState(() {
  //     findUser = result;
  //   });
  //   print('Find User from all user list $findUser');
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfff8f8fa),
        body: Column(
          children: [
            //1st Section
            Container(

              height: HelperClass.h250,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: AppColors.gradientColor,
                  ),
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(HelperClass.r10),
                      bottomLeft: Radius.circular(HelperClass.r10))),
              child: Column(
                children: <Widget>[
                  //Text and cross button
                  Container(
                    margin: EdgeInsets.only(
                        left: HelperClass.w10,
                        right: HelperClass.w10,
                        top: HelperClass.h20),
                    height: HelperClass.h50,
                    // color: Colors.red,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.clear,
                                  color: Colors.white,
                                  size: 30,
                                ))),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(right: 30),
                            alignment: Alignment.center,
                            //  color: Colors.lightBlueAccent,
                            child: Text(
                              'Search',
                              style: TextStyle(
                                  fontSize: HelperClass.t25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: HelperClass.h25,
                  ),
                  //Search Bar
                  Container(
                    margin: EdgeInsets.only(
                        left: HelperClass.w10, right: HelperClass.w10),
                    //color: Colors.amber,
                    height: HelperClass.h70,
                    width: double.infinity,
                    child: TextField(
                      controller: textController,
                      onChanged: (name) {
                        setState(() {
                          SearchUser().searchUser(name);
                        });
                      },
                      decoration: InputDecoration(
                        prefix: Icon(Icons.search, size: 26,),
                        suffix: IconButton(
                          onPressed: () {
                            setState(() {
                              textController.clear();
                              searchedList = userList;
                            });
                          },
                          icon: Icon(Icons.clear, size: 26,),
                        ),
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
                child: searchedList.isNotEmpty
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: searchedList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(

                              children: [
                                InkWell(
                                  onTap: (){
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ProfilePage(userName: searchedList[index].name, followers: searchedList[index].followers),
                                        ));
                                  } ,
                                  child: ListTileWidgets(
                                    url: searchedList[index].url.toString(),
                                    name: searchedList[index].name,
                                    followersCount:'Followers: ${searchedList[index].followers}',
                                    iconWidget: Icon(
                                      Icons.person_add_alt_outlined,
                                      color: Colors.red,
                                      size: 25,
                                    ),
                                  ),
                                ),
                                AppLine(
                                    paddingLeft: 10,
                                    paddingRight: 10,
                                    heightLine: 1,
                                    lineColor: Colors.grey),
                              ],
                            ),
                          );
                        })
                    : Container(
                        child: Text("No user Found"),
                      )),
          ],
        ),
      ),
    );
  }
}
