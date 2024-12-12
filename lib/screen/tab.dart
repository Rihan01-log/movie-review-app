import 'package:flutter/material.dart';
import 'package:review_app/screen/addscreen.dart';
import 'package:review_app/screen/bookTab.dart';
import 'package:review_app/screen/movieTab.dart';

class TabPage extends StatefulWidget {
  const TabPage({super.key});

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (ctx) => Addscreen()));
            },
            
          ),
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text(
              "Review",
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
            toolbarHeight: 60,
            bottom: TabBar(
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white,
                indicatorColor: Colors.blue,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: const [
                  Tab(
                    text: 'Movie',
                  ),
                  Tab(
                    text: 'Book',
                  ),
                ]),
          ),
          body: TabBarView(children: [
            MovieTabPage(),
            BookTabpage(),
          ]),
        ));
  }
}
