import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final controller = TextEditingController();
  String gradeLetter = "";
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blueGrey,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "Grade Calculator",
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 100, horizontal: 25),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: controller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: "Type your score",
                      prefixIcon: Icon(
                        Icons.percent,
                        color: Color.fromARGB(255, 255, 0, 0),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                child: ElevatedButton(
                  child: Text(
                    "Calculate".toUpperCase(),
                    style: TextStyle(fontSize: 30),
                  ),
                  onPressed: () {
                    // print(controller.text);

                    int? grade = int.tryParse(controller.text);

                    if (grade == null) {
                      print("${controller.text} is not a number!");
                      return;
                    }
                    if (grade < 0) {
                      print("Grade can't be less than 0");
                    } else if (grade >= 90) {
                      print("A");
                      gradeLetter = "A";
                    } else if (grade >= 80) {
                      print("B");
                      gradeLetter = "B";
                    } else if (grade >= 70) {
                      print("C");
                      gradeLetter = "C";
                    } else if (grade >= 60) {
                      print("D");
                      gradeLetter = "D";
                    } else {
                      print("F");
                      gradeLetter = "F";
                    }
                    setState(() {});
                  },
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: 50, vertical: 10)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    )),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      gradeLetter,
                      style: GoogleFonts.getFont('Roboto Slab',
                          fontSize: 212,
                          color:
                              gradeLetter == "F" ? Colors.red : Colors.black),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


// var x = cond ? true : false; 
