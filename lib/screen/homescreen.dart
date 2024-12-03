import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:review_app/screen/widget/widget.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final carousaliImages = [
    'asset/Furiosa-Cover.webp',
    'asset/avengers-endgame2.webp',
    'asset/Colleen-Hover_It-Ends-With-Us_Book-Review-NZ_UK_US_Rating_Honest_About_Buy-640w.webp',
    'asset/maxresdefault.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Critique Corner',
          style: GoogleFonts.alatsi(color: Colors.white, fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(15),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'New Release',
                style: GoogleFonts.lato(color: Colors.black, fontSize: 30),
              ),
            ),
            Gap(10),
            CarouselSlider(
              items: carousaliImages
                  .map((imagePath) => Card(
                        elevation: 5,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.asset(
                            imagePath,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ))
                  .toList(),
              options: CarouselOptions(
                enlargeCenterPage: true,
                autoPlay: true,
                viewportFraction: 1,
                autoPlayCurve: Curves.linear,
              ),
            ),
            Gap(10),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                'Movies',
                style: GoogleFonts.lato(fontSize: 30),
              ),
            ),
            Gap(10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  movie(
                      imagePath: 'asset/intersteller.jpg',
                      text: 'Intersteller'),
                  movie(imagePath: 'asset/spiderman.jpg', text: 'Spiderman'),
                  movie(imagePath: 'asset/madmax.jpg', text: 'Mad Max fury'),
                  movie(
                      imagePath: 'asset/Dark knight.jpg', text: 'Dark Knight'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(
                'Books',
                style: GoogleFonts.lato(fontSize: 30),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    book(
                        imagePath: 'asset/WingsofFireTheLostHeir_1.webp',
                        text: 'Wings of fire'),
                    Gap(25),
                    book(
                        imagePath: 'asset/A diary of young girl.jpg',
                        text: 'A diary of young girl'),
                    Gap(25),
                    book(
                        imagePath: 'asset/fire and blood (1).jpg',
                        text: 'Fire and Blood')
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
