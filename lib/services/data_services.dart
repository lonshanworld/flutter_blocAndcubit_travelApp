import 'dart:convert';
import "package:http/http.dart" as http;

import '../models/data_model.dart';

class DataServices{
  String baseUrl = "https://fluttertrip-44558-default-rtdb.asia-southeast1.firebasedatabase.app";

  Future<List<DataModel>>getInfo() async{
    var apiUrl = "/getplaces.json";
    http.Response response =await http.get(Uri.parse(baseUrl+apiUrl));
    try{
      if(response.statusCode == 200){
        List<dynamic> list = json.decode(response.body);
        print(list);
        return list.map((e) => DataModel.fromJson(e)).toList();
      }else{
        return <DataModel>[];
      }
    }catch(err){
      print(err);
      rethrow;
    }
  }

}