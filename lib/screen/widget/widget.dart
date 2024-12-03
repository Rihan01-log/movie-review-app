import 'package:flutter/material.dart';

Widget movie({required String imagePath, required String text}) {
  return Container(
    height: 250,
    width: 150,
    child: Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(3),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}

Widget book({required String imagePath, required String text}) {
  return Container(
    height: 250,
    width: 150,
    child: Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadiusDirectional.circular(3),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    ),
  );
}
