import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:learning_1ui_6228/utilities/app_colors.dart';
import 'package:learning_1ui_6228/utilities/helper.dart';
import 'package:learning_1ui_6228/utilities/widgets/app_line.dart';

import 'package:learning_1ui_6228/utilities/widgets/list_tile_widget.dart';

import 'package:learning_1ui_6228/views/nav_pages/profile_page.dart';
import 'package:http/http.dart' as http;

import '../model/UserModel.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  UserModel? userModel;

  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    initFunction();
    super.initState();
  }

  Future<UserModel?> fetchData() async {
    final response =
        await http.get(Uri.parse('https://reqres.in/api/users?page=2'));
    print('This is Response: ${response.body.toString()}');
    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      return throw Exception('Failed to load album');
    }
  }

  void initFunction() async {
    UserModel? data = await fetchData();
    setState(() {
      userModel = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    // print('user list ModelListdata + $userModel');

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
                          //searchUser(name);
                        });
                      },
                      decoration: InputDecoration(
                        prefix: Icon(
                          Icons.search,
                          size: 26,
                        ),
                        suffix: IconButton(
                          onPressed: () {
                            setState(() {
                              textController.clear();
                              //searchedList = userList;
                            });
                          },
                          icon: Icon(
                            Icons.clear,
                            size: 26,
                          ),
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
              child: FutureBuilder(
                  future: fetchData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: userModel!.data!.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ProfilePage(
                                            // userName:snapshot.data!.data![index].firstName??'',
                                            // userName: userModelList[index].data![index].firstName??'',
                                            userName: userModel!
                                                .data![index].firstName,

                                            //followers: snapshot.data!.data![index].id.toString(),
                                            //followers: userModelList[index].data![index].id.toString()??'N/A',

                                            followers: userModel!
                                                .data![index].id
                                                .toString(),
                                            // address: snapshot.data!.data![index].email.toString(),
                                            //address: userModelList[index].data![index].email??'',
                                            address:
                                                userModel!.data![index].email,

                                            //following: snapshot.data!.data![index].lastName.toString(),
                                            //following: userModelList[index].data![index].lastName,
                                            following: userModel!
                                                .data![index].lastName,
                                            //imageUrl: snapshot.data!.data![index].avatar.toString(),
                                            //imageUrl: userModelList[index].data![index].avatar??'N/A',
                                            imageUrl:
                                                userModel!.data![index].avatar,
                                          ),
                                        ));
                                  },
                                  child: ListTileWidgets(
                                    following: userModel!.data![index].lastName,
                                    address:
                                        userModel!.data![index].email ?? '',
                                    imageUrl:
                                        userModel!.data![index].avatar ?? 'N/A',
                                    name:
                                        userModel!.data![index].firstName ?? '',
                                    followersCount:
                                        'Followers: ${userModel!.data![index].lastName}',
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
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }

                    // By default, show a loading spinner.
                    return Center(child: CircularProgressIndicator());
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
