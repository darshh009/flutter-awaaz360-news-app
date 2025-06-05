import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/article_model.dart';
import '../models/slider_model.dart';
import '../services/news.dart';
import '../services/slider_data.dart';
import 'article_view.dart';

class AllNews extends StatefulWidget {
  String news;
  AllNews({required this.news});

  @override
  State<AllNews> createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {




  @override
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSliders();
    getNews();
  }

  List<SliderModel> sliders = [];
  List<ArticleModel> articles = [];
  bool _loading=true;

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  getSliders() async {
    Sliders sliderclass = Sliders();
    await sliderclass.getSliders();
    sliders = sliderclass.sliders;
    setState(() {
      _loading = false;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(100, 112, 225, 245),
                Color.fromARGB(100, 255, 209, 148),
              ],
              // Light Orange to Light Blue
              begin: Alignment.topLeft,
              end: Alignment.topRight,
            ),
          ),
        ),

        title:Text(
          widget.news+" News",
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.blue.shade900,
            shadows: [
              Shadow(
                blurRadius: 2.0,
                color: Colors.black38,
                offset: Offset(2, 2),
              ),
            ],
          ),
        ),
        centerTitle: true,

      ),

      body: Container(
        child:ListView.builder(
            itemCount:widget.news=="Breaking"?sliders.length:articles.length,
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemBuilder: (context,index){
              return AllNewsShow(
                  image: widget.news=="Breaking"?sliders[index].urlToImage!:articles[index].urlToImage!,
                  desc: widget.news=="Breaking"?sliders[index].description!:articles[index].description!,
                  title: widget.news=="Breaking"?sliders[index].title!:articles[index].title!,
                  url:widget.news=="Breaking"?sliders[index].url!:articles[index].url!
              );


        })

      ),

    );
  }
}

class AllNewsShow extends StatelessWidget {
  String image,desc,title,url;
  AllNewsShow({required this.image,required this.desc,required this.title,required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ArticleView(blogUrl: url)));

      },
      child: Container(
        padding: EdgeInsets.only(top:5,bottom: 10),
        child: Card(
          shadowColor: Colors.orange.shade100,
          elevation:10,
          color:Colors.blueGrey.shade50,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: CachedNetworkImage(imageUrl: image,
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(top:7,left: 10),
                child: Text(title,
                  maxLines: 3,
                  style: TextStyle(
                      fontSize: 20,
                      color: Color(0xff151B54),
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.kanit().fontFamily

                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("${desc} read more....",
                  maxLines: 3,
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey.shade700,
                      fontFamily: GoogleFonts.kanit().fontFamily


                  ),

                ),
              ),

            ],

          ),
        ),



      ),
    );
  }
}

