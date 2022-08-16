import 'package:flutter/material.dart';

import '../utilities/app_colors.dart';
import '../utilities/helper.dart';
import '../utilities/widgets/action_button.dart';
import '../utilities/widgets/big_text.dart';
import '../utilities/widgets/small_text.dart';

class DisplayProductDetails extends StatefulWidget {
  static const routename = 'display_product_details';
  String? productId;
  String? productName;
  String? dateTIme;
  String? productIamge;

  DisplayProductDetails(
      {Key? key,
      this.productId,
      this.dateTIme,
      this.productName,
      this.productIamge})
      : super(key: key);

  @override
  State<DisplayProductDetails> createState() => _DisplayProductDetailsState();
}

class _DisplayProductDetailsState extends State<DisplayProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
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
                      Navigator.pop(context, 'profile_page');
                      //Navigator.pushNamed(context, 'main_page');
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
                            NetworkImage(widget.productIamge.toString()),
                        radius: HelperClass.r50,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      // Name and Address
                      Column(
                        children: [
                          BigText(
                            content: widget.productName.toString(),
                            textColor: Colors.black,
                            textSize: 24,
                          ),
                          //Text('WIll Smith'),
                          SmallText(
                            content: widget.dateTIme.toString(),
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
                                  content: widget.productId.toString(),
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
                                  content: 'n/a',
                                ),
                                SmallText(
                                  content: 'Following',
                                  textSize: 16,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
