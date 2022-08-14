import 'package:flutter/material.dart';

class Extra1 extends StatelessWidget {
  const Extra1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body:Center(
        child: ElevatedButton(onPressed: (){
          Navigator.pushNamed(context, 'first_screen');
        }, child: Text('GO BACK')),
      ),

    );
  }
}
