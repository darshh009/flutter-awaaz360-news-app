import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/models/slider_model.dart';
import 'package:news_app/pages/all_news.dart';
import 'package:news_app/pages/article_view.dart';
import 'package:news_app/services/data.dart';
import 'package:news_app/services/slider_data.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../services/news.dart';
import 'blog_tile.dart';
import 'category_news.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];
  List<SliderModel> sliders = [];
  List<ArticleModel> articles = [];
  bool _loading = true;

  int activeIndex = 0;

  @override
  void initState() {
    categories = getCategories();
    getNews();
    getSliders();
    super.initState();
  }

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
        backgroundColor: Colors.white,
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Awaaz",
              style: GoogleFonts.poppins(
                fontSize: 35,
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
            SizedBox(width: 4),
            Text(
              "360",
              style: GoogleFonts.teko(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: Colors.orange.shade900,
                shadows: [
                  Shadow(
                    blurRadius: 2.0,
                    color: Colors.grey,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      body:
      _loading
          ? Center(
        child: CircularProgressIndicator(color: Colors.orange.shade900),
      )
          : SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  margin: EdgeInsets.only(left: 10),
                  height: 70,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return CategoryTile(
                        image: categories[index].image,
                        categoryName: categories[index].categoryName,
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 30),

              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Breaking News 🔥",
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontFamily:
                        GoogleFonts
                            .outfit(
                          fontWeight: FontWeight.bold,
                        )
                            .fontFamily,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (
                            context) => AllNews(news: "Breaking")));
                      },
                      child: Text(
                        "View All",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              CarouselSlider.builder(
                itemCount: 5,
                itemBuilder: (context, index, realIndex) {
                  String? res = sliders[index].urlToImage!;
                  String? res2 = sliders[index].title!;
                  return buildImage(res, index, res2);
                },
                options: CarouselOptions(
                  height: 230,
                  autoPlay: true,
                  autoPlayAnimationDuration: Duration(seconds: 2),
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  onPageChanged: (index, reason) {
                    setState(() {
                      activeIndex = index;
                    });
                  },
                ),
              ),
              SizedBox(height: 20),
              Center(child: buildBullets()),

              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Trending News",
                          style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily:
                            GoogleFonts
                                .outfit(
                              fontWeight: FontWeight.bold,
                            )
                                .fontFamily,
                          ),
                        ),
                        SizedBox(width: 7),
                        Padding(
                          padding: const EdgeInsets.only(top: 3),
                          child: Icon(
                            Icons.trending_up,
                            size: 30,
                            color: Colors.orange.shade900,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (
                            context) => AllNews(news: "Trending")));
                      },
                      child: Text(
                        "View All",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                child: ListView.builder(
                  itemCount: articles.length,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return BlogTile(
                      imageUrl: articles[index].urlToImage!,
                      title: articles[index].title!,
                      desc: articles[index].description!,
                      url: articles[index].url!,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// custom widget
  Widget buildImage(String image, int index, String name) =>
      Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        child:
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: image,
                height: 230,
                fit: BoxFit.cover,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
              ),
            ),

            Container(
              height: 230,
              margin: EdgeInsets.only(top: 130),
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Text(
                maxLines: 3,
                name,
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xfff0ffff),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      );

  /// custom widget for build indicator
  Widget buildBullets() =>
      AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: 5,
        effect: JumpingDotEffect(
          dotHeight: 14,
          dotWidth: 14,
          activeDotColor: Colors.orange.shade900,
          verticalOffset: 10,
        ),
      );
}

class CategoryTile extends StatelessWidget {
  final image, categoryName;

  CategoryTile({this.image, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryNews(catName: categoryName),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(blurRadius: 4, color: Colors.grey.shade900)],
          borderRadius: BorderRadius.circular(6),
        ),
        margin: EdgeInsets.only(right: 14),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            Image.asset(image, width: 140, height: 80, fit: BoxFit.cover),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black38,
              ),
              width: 140,
              height: 80,
              child: Center(
                child: Text(
                  categoryName,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xfffffaf0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




