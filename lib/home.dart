
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors:[
              Color.fromARGB(100, 112, 225, 245),
              Color.fromARGB(100, 255, 209, 148)], // Light Orange to Light Blue
              begin: Alignment.topLeft,
              end: Alignment.topRight,
            )
          ),

        ),
        title:Row(
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
        Container(
          margin:EdgeInsets.only(left:20),
          color: Color(0xfff0f8ff),

          child:Column(
            children: [
              Row(
                children: [
                  Text("Hottest News")

                ],
                
              )

            ],
          ),
        )
    );
  }
}
