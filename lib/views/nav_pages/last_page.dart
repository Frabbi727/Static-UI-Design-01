import 'dart:convert';

import 'package:flutter/material.dart';

import '../../model/PostApiData.dart';
import 'package:http/http.dart' as http;
Future<PostApiData> createAlbum(String name, String job ) async {
  final response = await http.post(
    Uri.parse('https://reqres.in/api/users'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<dynamic, dynamic>{
      'name': name,
      'job':job,

    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return PostApiData.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}

// class Album {
//   final int id;
//   final String title;
//
//   const Album({required this.id, required this.title});
//
//   factory Album.fromJson(Map<String, dynamic> json) {
//     return Album(
//       id: json['id'],
//       title: json['title'],
//     );
//   }
// }

class LastPage extends StatefulWidget {
   LastPage({super.key});

  @override
  State<LastPage> createState() {
    return _LastPageState();
  }
}

class _LastPageState extends State<LastPage> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller1 = TextEditingController();
  Future<PostApiData>? _futureAlbum;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Create Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Create Data Example'),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: (_futureAlbum == null) ? buildColumn() : buildFutureBuilder(),
        ),
      ),
    );
  }

  buildColumn() {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: _controller,
          decoration:  InputDecoration(hintText: 'Enter Name',border: OutlineInputBorder()),
        ),
        SizedBox(height: 10,),
        TextField(
          controller: _controller1,
          decoration:  InputDecoration(hintText: 'Enter Job', border: OutlineInputBorder()),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _futureAlbum = createAlbum(_controller.text,
                  _controller1.text
              );
            });
          },
          child:  Text('Create Data'),
        ),
      ],
    );
  }

  FutureBuilder<PostApiData> buildFutureBuilder() {
    return FutureBuilder<PostApiData>(
      future: _futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              Text(snapshot.data!.name.toString(), style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
              Text(snapshot.data!.job.toString(),style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            ],
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
