import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class Addscreen extends StatefulWidget {
  const Addscreen({super.key});

  @override
  State<Addscreen> createState() => _AddscreenState();
}

class _AddscreenState extends State<Addscreen> {
  final dateControler = TextEditingController();

  int rating = 5;
  String? newValue;

  List<String> bookOrMovie = ['Book', 'Movie'];

  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickDate = await showDatePicker(
        context: context,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
        initialDate: DateTime.now());

    if (pickDate != null) {
      setState(() {
        dateControler.text = pickDate.toString().split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text('Review',
            style: GoogleFonts.alatsi(color: Colors.white, fontSize: 24)),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: const CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('asset/man.png'),
                  ),
                ),
                const Gap(10),
                TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Name'),
                ),
                const Gap(10),
                TextFormField(
                  controller: dateControler,
                  readOnly: true,
                  onTap: () {
                    selectDate(context);
                  },
                  decoration: const InputDecoration(
                      suffixIcon: Icon(Icons.calendar_month),
                      border: OutlineInputBorder(),
                      hintText: 'Date of release'),
                ),
                const Gap(10),
                Padding(
                  padding: const EdgeInsets.all(2),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(border: Border.all()),
                    child: DropdownButton(
                      isExpanded: true,
                      value: newValue,
                      hint: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Book or Movie'),
                      ),
                      items: bookOrMovie.map((String itme) {
                        return DropdownMenuItem<String>(
                          value: itme,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(itme),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          newValue = value;
                        });
                      },
                    ),
                  ),
                ),
                const Gap(10),
                TextFormField(
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Genre'),
                ),
                const Gap(10),
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Text(
                        'Rating',
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
                Row(
                  children: List.generate(
                    5,
                    (index) {
                      return IconButton(
                        onPressed: () {
                          setState(() {
                            rating = index + 1;
                          });
                        },
                        icon: Icon(
                          index < rating ? Icons.star : Icons.star_border,
                          color: Colors.amber,
                        ),
                        iconSize: 30,
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintMaxLines: 6,
                        hintText: 'Type somethig'),
                  ),
                ),
                const Gap(10),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Your review added')));
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(200, 50),
                      backgroundColor: Colors.amber),
                  child: const Text('Submit'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
