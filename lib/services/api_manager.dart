import 'dart:convert';

import 'package:genxp/constants/strings.dart';
import 'package:http/http.dart' as http;
import '../constants/strings.dart';

class API_manager {
  Future<NewsModel> getNews() async {
    var client = http.Client();
    var newsModel = null;
    try{
var response = await client.get(Uri.parse(Strings.new_url));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);
      newsModel = NewsModel.fromJson(jsonMap);
    }catch(Exception){
      return newsModel;
    };
    
    }
  }
}
