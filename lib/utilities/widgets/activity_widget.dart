import 'package:flutter/material.dart';
import 'package:learning_1ui_6228/utilities/widgets/big_text.dart';
import 'package:learning_1ui_6228/utilities/widgets/small_text.dart';
import 'package:intl/intl.dart';

class ActivityWidget extends StatelessWidget {
  const ActivityWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
    return Container(
      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Column(
        children: [
          //icon and the text
          Row(
            children: [
              Icon(Icons.shopping_cart_outlined, size: 25, color: Colors.redAccent,),
              SizedBox(
                width: 10,
              ),
              SmallText(
                content: 'Joined the list :',
                textSize: 14,
              ),
            ],
          ),
          SizedBox(height: 20,),
          // iamge text date
          Row(
            children: [
              //image
              CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://pics.freeicons.io/uploads/icons/png/9311412861606062171-512.png'),
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
                      content: 'Hilsson collages Uk',
                      textSize: 16,
                    ),
                    SmallText(
                      content: "2016/2017",
                      textSize: 16,
                    ),
                    SmallText(content: formattedDate, textSize: 16),
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
