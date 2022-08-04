import 'package:flutter/material.dart';
import 'package:learning_1ui_6228/utilities/widgets/big_text.dart';
import 'package:learning_1ui_6228/utilities/widgets/small_text.dart';

class ListTileWidgets extends StatelessWidget {
  String? name;
  String? followersCount;
  Widget iconWidget;
  String? imageUrl;
  String? address;
  String? following;


  ListTileWidgets(
      {Key? key,
      this.name,
      this.followersCount,
      required this.iconWidget,
      this.imageUrl,
      this.address,
      this.following})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 35,
        backgroundImage:  NetworkImage(imageUrl??''),
        // backgroundImage: NetworkImage(
        //     'https://teamgreen.org.in/wp-content/uploads/2019/07/boy-avatar-3.png'),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BigText(content:  name ?? ''),
          SmallText(content: address ?? ''),
        ],
      ),
      subtitle: Text(followersCount ?? ''),
      trailing: iconWidget,
    );
  }
}
