import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(70),
              child: Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('asset/man.png'),
                ),
              ),
            ),
            Card(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                        colors: [Colors.blue, Colors.purpleAccent])),
                height: 500,
                width: 400,
                child: Padding(
                  padding: EdgeInsets.all(12),
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
                            onPressed: () {}, child: Text('Account')),
                      ),
                      Container(
                        height: 50,
                        width: 350,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(30)),
                        child: TextButton(
                            onPressed: () {}, child: Text('Privacy')),
                      ),
                      Container(
                        height: 50,
                        width: 350,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(30)),
                        child: TextButton(
                            onPressed: () {}, child: Text('Settings')),
                      ),
                      Container(
                        height: 50,
                        width: 350,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(30)),
                        child: TextButton(
                            onPressed: () {}, child: Text('Log Out')),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
