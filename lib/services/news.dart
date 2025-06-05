import 'dart:convert';

import 'package:news_app/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];


  /// get news function to get the news from the api in future like multi ui threading
  Future<void> getNews() async {
    String url = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=9e6d21d424a54dfcbef490fe976c43bc";
    var response = await http.get(Uri.parse(url));



    /// decode the json data
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if(element['urlToImage']!=null && element['content']!=null){
          ArticleModel articleModel=ArticleModel(
            title: element['title'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['content'],
          );
          news.add(articleModel);
        }

      });
    }
  }
}