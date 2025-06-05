import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/models/category_news_model.dart';
import 'package:news_app/pages/article_view.dart';
import 'package:news_app/services/show_category_news.dart';

class CategoryNews extends StatefulWidget {
  String catName;

  CategoryNews({required this.catName});

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategories();

  }
  bool _loading=true;
  List<ShowCategoryModel> categoriesNews=[];


  getCategories()async{
    CategoryNewsShow newsShow=CategoryNewsShow();
    await newsShow.getCategoryNews(widget.catName.toLowerCase());
    categoriesNews=newsShow.showCategory;
    setState(() {
      _loading=false;
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
          widget.catName,
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
      
      body: _loading?Center(child: CircularProgressIndicator(
        color: Colors.orange.shade900,
      )): Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child:ListView.builder(
            itemCount: categoriesNews.length,
              shrinkWrap: true,
            physics: ClampingScrollPhysics(),
        
              itemBuilder:(context,index){
              return ShowCategoryNews(image: categoriesNews[index].urlToImage!, desc: categoriesNews[index].description!, title: categoriesNews[index].title!, url: categoriesNews[index].url!);
        
        
        
        
          })
        
          ),
      
    );
  }
}


class ShowCategoryNews extends StatelessWidget {
  String image,desc,title,url;
  ShowCategoryNews({required this.image,required this.desc,required this.title,required this.url});

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



