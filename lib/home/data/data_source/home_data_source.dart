import 'package:dio/dio.dart';
import 'package:dio_example/core/network/network.dart';
import 'package:dio_example/home/data/model/comple_model_test/car_model.dart';
import 'package:dio_example/home/data/model/country.dart';
import 'package:dio_example/home/data/model/todo_model.dart';

import 'dart:convert';

abstract class HomeDataSource {
  Future<dynamic> getCountryInfo();

  Future<dynamic> getTodosList();
}

class IHomeDataSource extends HomeDataSource {
  @override
  Future<dynamic> getCountryInfo() async {
    // final dio= Dio();

    var dio = DioUtil.getInstance();
    const String apiUrl = ("https://api.ipbase.com/v1/json/");
    try {
      Response response = await dio!.get(apiUrl);

      if (response.statusCode == 204 || response.statusCode == 200) {
        try {
          var map = Map<String, dynamic>.from(response.data);
          try {
            Country model = Country.fromJson(map);
            return model;
          } catch (e) {
            return "error";
          }
        } catch (e) {
          return "error";
        }
      } else {
        return "error";
      }
    } on DioError catch (e) {
      // if (e.response?.statusCode == 500 || e.response?.statusCode == 502) {
      //   return "error";
      // } else {
      //   return "error";
      // }

      // to be detect by cubit class
      throw Exception(e.error.toString());
    }
  }

  @override
  Future<dynamic> getTodosList() async {
    // final dio= Dio();

    getComplexData();

    var dio = DioUtil.getInstance();
    const String apiUrl = ("https://jsonplaceholder.typicode.com/todos/");
    try {
      Response response = await dio!.get(apiUrl);

      if (response.statusCode == 204 || response.statusCode == 200) {
        final List<dynamic> jsonData = response.data;
        List<TodoModel> todoList = jsonData
            .map<TodoModel>((json) => TodoModel.fromJson(json))
            .toList();
        return todoList;
      } else {
        return "error";
      }
    } on DioError catch (e) {
      // to be detect by cubit class
      throw Exception(e.error.toString());
    }
  }

  // test an object that contain list and another object and some field

  @override
  Future<dynamic> getComplexData() async {
    CarModel model = CarModel(
        carList: [
          CarType(name: "benz", mfYear: "1990"),
          CarType(name: "pride", mfYear: "2005"),
          CarType(name: "peogeot", mfYear: "2010"),
        ],
        carObject: CarType(name: "benz" , mfYear: "2011"),
        title: "my Title",
        description: "my description");


    var myJson = jsonEncode(model);

    //{"carList":[{"name":"benz","mfYear":"1990"},{"name":"pride","mfYear":"2005"},{"name":"peogeot","mfYear":"2010"}],"carObject":{"name":"benz","mfYear":"2011"},"title":"my Title","description":"my description"}
    try {
      CarModel model = CarModel.fromJson(jsonDecode(myJson));
      var a = model;
    } catch (e) {
      return "error";
    }


  }


}
