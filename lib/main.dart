import 'package:flutter/material.dart';
import 'package:learning_1ui_6228/views/first_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_1ui_6228/views/main_pages.dart';
void main() {
  runApp( MyApp());
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

          home: MainPage(),
        );
      },
    );
  }
}


