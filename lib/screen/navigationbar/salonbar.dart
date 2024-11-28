import 'package:flutter/material.dart';
import 'package:review_app/screen/addscreen.dart';
import 'package:review_app/screen/dashboard.dart';
import 'package:review_app/screen/homescreen.dart';
import 'package:review_app/screen/profile.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class SalonbarPage extends StatefulWidget {
  const SalonbarPage({super.key});

  @override
  State<SalonbarPage> createState() => _SalonbarPageState();
}

class _SalonbarPageState extends State<SalonbarPage> {
  int currentIndex = 0;
  List<Widget> reviewPages = [
    Homescreen(),
    Addscreen(),
    DashboardPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: reviewPages[currentIndex],
      bottomNavigationBar: SalomonBottomBar(
          itemShape: StadiumBorder(),
          backgroundColor: Colors.yellow,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.white,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          currentIndex: currentIndex,
          items: [
            SalomonBottomBarItem(icon: Icon(Icons.home), title: Text('Home')),
            SalomonBottomBarItem(icon: Icon(Icons.add), title: Text('Review')),
            SalomonBottomBarItem(
                icon: Icon(Icons.dashboard), title: Text('Dashboard')),
            SalomonBottomBarItem(
                icon: Icon(Icons.person), title: Text('Profile')),
          ]),
    );
  }
}
