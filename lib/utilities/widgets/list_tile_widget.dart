import 'package:flutter/material.dart';

class ListTileWidgets extends StatelessWidget {
  String? name;
  String? followersCount;
  Widget iconWidget;
  String? url;
   ListTileWidgets({Key? key, this.name,  this.followersCount,   required this.iconWidget, this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 35,
        backgroundImage:  NetworkImage('https://teamgreen.org.in/wp-content/uploads/2019/07/boy-avatar-3.png') ,


          ),
      title: Text(name??''),
      subtitle: Text(followersCount??''),
      trailing: iconWidget,

    );
  }
}
