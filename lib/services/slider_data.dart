import 'dart:convert';

import 'package:news_app/models/slider_model.dart';
import 'package:http/http.dart' as http;

class Sliders{
  List<SliderModel> sliders=[];

  Future<void> getSliders() async{
    String url="https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=9e6d21d424a54dfcbef490fe976c43bc";
    var response=await http.get(Uri.parse(url));


    var jsonData=jsonDecode(response.body);

    if(jsonData['status']=="ok"){
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null) {
          SliderModel sliderModel = SliderModel(
              title: element['title'],
              description: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              content: element['content']
          );
          sliders.add(sliderModel);
        }

        });
    }

  }



}