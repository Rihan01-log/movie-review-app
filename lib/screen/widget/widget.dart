import 'package:flutter/material.dart';

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
