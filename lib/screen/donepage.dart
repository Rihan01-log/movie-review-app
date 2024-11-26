import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:review_app/screen/homescreen.dart';

class Donepage extends StatefulWidget {
  const Donepage({super.key});

  @override
  State<Donepage> createState() => _DonepageState();
}

class _DonepageState extends State<Donepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Container(
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.black,
                Colors.blueAccent,
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: Lottie.asset('asset/Animation - 1732517473820.json')),
      )),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (ctx) => Homescreen()));
    });
  }
}