import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        body: Container(
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.black,
              Colors.blue,
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
        ));
  }
}
