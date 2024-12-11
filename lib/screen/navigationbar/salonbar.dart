import 'package:flutter/material.dart';

import 'package:review_app/screen/dashboard.dart';
import 'package:review_app/screen/homescreen.dart';
import 'package:review_app/screen/profile.dart';
import 'package:review_app/screen/reviewpage.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class SalonbarPage extends StatefulWidget {
  const SalonbarPage({super.key});

  @override
  State<SalonbarPage> createState() => _SalonbarPageState();
}

class _SalonbarPageState extends State<SalonbarPage> {
  int currentIndex = 0;
  List<Widget> reviewPages = [
    const Homescreen(),
    const Reviewpage(),
    const DashboardPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: reviewPages[currentIndex],
      bottomNavigationBar: SalomonBottomBar(
          itemShape: const StadiumBorder(),
          backgroundColor: Colors.white,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          currentIndex: currentIndex,
          items: [
            SalomonBottomBarItem(
                icon: const Icon(Icons.home), title: const Text('Home')),
            SalomonBottomBarItem(
                icon: const Icon(Icons.reviews), title: const Text('Review')),
            SalomonBottomBarItem(
                icon: const Icon(Icons.dashboard),
                title: const Text('Dashboard')),
            SalomonBottomBarItem(
                icon: const Icon(Icons.person), title: const Text('Profile')),
          ]),
    );
  }
}
