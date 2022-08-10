import 'package:flutter/material.dart';
import 'package:learning_1ui_6228/utilities/widgets/big_text.dart';
import 'package:learning_1ui_6228/utilities/widgets/small_text.dart';
import 'package:intl/intl.dart';

class ActivityWidget extends StatelessWidget {
   ActivityWidget({Key? key, this.imageUrl, this.productId, this.formattedDate,this.name, this.price, }) : super(key: key);
  String? productId;
  String? imageUrl;
  DateTime? formattedDate;
  String? name;
  String? price;


  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String format = DateFormat('EE, d-MMM, h.m').format(now);

    return  Card(

      surfaceTintColor: Colors.redAccent,
      color: Colors.redAccent,
      shadowColor: Colors.black45,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),

      elevation: 50,
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            //icon and the text
            Row(
              children: [
                Icon(
                  Icons.shopping_cart_outlined,
                  size: 25,
                  color: Colors.black,
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
                        content: productId??'',
                        overFlow: TextOverflow.ellipsis,
                        textSize: 16,
                      ),
                      SmallText(
                        content: name??'',
                        textSize: 16,
                      ),
                      SmallText(content: price.toString(), textSize: 16),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
