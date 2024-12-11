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
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: images != null && images!.isNotEmpty
                        ? FileImage(File(images!))
                        : const AssetImage('asset/sm_5afec9fb7bd04.jpg'),
                  ),
                  Title(
                    color: Colors.white,
                    child: Text(
                      'Name: ${name ?? 'not provided'}',
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    'Release Date: ${releaseDate ?? 'not provided'}',
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Type: ${bookOrMovie ?? 'not provided'}',
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Genre:${genre ?? 'not provided'}',
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text('Discription: ${typesomthing ?? 'not provided'}')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
