import 'package:flutter/material.dart';

Widget movieAndBook({required String imagePath}) {
  return Card(
    elevation: 5,
    child: SizedBox(
      height: 267,
      width: 180,
      child: Column(
        children: [
          Image.asset(imagePath, height: 267, width: 1700, fit: BoxFit.cover),
        ],
      ),
    ),
  );
}
