import 'package:flutter/material.dart';
import 'package:learning_1ui_6228/model/user_list.dart';
import 'package:learning_1ui_6228/utilities/app_colors.dart';
import 'package:learning_1ui_6228/utilities/helper.dart';
import 'package:learning_1ui_6228/utilities/widgets/app_line.dart';

import 'package:learning_1ui_6228/utilities/widgets/list_tile_widget.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  List<Map<String, dynamic>> allUser = UserList().allUser;
  List<Map<String, dynamic>> findUser = [];
  TextEditingController textController= TextEditingController();

  @override
  void initState() {
    findUser = allUser;
    super.initState();
  }

  void searchUserFromList(String enteredWord) {
    print(enteredWord);
    List<Map<String, dynamic>> result = [];
    print('THis result List'+ result.toString());
    if (enteredWord.isEmpty) {
      result = allUser;
    } else {
      result = allUser
          .where((user) =>
              user["name"].toLowerCase().contains(enteredWord.toLowerCase()))
          .toList();
    }
    setState(() {
      findUser = result;
    });
    print(findUser);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xfff8f8fa),
        body: Column(
          children: [
            //1st Section
            Container(
              // color: Colors.white,
              //height: HelperClass.h250,
              height: HelperClass.h200,
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
                    height: HelperClass.h30,
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
                      onChanged: (value)=>searchUserFromList(value),

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
                child: findUser.isNotEmpty
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: findUser.length,
                        itemBuilder: (context, index) {
                          

                          return Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              key: ValueKey(findUser[index]),
                              children: [
                                ListTileWidgets(
                                  name: allUser[index]['name'],
                                  followersCount: allUser[index]['Followers'],
                                  iconWidget: Icon(
                                    Icons.person_add_alt_outlined,
                                    color: Colors.red,
                                    size: 25,
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
