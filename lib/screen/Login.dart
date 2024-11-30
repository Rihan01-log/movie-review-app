import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:lottie/lottie.dart';
import 'package:review_app/screen/donepage.dart';
import 'package:review_app/screen/signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                  Lottie.asset('asset/Animation - 1732511714272.json',
                      height: 250, width: 250),
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
                  const Gap(15),
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => const Donepage()));
                      },
                      label: const Text(
                        'Login',
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don\'t have any account?'),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) => const Signup()));
                        },
                        child: const Text(
                          'SignUp',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
