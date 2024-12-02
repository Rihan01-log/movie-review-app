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
            
          ],
        ),
      ),
    );
  }
}
