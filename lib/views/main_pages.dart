import 'package:flutter/material.dart';
import 'package:learning_1ui_6228/views/first_screen.dart';
import 'package:learning_1ui_6228/views/nav_pages/post_data_page.dart';
import 'package:learning_1ui_6228/views/nav_pages/location_page.dart';
import 'package:learning_1ui_6228/views/nav_pages/profile_page.dart';
import 'package:learning_1ui_6228/views/nav_pages/to_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    // 'first_screen',
    // 'location_page',
    // 'to_do_page',
    // 'profile_page',
    // 'last_page',
    FirstScreen(),
    LocationPage(),
    ToDoPage(),
    ProfilePage(),
    LastPage(),
  ];
  int currentPageIndex = 0;

  void onTapPage(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        type: BottomNavigationBarType.fixed,
        // backgroundColor: Colors.red,
        onTap: onTapPage,

        selectedItemColor: Color(0xffffb9b7),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        currentIndex: currentPageIndex,
        items: [
          BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              label: 'Location ', icon: Icon(Icons.location_pin)),
          BottomNavigationBarItem(
              label: 'To DO ', icon: Icon(Icons.calendar_today)),
          BottomNavigationBarItem(label: 'Profile', icon: Icon(Icons.person)),
          BottomNavigationBarItem(label: 'Last', icon: Icon(Icons.abc_rounded)),
        ],
      ),
    );
  }
}
