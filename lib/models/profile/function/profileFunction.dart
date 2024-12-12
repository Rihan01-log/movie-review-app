import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:review_app/models/profile/profilemodel.dart';

ValueNotifier<List<Profilemodel>> profileNotifier = ValueNotifier([]);

Future<void> addProfile(Profilemodel values) async {
  final profileDb = await Hive.openBox<Profilemodel>('database');

  await profileDb.add(values);
  getProfile();
}

Future<void> getProfile() async {
  final profileDb = await Hive.openBox<Profilemodel>('database');
  profileNotifier.value.clear();
  profileNotifier.value.addAll(profileDb.values);
  profileNotifier.notifyListeners();
}

Future<void> editProfile(int index, Profilemodel value) async {
  final profileDb = await Hive.openBox<Profilemodel>('database');
  await profileDb.putAt(index, value);
  getProfile();
}
