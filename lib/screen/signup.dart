import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:review_app/screen/donepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

const userkey = 'userkey';
const passkey = 'passkey';
const isLogged = 'isLogged';

class _SignupState extends State<Signup> {
  final nameCtlr = TextEditingController();
  final emailCtlr = TextEditingController();
  final passwordCtlr = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'asset/colash.webp',
              fit: BoxFit.cover,
            ),
            Container(
              color: Colors.black.withOpacity(.4),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: nameCtlr,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintText: 'Name',
                        hintStyle: const TextStyle(
                            color: Color.fromARGB(255, 251, 233, 233)),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.4)),
                  ),
                ),
                const Gap(6),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: emailCtlr,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintText: 'Email',
                        hintStyle: const TextStyle(
                            color: Color.fromARGB(255, 251, 233, 233)),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.4)),
                  ),
                ),
                const Gap(6),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: passwordCtlr,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: const TextStyle(
                            color: Color.fromARGB(255, 251, 233, 233)),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.4)),
                  ),
                ),
                const Gap(6),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      checkSign();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red.withOpacity(0.5)),
                    child: const Text(
                      'SignIn',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void checkSign() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final nametext = nameCtlr.text;
    final emailText = emailCtlr.text;
    final passText = passwordCtlr.text;
    if (nametext.isEmpty || emailText.isEmpty || passText.isEmpty) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Fill the forms')));
    } else {
      prefs.setString('namekey', nametext);
      prefs.setString(userkey, emailText);
      prefs.setString(passkey, passText);
      prefs.setBool(isLogged, true);

      Navigator.pushAndRemoveUntil(
        // ignore: use_build_context_synchronously
        context,
        MaterialPageRoute(builder: (ctx) => const Donepage()),
        (Route<dynamic> route) => false,
      );
    }
  }
}
