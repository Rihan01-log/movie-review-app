import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final List<String> imagesForCarousal = [
    'asset/dladiator2.jpg',
    'asset/sangchi.jpg',
    'asset/venom.jpg',
    'asset/download.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.black,
            Colors.blue,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Gap(15),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      'New Release',
                      style: GoogleFonts.poppins(
                          fontSize: 34, color: Colors.white),
                    ),
                  )
                ],
              ),
              CarouselSlider(
                items: imagesForCarousal
                    .map((imagePath) => Card(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              imagePath,
                              fit: BoxFit.fill,
                              height: 350,
                              width: double.infinity,
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ))
                    .toList(),
                options: CarouselOptions(
                    autoPlay: true,
                    viewportFraction: 1.0,
                    enlargeCenterPage: true,
                    aspectRatio: 16 / 9),
              ),
              Gap(4),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Movie',
                      style: GoogleFonts.poppins(
                          fontSize: 34, color: Colors.white),
                    ),
                  )
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          'asset/Avengers_Endgame.jpg',
                          height: 250,
                          width: 170,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Avengers',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        )
                      ],
                    ),
                    Gap(10),
                    Row(
                      children: [
                        Column(
                          children: [
                            Image.asset(
                              'asset/ironman.jpg',
                              height: 250,
                              width: 188,
                            ),
                            Text(
                              'Iron man',
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ],
                    ),
                    Gap(10),
                    Column(
                      children: [
                        Image.asset('')
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
