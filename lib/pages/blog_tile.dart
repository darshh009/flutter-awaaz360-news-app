import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'article_view.dart';

class BlogTile extends StatelessWidget {
  String imageUrl, title, desc,url;
  BlogTile({required this.imageUrl, required this.title, required this.desc,required this.url});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context,MaterialPageRoute(builder:(context) => ArticleView(blogUrl:url)));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 4.0),
        child: SingleChildScrollView(
          child: Material(
            borderRadius: BorderRadius.circular(5),
            shadowColor: Colors.blue.shade100,
            elevation: 8,
            color: Colors.orange.shade50,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(imageUrl: imageUrl,
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  SizedBox(width:8.0),
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width/2.2,
                        child: Text(title,
                          maxLines:3 ,
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue.shade900,
                              fontFamily: GoogleFonts.aBeeZee().fontFamily
                          ),

                        ),

                      ),
                      SizedBox(height: 8),

                      Container(
                        width: MediaQuery.of(context).size.width/2.2,
                        child: Text(desc,
                          maxLines: 3,
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: GoogleFonts.alice().fontFamily,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54
                          ),

                        ),

                      )
                    ],

                  )


                ],

              ),
            ),
          ),
        ),
      ),
    );
  }
}