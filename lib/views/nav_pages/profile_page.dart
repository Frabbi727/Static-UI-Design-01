import 'package:flutter/material.dart';
import 'package:learning_1ui_6228/utilities/app_colors.dart';
import 'package:learning_1ui_6228/utilities/helper.dart';
import 'package:learning_1ui_6228/utilities/widgets/action_button.dart';
import 'package:learning_1ui_6228/utilities/widgets/activity_widget.dart';
import 'package:learning_1ui_6228/utilities/widgets/app_line.dart';
import 'package:learning_1ui_6228/utilities/widgets/big_text.dart';
import 'package:learning_1ui_6228/utilities/widgets/list_tile_widget.dart';
import 'package:learning_1ui_6228/utilities/widgets/small_text.dart';
import 'package:learning_1ui_6228/views/first_screen.dart';
import 'package:learning_1ui_6228/views/main_pages.dart';

class ProfilePage extends StatelessWidget {
  String? userName;
  String? address;
  String? followers;
  String? following;
  String? imageUrl;


  ProfilePage({Key? key, this.userName, this.address, this.followers,this.following, this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MainPage()),
                      );
                    },
                    icon: Icon(Icons.arrow_back_ios_new)),
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.messenger_outline)),
              ],
            ),
            expandedHeight: MediaQuery.of(context).size.height * .5,
            // expandedHeight: 400,

            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: AppColors.gradientColor,
                ),
              ),
              child: FlexibleSpaceBar(
                background: Padding(
                  padding: EdgeInsets.only(
                    top: HelperClass.h20,
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 40,
                      ),
                      CircleAvatar(
                        backgroundImage:
                            NetworkImage(imageUrl.toString()),
                        radius: HelperClass.r50,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      // Name and Address
                      Column(
                        children: [
                          BigText(
                            content: userName.toString(),
                            textColor: Colors.black,
                            textSize: 24,
                          ),
                          //Text('WIll Smith'),
                          SmallText(
                            content: address??'N/A',
                            textColor: Colors.black,
                            textSize: 14,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // Followers, Following, Follow
                      Container(
                        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BigText(
                                  content: followers.toString(),
                                ),
                                SmallText(
                                  content: 'Followers',
                                  textSize: 16,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BigText(
                                  content: following??'n/a',
                                ),
                                SmallText(
                                  content: 'Following',
                                  textSize: 16,
                                )
                              ],
                            ),
                            InkWell(
                              child: ActionButton(
                                buttonName: 'Follow',
                                buttonWidth: HelperClass.h100,
                                buttonHeight: HelperClass.w50,
                                buttonTextColor: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 20, 0, 20),
                color: Colors.white,
                width: double.maxFinite,
                child: BigText(content: 'Activities'),
              ),
            ),
          ),
          SliverList(
              delegate:
                  SliverChildBuilderDelegate(childCount: 20, (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  ActivityWidget(),
                  AppLine(
                    heightLine: 2,
                    paddingLeft: 0,
                    paddingRight: 0,
                    lineColor: Colors.black12,
                  )
                ],
              ),
            );
          })),
        ],
      ),
    );
  }
}
