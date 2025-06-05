import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/category_news_model.dart';





class CategoryNewsShow{
  List<ShowCategoryModel> showCategory=[];

  Future<void> getCategoryNews(String categories) async {
    String url="https://newsapi.org/v2/top-headlines?country=us&category=$categories&apiKey=9e6d21d424a54dfcbef490fe976c43bc";
    var response=await http.get(Uri.parse(url));
    var jsonData=jsonDecode(response.body);

    if(jsonData['status']=="ok"){
      jsonData["articles"].forEach((element) {
        if(element['urlToImage']!=null && element['content']!=null){
          ShowCategoryModel showModel=ShowCategoryModel(
            title: element['title'],
            description: element['description'],
            url: element['url'],
            urlToImage: element['urlToImage'],
            content: element['content'],
          );
          showCategory.add(showModel);
        }

      });
    }
  }
}