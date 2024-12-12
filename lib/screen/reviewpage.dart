import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:review_app/constants/textconstants.dart';
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
        title: Text(Textconstants.reviewPage,
            style: GoogleFonts.lato(color: Colors.white)),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (ctx) => const Addscreen()));
        },
        child: const Icon(
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
              decoration: const InputDecoration(
                  hintText: Textconstants.searchBar,
                  suffixIcon: Icon(Icons.search)),
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
                                  const Gap(10),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                          radius: 60,
                                          backgroundImage: data.image != null &&
                                                  data.image!.isNotEmpty
                                              ? FileImage(File(data.image!))
                                              : const AssetImage(
                                                  'asset/sm_5afec9fb7bd04.jpg',
                                                ))
                                    ],
                                  ),
                                  const Gap(10),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            data.name ?? 'Not provided',
                                            style: GoogleFonts.lato(
                                              fontSize: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                          '${Textconstants.namecontainer}:${data.dateofrelease ?? 'Not provided'}'),
                                      Text(
                                          '${Textconstants.typeof}:${data.bookormoviel ?? 'Not provided'}'),
                                      Text(
                                          '${Textconstants.ratings}:${data.rating ?? 'Not provided'}'),
                                      Text(
                                          '${Textconstants.discription}:${data.typesomthing ?? 'Not provided'}'),
                                    ],
                                  ),
                                  // Gap(30),
                                  // IconButton(
                                  //     onPressed: () {}, icon: Icon(Icons.edit))
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
