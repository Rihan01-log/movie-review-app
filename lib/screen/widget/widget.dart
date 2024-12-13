import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

Widget movie({required String imagePath, required String text}) {
  return SizedBox(
    height: 250,
    child: Column(
      children: [
        SizedBox(
          height: 230,
          width: 140,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}

Widget book({required String imagePath, required String text}) {
  return SizedBox(
    height: 250,
    width: 150,
    child: Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadiusDirectional.circular(5),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    ),
  );
}


Widget ygygg({required String 
image}){
  return Container(
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
                                  // backgroundImage: book.image != null &&
                                  //         book.image!.isNotEmpty
                                  //     ? FileImage(File(book.image!))
                                  //     : const AssetImage(
                                  //         'asset/sm_5afec9fb7bd04.jpg',
                                  //       ))
                              )
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
                                   'Not provided',
                                    style: GoogleFonts.lato(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                  'rele'),
                              Text(
                                  'j'),
                              Text(
                                 ''),
                              Text(
                                  ''),
                            ],
                          ),
                          // Gap(30),
                          // IconButton(
                          //     onPressed: () {}, icon: Icon(Icons.edit))j
                        ],
                      ),
                    );
}