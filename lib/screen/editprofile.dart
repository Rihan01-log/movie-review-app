import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:review_app/models/profile/function/profileFunction.dart';
import 'package:review_app/models/profile/profilemodel.dart';

class Editprofile extends StatefulWidget {
  const Editprofile({
    super.key,
  });

  @override
  State<Editprofile> createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  final editName = TextEditingController();
  final editEmail = TextEditingController();
  final editPass = TextEditingController();
  File? selectimage;
  @override
  void initState() {
    super.initState();
    takeFrom();
    getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Edit Profile',
          style: GoogleFonts.lato(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          elevation: 5,
          child: SizedBox(
            height: 500,
            width: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    pickImage();
                  },
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage: selectimage != null
                        ? FileImage(File(selectimage!.path))
                        : const AssetImage('asset/sm_5afec9fb7bd04.jpg')
                            as ImageProvider,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: editName,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: 'Name'),
                  ),
                ),
                const Gap(10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: editEmail,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: 'Email'),
                  ),
                ),
                const Gap(10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: editPass,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: "Password"),
                  ),
                ),
                const Gap(10),
                ElevatedButton(
                  onPressed: () {
                    saveButton();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      minimumSize: const Size(100, 50)),
                  child: const Text(
                    'Save',
                    style: TextStyle(color: Colors.black),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> pickImage() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) {
      return;
    }
    setState(() {
      selectimage = File(returnImage.path);
    });
  }

  Future<void> takeFrom() async {
    var input = await Hive.openBox<Profilemodel>('database');
    List<Profilemodel> profileList = input.values.toList();
    if (profileList.isNotEmpty) {
      var profile = profileList.last;
      setState(() {
        editName.text = profile.usrNmae!;
        editEmail.text = profile.email!;
        editPass.text = profile.password!;
        selectimage =
            profile.profileimage != null ? File(profile.profileimage!) : null;
      });
    }
  }

  Future<void> saveButton() async {
    final save = Profilemodel(
        usrNmae: editName.text,
        email: editEmail.text,
        password: editPass.text,
        profileimage: selectimage?.path);
    var input = await Hive.openBox<Profilemodel>('database');

    input.putAt(input.values.length - 1, save);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Your Profile is updated'),
      ),
    ); 

    Navigator.pop(context);
  }
}
