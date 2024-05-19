import 'dart:convert';

import 'package:first_api_learn/modal/data_modal.dart';
import 'package:first_api_learn/modal/todo_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DataModal? allData;

  Color dfltclr= Colors.amber.shade200;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getApiData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('api learn'),
      ),
      body:allData!=null ? allData!.todos!.isNotEmpty ? ListView.builder(
          itemCount: allData!.todos!.length,itemBuilder: (context,index){
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            height: 80,
            decoration: BoxDecoration(
              color:allData!.todos![index].completed != true ? dfltclr :Colors.lightGreenAccent,
              borderRadius: BorderRadius.circular(15),
              ),


            child: ListTile(
              title: Text("${allData!.todos![index].todo}"),
              subtitle:Text("${allData!.todos![index].completed}"),

            ),
          ),
        );
      }) : Center(child: Text("No Todos found"))
          :Center(child: CircularProgressIndicator()),
    );
  }

  getApiData() async {
    String url="https://dummyjson.com/todos";
    var response=await http.get(Uri.parse(url));

    if(response.statusCode==200){
      var mData=response.body;
      var rawData=jsonDecode(mData);
      allData=DataModal.fromJson(rawData);
      setState(() { });
    }


  }




}
