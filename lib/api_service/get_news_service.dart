import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/news_model.dart';

class GetnewsService {
  static DateTime dateTime = DateTime.now();
  static Future<NewsModel> getNewsWithModel() async {

    print("Date===>>${dateTime.toString().split(" ")[0]}");

    http.Response response = await http.get(Uri.parse(
        "https://newsapi.org/v2/everything?q=tesla&from=${dateTime.toString().split(" ")[0]}&sortBy=publishedAt&apiKey=7b13f03a264d400d9ac0c8854990972b"));
    return newsModelFromJson(response.body);
  }
}
