import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:review_app/function/functions.dart';
import 'package:review_app/models/model.dart';
import 'package:review_app/screen/addscreen.dart';
import 'package:review_app/screen/viewscreen.dart';

class Reviewpage extends StatefulWidget {
  const Reviewpage({super.key});

  @override
  State<Reviewpage> createState() => _ReviewpageState();
}

class _ReviewpageState extends State<Reviewpage> {
  String search = '';
  List<ReviewModel> searchList = [];

  @override
  void initState() {
    super.initState();
    getReview();
    searchList = reviewNotifier.value;
  }

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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  search = value;
                  searchUpdate();
                });
              },
              decoration: InputDecoration(
                  hintText: 'Search', suffixIcon: Icon(Icons.search)),
            ),
          ),
          ValueListenableBuilder<List<ReviewModel>>(
            valueListenable: reviewNotifier,
            builder: (context, reviews, child) {
              if (search.isEmpty) {
                searchList = reviews;
              }
              return Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      final data = searchList[index];
                      return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onDoubleTap: () {
                              deleteReview(index);
                            },
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) => Viewscreen(
                                            name: data.name,
                                            releaseDate: data.dateofrelease,
                                            bookOrMovie: data.bookormoviel,
                                            genre: data.genre,
                                            images: data.image,
                                            typesomthing: data.typesomthing,
                                          )));
                            },
                            child: Container(
                              height: 150,
                              width: 400,
                              decoration: BoxDecoration(
                                  color: Colors.amber,
                                  border: Border.all(),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                children: [
                                  Gap(10),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                          radius: 60,
                                          backgroundImage: data.image != null &&
                                                  data.image!.isNotEmpty
                                              ? FileImage(File(data.image!))
                                              : AssetImage(
                                                  'asset/video-player.png',
                                                ))
                                    ],
                                  ),
                                  Gap(10),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data.name ?? 'Not provided',
                                        style: GoogleFonts.lato(
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                          'Release Date:${data.dateofrelease ?? 'Not provided'}'),
                                      Text(
                                          'Type:${data.bookormoviel ?? 'Not provided'}'),
                                      Text(
                                          'Rating:${data.rating ?? 'Not provided'}'),
                                      Text(
                                          'Discripton:${data.typesomthing ?? 'Not provided'}'),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ));
                    },
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemCount: searchList.length),
              );
            },
          ),
        ],
      ),
    );
  }

  void searchUpdate() {
    getReview();
    searchList = reviewNotifier.value
        .where((reviewSearch) =>
            reviewSearch.name != null &&
            reviewSearch.name!.toLowerCase().contains(search.toLowerCase()))
        .toList();
  }
}
