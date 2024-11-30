import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile',
            style: GoogleFonts.alatsi(color: Colors.white, fontSize: 24)),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.black,
            Colors.blue,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: const CircleAvatar(
                        radius: 70,
                        backgroundImage: AssetImage('asset/man.png'),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'Rihan',
                style:
                    GoogleFonts.aDLaMDisplay(color: Colors.white, fontSize: 26),
              ),
              Card(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                          colors: [Colors.blue, Colors.purpleAccent])),
                  height: 500,
                  width: 400,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 50,
                          width: 350,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: TextButton(
                              onPressed: () {}, child: const Text('Account')),
                        ),
                        Container(
                          height: 50,
                          width: 350,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(30)),
                          child: TextButton(
                              onPressed: () {}, child: const Text('Privacy')),
                        ),
                        Container(
                          height: 50,
                          width: 350,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(30)),
                          child: TextButton(
                              onPressed: () {}, child: const Text('Settings')),
                        ),
                        Container(
                          height: 50,
                          width: 350,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(30)),
                          child: TextButton(
                            onPressed: () {},
                            child: const Text('Log Out'),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
