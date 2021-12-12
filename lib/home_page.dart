import 'dart:convert';

import 'package:dio_network/constant.dart';
import 'package:dio_network/model.dart';
import 'package:dio_network/network.dart';
import 'package:dio_network/publisher_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    getList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("text"),
      ),
    );
  }





  Future<List<MyModel>> getList() async {

    var dio = DioUtil.getInstance();
    final String apiUrl = (Constant.BASE_PATH + "publisher/");
    final response = await dio?.get(apiUrl);
    print(response?.data);
    if(response?.statusCode == 200) {

      // var list = (response?.data as List).map((x) => MyModel.fromJson(x)).toList();
      return (response?.data as List)
          .map((x) => MyModel.fromJson(x))
          .toList();

    } else {
      throw Exception("Failed to Load Detail Restaurant, Please Check Your Internet");
    }
  }




}
