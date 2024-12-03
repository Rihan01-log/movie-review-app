import 'package:hive/hive.dart';
    part 'model.g.dart';
@HiveType(typeId: 0)
class ReviewModel {
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? dateofrelease;
  @HiveField(2)
  String? bookormoviel;
  @HiveField(3)
  String? genre;
  @HiveField(4)
  String? typesomthing;
  ReviewModel(
      {required this.name,
      required this.dateofrelease,
      required this.bookormoviel,
      required this.genre,
      required this.typesomthing});
}
