import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:lottie/lottie.dart';
import 'package:review_app/screen/donepage.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.black,
              Colors.blueAccent,
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: Container(
            margin: const EdgeInsets.only(top: 100),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Lottie.asset('asset/Animation - 1732509755120.json',
                      height: 200, width: 300),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Name',
                        hintStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Email',
                        hintStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const Gap(20),
                  ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => const Donepage()),
                            (Route<dynamic> route) => false);
                      },
                      label: const Text(
                        'SignUp',
                        style: TextStyle(color: Colors.white),
                      ),
                      icon: const Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(200, 50),
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(15)),
                          backgroundColor: Colors.transparent)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
