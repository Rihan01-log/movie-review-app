import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:review_app/screen/login.dart';
import 'package:review_app/screen/navigationbar/salonbar.dart';
import 'package:review_app/screen/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.black,
            Colors.blueAccent,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Lottie.asset('asset/Animation - 1732519087545.json',
            //     repeat: true, height: 200, width: 350),
            const Gap(30),
            Text('Welcome!',
                style: GoogleFonts.irishGrover(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
          ],
        ),
      ),
    );
  }

  void checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final check = prefs.getBool(isLogged);
    if (check == true) {
      Timer(
        const Duration(seconds: 2),
        () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (ctx) => const SalonbarPage()),
        ),
      );
    } else {
      Timer(
          const Duration(seconds: 2),
          () => Navigator.pushReplacement(
                // ignore: use_build_context_synchronously
                context,
                MaterialPageRoute(builder: (ctx) => const Login()),
              ));
    }
  }
}
