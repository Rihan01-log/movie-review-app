import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


// ignore: must_be_immutable
class Viewscreen extends StatelessWidget {
  String? name;
  String? releaseDate;
  String? bookOrMovie;
  String? genre;
  String? typesomthing;
  String? images;
  Viewscreen(
      {super.key,
      required this.name,
      required this.releaseDate,
      required this.bookOrMovie,
      required this.genre,
      required this.images,
      required this.typesomthing});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'View Review',
          style: GoogleFonts.lato(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          elevation: 3,
          child: Container(
            height: 500,
            width: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: images != null && images!.isNotEmpty
                      ? FileImage(File(images!))
                      : const AssetImage('asset/video-player.png'),
                ),
                Title(
                  color: Colors.white,
                  child: Text('Name:${name ?? 'not provided'}'),
                ),
                Text('Release Date:${releaseDate ?? 'not provided'}'),
                Text('Book Or Movie:${bookOrMovie ?? 'not provided'}'),
                Text('Genre:${genre ?? 'not provided'}'),
                Text('Discription:${typesomthing ?? 'not provided'}')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
