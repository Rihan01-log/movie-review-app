import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:review_app/models/model.dart';

ValueNotifier<List<ReviewModel>> reviewNotifier = ValueNotifier([]);

Future<void> addReview(ReviewModel values) async {
  final reviewDb = await Hive.openBox<ReviewModel>('review database');
  await reviewDb.add(values);
  getReview();
}

Future<void> getReview() async {
  final reviewDb = await Hive.openBox<ReviewModel>('review database');
  reviewNotifier.value.clear();
  reviewNotifier.value.addAll(reviewDb.values);
  reviewNotifier.notifyListeners();
}

Future<void> editReview(int index, ReviewModel value) async {
  final reviewDb = await Hive.openBox<ReviewModel>('review database');
  await reviewDb.putAt(index, value);
  getReview();
}

Future<void> deleteReview(int index) async {
  final reviewDb = await Hive.openBox<ReviewModel>('review database');
  reviewDb.deleteAt(index);
  getReview();
}
