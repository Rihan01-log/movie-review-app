import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:review_app/screen/addscreen.dart';

class Reviewpage extends StatefulWidget {
  const Reviewpage({super.key});

  @override
  State<Reviewpage> createState() => _ReviewpageState();
}

class _ReviewpageState extends State<Reviewpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Review', style: GoogleFonts.lato(color: Colors.white)),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (ctx) => Addscreen()));
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
