import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
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
          children: [
            const TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search)),
            ),
            Lottie.asset('asset/Animation - 1732938970121.json',
                repeat: true, height: 250, width: 400),
            const Divider(),
            const Gap(5),
            Text(
              'Reviews',
              style: GoogleFonts.alata(
                fontSize: 30,
              ),
            ),
            const Gap(10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 167,
                width: 400,
                decoration: BoxDecoration(
                    border: Border.all(),
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  
                  children: [
                    Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            'asset/A_Song_of_Ice_and_Fire_book_collection_box_set_cover.jpg',
                            height: 165,
                            width: 100,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Name: A song of ice and fire'),
                          Text('Date: 01/08/1998'),
                          Text('Genre:Action'),
                          Row(
                            children: [
                              Icon(Icons.star),
                              Icon(Icons.star),
                              Icon(Icons.star),
                              Icon(Icons.star),
                              Icon(Icons.star),
                            ],
                          ),
                          Text(
                              'Discription:A Song of Ice and Fire depict\nviolent world dominated by political\nrealism')
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 167,
              width: 400,
              decoration: BoxDecoration(
                  border: Border.all(),
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'asset/download.jpg',
                          height: 165,
                          width: 100,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Name: Kishkindha Kaandam'),
                        Text('Date: 19/11/2024'),
                        Text('Genre:Thriller'),
                        Row(
                          children: [
                            Icon(Icons.star),
                            Icon(Icons.star),
                            Icon(Icons.star),
                            Icon(Icons.star),
                            Icon(Icons.star),
                          ],
                        ),
                        Text(
                            'Discription:An emotional thriller \nshowcasing the suppressed '),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
