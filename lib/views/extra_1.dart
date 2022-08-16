import 'package:flutter/material.dart';

class Extra1 extends StatefulWidget {
  static const routename= 'extra_1';
  const Extra1({Key? key}) : super(key: key);

  @override
  State<Extra1> createState() => _Extra1State();
}

class _Extra1State extends State<Extra1> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.redAccent,
      body:Center(
        child: ElevatedButton(onPressed: (){
          Navigator.pushNamed(context, 'main_page');
        }, child: Text('GO BACK')),
      ),

    );
  }
}
