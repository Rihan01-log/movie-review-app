import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:review_app/constants/textconstants.dart';
import 'package:review_app/function/functions.dart';
import 'package:review_app/models/model.dart';

class Addscreen extends StatefulWidget {
  const Addscreen({super.key});

  @override
  State<Addscreen> createState() => _AddscreenState();
}

class _AddscreenState extends State<Addscreen> {
  File? images;
  final nameCtlr = TextEditingController();
  final dateControler = TextEditingController();
  final genreCtlr = TextEditingController();
  final typsomthingCtlr = TextEditingController();

  int rating = 5;

  String? newValue;

  List<String> bookOrMovie = ['Book', 'Movie'];

  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickDate = await showDatePicker(
        context: context,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
        initialDate: DateTime.now());

    if (pickDate != null) {
      setState(() {
        dateControler.text = pickDate.toString().split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(Textconstants.reviewPage,
            style: GoogleFonts.alatsi(color: Colors.white, fontSize: 24)),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    pickImage();
                  },
                  child: images != null
                      ? CircleAvatar(
                          backgroundImage: FileImage(images!),
                          radius: 60,
                        )
                      : const CircleAvatar(
                          radius: 60,
                          backgroundImage: AssetImage("asset/man.png"),
                        ),
                ),
                const Gap(10),
                const Gap(10),
                TextFormField(
                  controller: nameCtlr,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: Textconstants.nameadd),
                ),
                const Gap(10),
                TextFormField(
                  controller: dateControler,
                  readOnly: true,
                  onTap: () {
                    selectDate(context);
                  },
                  decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.calendar_month),
                      border: OutlineInputBorder(),
                      hintText: Textconstants.dateOfRealese),
                ),
                const Gap(10),
                Padding(
                  padding: const EdgeInsets.all(2),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(border: Border.all()),
                    child: DropdownButton(
                      isExpanded: true,
                      value: newValue,
                      hint: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(Textconstants.bookOrMovie),
                      ),
                      items: bookOrMovie.map((String itme) {
                        return DropdownMenuItem<String>(
                          value: itme,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(itme),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          newValue = value;
                        });
                      },
                    ),
                  ),
                ),
                const Gap(10),
                TextFormField(
                  controller: genreCtlr,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: Textconstants.genre),
                ),
                const Gap(10),
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Text(
                        Textconstants.rating,
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
                Row(
                  children: List.generate(
                    5,
                    (index) {
                      return IconButton(
                        onPressed: () {
                          setState(() {
                            rating = index + 1;
                          });
                        },
                        icon: Icon(
                          index < rating
                              ? Icons.star
                              : Icons.star_border_outlined,
                          color: Colors.amber,
                        ),
                        iconSize: 30,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    maxLines: 3,
                    controller: typsomthingCtlr,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintMaxLines: 6,
                        hintText: Textconstants.typesomthing),
                  ),
                ),
                const Gap(10),
                ElevatedButton(
                  onPressed: () {
                    submitBtn();
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Your review added')));
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(200, 50),
                      backgroundColor: Colors.amber),
                  child: const Text(Textconstants.submitBtn),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void submitBtn() {
    if (nameCtlr.text.isEmpty ||
        dateControler.text.isEmpty ||
        genreCtlr.text.isEmpty ||
        typsomthingCtlr.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Fill the forms'),
        ),
      );
      return;
    }

    final reviewBtn = ReviewModel(
        name: nameCtlr.text,
        dateofrelease: dateControler.text,
        bookormoviel: newValue,
        genre: genreCtlr.text,
        typesomthing: typsomthingCtlr.text,
        image: images?.path,
        rating: rating);
    addReview(reviewBtn);
    Navigator.pop(context);
  }

  Future<void> pickImage() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) {
      return;
    }
    setState(() {
      images = File(returnImage.path);
    });
  }
}
