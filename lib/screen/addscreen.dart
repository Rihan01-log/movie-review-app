import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class Addscreen extends StatefulWidget {
  const Addscreen({super.key});

  @override
  State<Addscreen> createState() => _AddscreenState();
}

class _AddscreenState extends State<Addscreen> {
  
  int rating = 5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text('Review',
            style: GoogleFonts.alatsi(color: Colors.white, fontSize: 24)),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('asset/man.png'),
                  ),
                ),
                Gap(10),
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'name'),
                ),
                Gap(10),
                TextFormField(
                  
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Year'),
                ),
                Gap(10),
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'name'),
                ),
                Gap(10),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Text(
                        'Rating',
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
                Row(
                  children: List.generate(
                    5,
                    (index) {
                      return IconButton(
                        onPressed: () {
                          setState(() {
                            rating = index + 1;
                          });
                        },
                        icon: Icon(
                          index < rating ? Icons.star : Icons.star_border,
                          color: Colors.amber,
                        ),
                        iconSize: 30,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintMaxLines: 6,
                        hintText: 'Type somethig'),
                  ),
                ),
                Gap(10),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Submit'),
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(200, 50),
                      backgroundColor: Colors.amber),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
