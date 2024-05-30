import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:nyews_app/models/news_model.dart';

class Repository {
  final _baseUrl = 'https://api.spaceflightnewsapi.net/v3/articles';

  Future<List<News>> getData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body);
        List<News> news = it.map((e) => News.fromJson(e)).toList();
        return news;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      rethrow;
    }
  }

  Future<News> getDataById(int id) async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/$id'));

      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        News newsDetail = News.fromJson(json);
        return newsDetail;
      } else {
        throw Exception('Failed to load detail news');
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      rethrow;
    }
  }
}
