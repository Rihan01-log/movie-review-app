import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:review_app/models/profile/function/profileFunction.dart';
import 'package:review_app/models/profile/profilemodel.dart';
import 'package:review_app/screen/editprofile.dart';
import 'package:review_app/screen/login.dart';
import 'package:review_app/screen/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    super.key,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    getProfile();
  }

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
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  ValueListenableBuilder<List<Profilemodel>>(
                    valueListenable: profileNotifier,
                    builder: (context, profileList, child) {
                      if (profileList.isEmpty) {
                        return const CircleAvatar(
                          backgroundImage:
                              AssetImage('asset/sm_5afec9fb7bd04.jpg'),
                          radius: 60,
                        );
                      }

                      final profile = profileList.last;
                      return CircleAvatar(
                        backgroundImage: profile.profileimage != null
                            ? FileImage(File(profile.profileimage!))
                            : const AssetImage('asset/sm_5afec9fb7bd04.jpg')
                                as ImageProvider,
                        radius: 60,
                      );
                    },
                  )
                ],
              ),
            ),
            ValueListenableBuilder(
              valueListenable: profileNotifier,
              builder: (context, profil, child) {
                if (profil.isNotEmpty) {
                  return Text(
                    profil.last.usrNmae ?? 'NAME',
                    style: GoogleFonts.aBeeZee(
                        fontWeight: FontWeight.bold, fontSize: 24),
                  );
                } else {
                  return const Text('No profile data available');
                }
              },
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
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) => const Editprofile()));
                            },
                            child: const Text('Edit Profile')),
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
                          onPressed: () {
                            logOut();
                          },
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
    );
  }

  void logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(isLogged, false);

    Navigator.pushAndRemoveUntil(
      // ignore: use_build_context_synchronously
      context,
      MaterialPageRoute(builder: (ctx) => const Login()),
      (Route<dynamic> route) => false,
    );
  }
}
