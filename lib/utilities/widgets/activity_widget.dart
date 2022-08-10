import 'package:flutter/material.dart';
import 'package:learning_1ui_6228/utilities/widgets/big_text.dart';
import 'package:learning_1ui_6228/utilities/widgets/small_text.dart';
import 'package:intl/intl.dart';

class ActivityWidget extends StatelessWidget {
   ActivityWidget({Key? key, this.imageUrl, this.universityName, this.formattedDate}) : super(key: key);
  String? universityName;
  String? imageUrl;
  DateTime? formattedDate;

  @override
  Widget build(BuildContext context) {
   // DateTime now = DateTime.now();
    String format = DateFormat('EE, d-MMM, h.m').format(formattedDate!);

    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Column(
        children: [
          //icon and the text
          Row(
            children: [
              Icon(
                Icons.shopping_cart_outlined,
                size: 25,
                color: Colors.redAccent,
              ),
              SizedBox(
                width: 10,
              ),
              SmallText(
                content: 'Joined the list :',
                textSize: 14,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          // iamge text date
          Row(
            children: [
              //image
              CircleAvatar(
                backgroundImage: NetworkImage(
                    imageUrl??''),
                radius: 40,
              ),
              // name address
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BigText(
                      content: universityName??'',
                      overFlow: TextOverflow.ellipsis,
                      textSize: 16,
                    ),
                    SmallText(
                      content: "2016/2017",
                      textSize: 16,
                    ),
                    SmallText(content: format, textSize: 16),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
