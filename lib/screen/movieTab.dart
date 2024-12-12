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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getReview();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
      valueListenable: reviewNotifier,
      builder: (context, value, child) {
        final data = value.where((rew) => rew.bookormoviel == 'Movie').toList();
        return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            final movie = data[index];
            return GestureDetector(
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
                                ? FileImage(File(movie.image ?? 'not provided'))
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
            );
          },
        );
      },
    ));
  }
}
