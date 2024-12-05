import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:review_app/function/functions.dart';
import 'package:review_app/models/model.dart';
import 'package:review_app/screen/addscreen.dart';

class Reviewpage extends StatefulWidget {
  const Reviewpage({super.key});

  @override
  State<Reviewpage> createState() => _ReviewpageState();
}

class _ReviewpageState extends State<Reviewpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Review', style: GoogleFonts.lato(color: Colors.white)),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (ctx) => Addscreen()));
        },
        child: Icon(
          Icons.add,
        ),
      ),
      body: ValueListenableBuilder<List<ReviewModel>>(
        valueListenable: reviewNotifier,
        builder: (context, reviews, child) {
          return ListView.separated(
              itemBuilder: (context, index) {
                final data = reviews[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 150,
                    width: 400,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.name!,
                          style: GoogleFonts.lato(
                            fontSize: 20,
                          ),
                        ),
                        Text(data.dateofrelease!),
                        Text(data.bookormoviel!),
                        Text(data.genre!),
                        Text(data.typesomthing!),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemCount: reviews.length);
        },
      ),
    );
  }
}
