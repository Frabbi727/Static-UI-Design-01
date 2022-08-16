import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learning_1ui_6228/views/display_product_details.dart';
import 'package:learning_1ui_6228/views/extra_1.dart';

import 'package:learning_1ui_6228/views/first_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_1ui_6228/views/main_pages.dart';
import 'package:learning_1ui_6228/views/nav_pages/location_page.dart';
import 'package:learning_1ui_6228/views/nav_pages/post_data_page.dart';
import 'package:learning_1ui_6228/views/nav_pages/profile_page.dart';
import 'package:learning_1ui_6228/views/nav_pages/to_page.dart';

void main() {
  runApp(MyApp());
  // runApp( YourApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,

          // home: MainPage(),
          initialRoute: '/',

          onGenerateRoute: generateRoute,
        );
      },
    );
  }
}

Route<dynamic>? generateRoute(RouteSettings settings) {
  final arg = settings.arguments;
  print(arg);
  if (settings.name == '/') {
    return MaterialPageRoute(builder: (context) => MainPage());
  } else if (settings.name == 'first_screen') {
    MaterialPageRoute(builder: (context) => FirstScreen());
  } else if (settings.name == ProfilePage.routename) {
    final argument = arg as ProfilePage;
    print(argument);
    return MaterialPageRoute(
      builder: (context) => ProfilePage(
        userName: argument.userName,
        address: argument.address,
        following: argument.following,
        followers: argument.followers,
        imageUrl: argument.imageUrl,
      ),
    );
  } else if (settings.name == Extra1.routename) {
    return MaterialPageRoute(builder: (context) => Extra1());
  } else if (settings.name == MainPage.routename) {
    return MaterialPageRoute(builder: (context) => MainPage());
  } else if (settings.name == DisplayProductDetails.routename) {
    final argument = arg as DisplayProductDetails;
    return MaterialPageRoute(
      builder: (context) => DisplayProductDetails(
        productIamge: argument.productIamge,
        productName: argument.productName,
        dateTIme: argument.dateTIme,
        productId: argument.productId,
      ),
    );
  }
}
