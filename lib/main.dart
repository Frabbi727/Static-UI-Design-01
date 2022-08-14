import 'package:flutter/material.dart';
import 'package:learning_1ui_6228/views/extra_1.dart';

import 'package:learning_1ui_6228/views/first_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_1ui_6228/views/main_pages.dart';
import 'package:learning_1ui_6228/views/nav_pages/location_page.dart';
import 'package:learning_1ui_6228/views/nav_pages/post_data_page.dart';
import 'package:learning_1ui_6228/views/nav_pages/profile_page.dart';
import 'package:learning_1ui_6228/views/nav_pages/to_page.dart';
void main() {
  runApp( MyApp());
 // runApp( YourApp());

}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context , child){
        return MaterialApp(
          debugShowCheckedModeBanner: false,

         // home: MainPage(),
          initialRoute: '/',
          routes: {
            '/': (context)=> MainPage(),
            'first_screen': (context)=> FirstScreen(),
            'profile_page': (context)=> ProfilePage(),

            'location_page':(context)=>LocationPage(),
           'to_do_page':(context)=>ToDoPage(),

           'last_page':(context)=> LastPage(),
            'extra_1':(context)=>Extra1(),


          },
        );
      },
    );
  }
}


