import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:review_app/constants/textconstants.dart';
import 'package:review_app/function/functions.dart';
import 'package:review_app/screen/viewscreen.dart';

class BookTabpage extends StatefulWidget {
  const BookTabpage({super.key});

  @override
  State<BookTabpage> createState() => _BookTabpageState();
}

class _BookTabpageState extends State<BookTabpage> {
  final searchReview = TextEditingController();
  String search = '';
  @override
  void initState() {
    super.initState();
    getReview();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          onChanged: (value) {
            setState(() {
              search = value;
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
                    rew.bookormoviel == 'Book' &&
                    (rew.name?.toLowerCase().contains(search.toLowerCase()) ??
                        false))
                .toList();
            return ListView.separated(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final book = data[index];
                return GestureDetector(
                  onDoubleTap: () {
                    deleteReview(index);
                  },
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => Viewscreen(
                                name: book.name,
                                releaseDate: book.dateofrelease,
                                bookOrMovie: book.bookormoviel,
                                genre: book.genre,
                                images: book.image,
                                typesomthing: book.typesomthing)));
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
                                  backgroundImage: book.image != null &&
                                          book.image!.isNotEmpty
                                      ? FileImage(File(book.image!))
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
                                    book.name ?? 'Not provided',
                                    style: GoogleFonts.lato(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                  '${Textconstants.namecontainer}:${book.dateofrelease ?? 'Not provided'}'),
                              Text(
                                  '${Textconstants.typeof}:${book.bookormoviel ?? 'Not provided'}'),
                              Text(
                                  '${Textconstants.ratings}:${book.rating ?? 'Not provided'}'),
                              Text(
                                  '${Textconstants.discription}:${book.typesomthing ?? 'Not provided'}'),
                            ],
                          ),
                          // Gap(30),
                          // IconButton(
                          //     onPressed: () {}, icon: Icon(Icons.edit))j
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
    ]));
  }
}
