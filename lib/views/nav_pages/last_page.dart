import 'package:flutter/material.dart';

import '../../model/PostApiData.dart';
import 'package:http/http.dart' as http;

class LastPage extends StatelessWidget {
   LastPage({Key? key}) : super(key: key);
   PostApiData? apiPostData;
  TextEditingController textEditingController01= TextEditingController();
  TextEditingController textEditingController02= TextEditingController();
Future<PostApiData?> postData(String name, String job) async{
  var response =await http.post(Uri.parse('https://reqres.in/api/users'),body: {
    'name':name, 'job':job,
  });
  var data=  response.body;
  if(response.statusCode==201){
    String responseString= response.body;

    
  }

}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          margin: EdgeInsets.only(top: 20),
          child: Column(

            children: [
              TextField(
                controller: textEditingController01,
                decoration: InputDecoration(

                  hintText: 'Enter Name',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                controller: textEditingController02,
                decoration: InputDecoration(

                    hintText: 'Enter Job',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(10)
                    )
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: (){}, child: Text('Submit')),
            ],
          ),
        ),
      ),
    );
  }
}
