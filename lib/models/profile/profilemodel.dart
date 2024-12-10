import 'package:hive/hive.dart';
part 'profilemodel.g.dart';

@HiveType(typeId: 1)
class Profilemodel {
  @HiveField(0)
  String? usrNmae;
  @HiveField(1)
  String? email;
  @HiveField(2)
  String? password;
  @HiveField(3)
  String? profileimage;
  Profilemodel(
      {required this.usrNmae,
      required this.email,
      required this.password,
      this.profileimage});
}
