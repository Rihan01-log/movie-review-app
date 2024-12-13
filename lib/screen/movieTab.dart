import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:review_app/constants/textconstants.dart';
import 'package:review_app/function/functions.dart';
import 'package:review_app/screen/viewscreen.dart';

class MovieTabPage extends StatefulWidget {
  const MovieTabPage({super.key});

  @override
  State<MovieTabPage> createState() => _MovieTabPageState();
}

class _MovieTabPageState extends State<MovieTabPage> {
  final searchMovie = TextEditingController();
  String moevieSearch = '';
  @override
  void initState() {
   
   
    super.initState();
    getReview();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onChanged: (value) {
              setState(() {
                moevieSearch = value;
              });
            },
            decoration: const InputDecoration(
                hintText: Textconstants.searchBar,
                suffixIcon: Icon(Icons.search)),
          ),
        ),
        Expanded(
          child: ValueListenableBuilder(
            valueListenable: reviewNotifier,
            builder: (context, value, child) {
              final data = value
                  .where((rew) =>
                      rew.bookormoviel == 'Movie' &&
                      (rew.name
                              ?.toLowerCase()
                              .contains(moevieSearch.toLowerCase()) ??
                          false))
                  .toList();
              return ListView.separated(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final movie = data[index];
                  return GestureDetector(
                    onDoubleTap: () {
                      deleteReview(index);
                    },
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (ctx) => Viewscreen(
                                  name: movie.name,
                                  releaseDate: movie.dateofrelease,
                                  bookOrMovie: movie.bookormoviel,
                                  genre: movie.genre,
                                  images: movie.image,
                                  typesomthing: movie.typesomthing)));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
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
                                    backgroundImage: movie.image != null &&
                                            movie.image!.isNotEmpty
                                        ? FileImage(
                                            File(movie.image ?? 'not provided'))
                                        : const AssetImage(
                                            'asset/sm_5afec9fb7bd04.jpg',
                                          ))
                              ],
                            ),
                            const Gap(10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      movie.name ?? 'Not provided',
                                      style: GoogleFonts.lato(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                    '${Textconstants.namecontainer}:${movie.dateofrelease ?? 'Not provided'}'),
                                Text(
                                    '${Textconstants.typeof}:${movie.bookormoviel ?? 'Not provided'}'),
                                Text(
                                    '${Textconstants.ratings}:${movie.rating ?? 'Not provided'}'),
                                Text(
                                    '${Textconstants.discription}:${movie.typesomthing ?? 'Not provided'}'),
                              ],
                            ),
                            // Gap(30),
                            // IconButton(
                            //     onPressed: () {}, icon: Icon(Icons.edit))
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
              );
            },
          ),
        ),
      ],
    ));
  }
}
