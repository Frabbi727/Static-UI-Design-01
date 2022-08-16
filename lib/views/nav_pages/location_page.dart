import 'package:flutter/material.dart';

class LocationPage extends StatelessWidget {
  static const routename= 'location_page';
  const LocationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, 'extra_1');
            },
            child: Center(child: Text('Submit'))),
      ),
    );
  }
}
